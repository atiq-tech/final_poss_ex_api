import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_cash_transaction_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_get_bank_transaction_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_get_cash_transaction_class.dart';
import 'package:poss/const_page.dart';

class ApiAllGetBankTransactions {
  static GetApiAllGetBankTransactions(
      context, String? dateFrom, String? dateTo) async {
    String Link = "${BaseUrl}api/v1/getAllBankTransactions";
    List<AllGetBankTransactionClass> allGetBankTransactionslist = [];
    AllGetBankTransactionClass allGetBankTransactionClass;
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
      print("Get bank Transactions Get bank Transactions:::${response.data}");
      print("===========++++++=============");
      print("Get bank Transactions Get bank Transactions");
      print("============++++++=========");

      var data = jsonDecode(response.data);
      print("===========Bank Transactions Bank Transactions=======: ${data}");
      for (var i in data) {
        allGetBankTransactionClass = AllGetBankTransactionClass.fromJson(i);
        allGetBankTransactionslist.add(allGetBankTransactionClass);
      }

      print(
          "Get Get Bank Transactions length is ${allGetBankTransactionslist.length}  ${allGetBankTransactionslist[0].accountName}");
    } catch (e) {
      print("Something is wrong all Get GEt bbank Transactions list=======:$e");
    }
    return allGetBankTransactionslist;
  }
}
