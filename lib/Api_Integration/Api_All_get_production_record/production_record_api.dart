// import 'dart:convert';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
// import 'package:poss/Api_Integration/Api_Modelclass/production_record_model_class.dart';
// import 'package:poss/const_page.dart';

// class ApiallProductionRecord {
// static GetApiProductionRecord(context) async {
//     String Link = "${BaseUrl}api/v1/getProductionRecord";
//     List<ProductionRecordModelClass> allProductionRecordlist = [];
//     ProductionRecordModelClass productionRecordModelClass;
//     try {
//       var Response = await http.post(
//           Uri.parse("http://testapi.happykhata.com/api/v1/getProductionRecord"),
//           headers: {
//             "Authorization": "Bearer ${GetStorage().read("token")}",
//           },
//           body: {});
//       print("=========ddddddddddddddddddddddddd==========:::${Response.body}");
//       print("ggggggggggggggggggggggggggggggggggggggg");

//       if (Response.statusCode == 200) {
//         var data = jsonDecode(Response.body);
//         print("this is=====aaaaapppppiiii====dada : ${data}");
//         for (var i in data) {
//           productionRecordModelClass = ProductionRecordModelClass.fromJson(i);
//           allProductionRecordlist.add(productionRecordModelClass);
//         }
//       }
//     } catch (e) {
//       print("Something is errror:$e");
//     }
//     return allProductionRecordlist;
//   }
// }
