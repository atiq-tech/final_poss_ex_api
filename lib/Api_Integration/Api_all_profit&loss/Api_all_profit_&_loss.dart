import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/const_page.dart';
import 'package:http/http.dart' as http;

class ApiAllProfitLoss {
  static GetApiAllProfitLoss(context) async {
    String Link = "${BaseUrl}api/v1/getProfitLoss";
    List<AllProfitLossClass> allProfitLosslist = [];
    AllProfitLossClass allProfitLossClass;
    try {
      var Response = await http.post(
          Uri.parse("http://testapi.happykhata.com/api/v1/getProfitLoss"),
          headers: {
            "Authorization": "Bearer ${GetStorage().read("token")}",
          },
          body: {
             "Customer_SlNo": "3264",
          });
      print("Profit=====================Loss:::${Response.body}");
      print("===========++++++=============");
      print("++++++++++++++++++++++++++");
      print("============++++++=========");

      var data = jsonDecode(Response.body);
      print("ProfitLoss===========ProfitLoss=======ProfitLoss: ${data}");
      for (var i in data) {
        allProfitLossClass = AllProfitLossClass.fromJson(i);
        allProfitLosslist.add(allProfitLossClass);
        print("Myyyyyyy profit & lossssss${allProfitLosslist}");
      }
    } catch (e) {
      print("Something is wrong all Customers list=======:$e");
    }
    return allProfitLosslist;
  }
}
