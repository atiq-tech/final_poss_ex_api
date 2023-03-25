import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_bank_transaction_model_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_cash_transaction_class.dart';
import 'package:poss/const_page.dart';

class ApiAllBankTransactions {
  static GetApiAllBankTransactions(context,String ?accountId,String ?dateFrom,String ?dateTo,String ?transactionType) async {
    String Link = "${BaseUrl}api/v1/getAllBankTransactions";
    List<AllBankTransactionModelClass> allBankTransactionslist = [];
    AllBankTransactionModelClass allBankTransactionModelClass;
    try {
      Response response = await Dio().post(Link,
          data: {
           
             "accountId": "$accountId",             
              "dateFrom": "$dateFrom",
              "dateTo": "$dateTo",
              "transactionType":"$transactionType",
              },

          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
      print("BankTransactions BankTransactions:::${response.data}");
      print("===========++++++=============");
      print("BankTransactions BankTransactions");
     

      var data = jsonDecode(response.data);
      print("Transactions Bank Bank Bank Transactions=======: ${data}");
      for (var i in data) {
        allBankTransactionModelClass = AllBankTransactionModelClass.fromJson(i);
        allBankTransactionslist.add(allBankTransactionModelClass);
      }
    
      print("Bank Transactions length is ${allBankTransactionslist.length}");
    } catch (e) {
      print("Something is wrong all Bank Transactions list=======:$e");
    }
    return allBankTransactionslist;
  }
}
