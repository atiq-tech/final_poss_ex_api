import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_cash_transaction_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_get_cash_transaction_class.dart';
import 'package:poss/const_page.dart';

class ApiAllGetCashTransactions {
  static GetApiAllGetCashTransactions(
      context, String? dateFrom, String? dateTo) async {
    String Link = "${BaseUrl}api/v1/getCashTransactions";
    List<AllGetCashTransactionsClass> allGetCashTransactionslist = [];
    AllGetCashTransactionsClass allGetCashTransactionsClass;
    try {
      Response response = await Dio().post(Link,
          data: {
            "dateFrom": "$dateFrom",
            "dateTo": "$dateTo",
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
      print("GetCashTransactions GetCashTransactions:::${response.data}");
      print("===========++++++=============");
      print("GetCashTransactions GetCashTransactions");
      print("============++++++=========");

      var data = jsonDecode(response.data);
      print("===========CashTransactions CashTransactions=======: ${data}");
      for (var i in data) {
        allGetCashTransactionsClass = AllGetCashTransactionsClass.fromJson(i);
        allGetCashTransactionslist.add(allGetCashTransactionsClass);
      }

      print(
          "Get Get CashTransactions length is ${allGetCashTransactionslist.length}");
    } catch (e) {
      print("Something is wrong all Get GET CashTransactions list=======:$e");
    }
    return allGetCashTransactionslist;
  }
}
