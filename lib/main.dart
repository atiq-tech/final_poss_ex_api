import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poss/hive/hive/product.dart';
import 'package:poss/home_page.dart';
import 'package:poss/login_page/log_in_page.dart';
import 'package:poss/providers/counter_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(ProductDetailsAdapter());
  // Opening the box
  await Hive.openBox('productBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Happy Khata',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: HomePage());
          home: LogInPage()),
    );
  }
}
