import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_add_cash_transactions_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_cash_transaction_class.dart';
import 'package:poss/const_page.dart';

class ApiAllAddCustomerPayment {
  static GetApiAllAddCustomerPayment(
    context,
    String? account_id,
    String? amount,
    String? note,
    String? transaction_date,
    int? transaction_id,
    String? transaction_type,
  ) async {
    String Link = "${BaseUrl}api/v1/addCustomerPayment";

    try {
      Response response = await Dio().post(Link,
          data: {
          
            "account_id": "$account_id",
            "amount": "$amount",
            "note": "$note",
            "transaction_date": "$transaction_date",
            "transaction_id": "$transaction_id",
            "transaction_type": "$transaction_type",
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
      print("Bank Transactions Bank Transactions:::${response.data}");
      print("===========++++++=============");
      print("Add bank Transactions Add bank Transactions");
      print("============++++++=========");

      var data = jsonDecode(response.data);

      print("Add bank Transactions length is ${data}");
    } catch (e) {
      print("Something is wrong all Add bank Transactions list=======:$e");
    }
  }
}
