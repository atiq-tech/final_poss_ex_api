import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_add_cash_transactions_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_cash_transaction_class.dart';
import 'package:poss/const_page.dart';

class ApiAllAddCashTransactions {
  static GetApiAllAddCashTransactions(
    context,
    String? Acc_SlID,
    int? In_Amount,
    int? Out_Amount,
    String? Tr_Description,
    String? Tr_Id,
    int? Tr_SlNo,
    String? Tr_Type,
    String? Tr_account_Type,
    String? Tr_date,
  ) async {
    String Link = "${BaseUrl}api/v1/addCashTransaction";

    try {
      Response response = await Dio().post(Link,
          data: {
            "Acc_SlID": "$Acc_SlID",
            "In_Amount": 0,
            "Out_Amount": 0,
            "Tr_Description": "$Tr_Description",
            "Tr_Id": "$Tr_Id",
            "Tr_SlNo": 0,
            "Tr_Type": "$Tr_Type",
            "Tr_account_Type": "$Tr_account_Type",
            "Tr_date": "$Tr_date",
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
      print("CashTransactions CashTransactions:::${response.data}");
      print("===========++++++=============");
      print("Add CashTransactions Add CashTransactions");
      print("============++++++=========");

      var data = jsonDecode(response.data);

      print("Add CashTransactions length is ${data}");
    } catch (e) {
      print("Something is wrong all Add CashTransactions list=======:$e");
    }
  }
}
