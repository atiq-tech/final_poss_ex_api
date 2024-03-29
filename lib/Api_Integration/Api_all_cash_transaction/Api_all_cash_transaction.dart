import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_cash_transaction_class.dart';
import 'package:poss/const_page.dart';

class ApiAllCashTransactions {
  static GetApiAllCashTransactions(context, String? transactionType,
      String? accountId, String? dateFrom, String? dateTo) async {
    String Link = "${BaseUrl}api/v1/getCashTransactions";
    List<AllCashTransactionsClass> allCashTransactionslist = [];
    AllCashTransactionsClass allCashTransactionsClass;
    try {
      Response response = await Dio().post(Link,
          data: {
            "transactionType": "$transactionType",
            "accountId": "$accountId",
            "dateFrom": "$dateFrom",
            "dateTo": "$dateTo",
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
      print("CashTransactions CashTransactions:::${response.data}");
      print("===========++++++=============");
      print("CashTransactions CashTransactions");
      print("============++++++=========");

      var data = jsonDecode(response.data);
      print("===========CashTransactions CashTransactions=======: ${data}");
      for (var i in data) {
        allCashTransactionsClass = AllCashTransactionsClass.fromJson(i);
        allCashTransactionslist.add(allCashTransactionsClass);
      }

      print("CashTransactions length is ${allCashTransactionslist.length}");
    } catch (e) {
      print("Something is wrong all CashTransactions list=======:$e");
    }
    return allCashTransactionslist;
  }
}
