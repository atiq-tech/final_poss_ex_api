import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:poss/common_widget/custom_appbar.dart';


class CashViewPage extends StatefulWidget {
  const CashViewPage({super.key});

  @override
  State<CashViewPage> createState() => _CashViewPageState();
}

class _CashViewPageState extends State<CashViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cash View"),
      body: Container(
        padding: EdgeInsets.all(6.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(248, 240, 248, 194),
                    border:
                        Border.all(color: Color.fromARGB(255, 218, 214, 214)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cases_sharp,
                        size: 30.0,
                      ),
                      Text(
                        "Cash Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14.0),
                      ),
                      Text(
                        "tk.7,599.04",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(248, 240, 248, 194),
                    border:
                        Border.all(color: Color.fromARGB(255, 218, 214, 214)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.balance,
                        size: 30.0,
                      ),
                      Text(
                        "Bank Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14.0),
                      ),
                      Text(
                        "tk.7,599.04",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color.fromARGB(248, 240, 248, 194),
                    border:
                        Border.all(color: Color.fromARGB(255, 218, 214, 214)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 30.0,
                      ),
                      Text(
                        "Total Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14.0),
                      ),
                      Text(
                        "tk.7,599.04",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 390.0,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount:8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 6 / 4),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Color.fromARGB(255, 218, 214, 214)),
                        color: Color.fromARGB(255, 182, 220, 252),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 2, 74, 133),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                    )),
                                child: Center(
                                    child: Icon(
                                  Icons.monetization_on_outlined,
                                  color: Colors.white,
                                )),
                              )),
                          Expanded(
                              flex: 7,
                              child: Container(
                                color: Color.fromARGB(255, 200, 230, 255),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Islami Bank"),
                                    Text("tk.20000.0"),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    );
                 
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
