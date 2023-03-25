import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_accounts_model_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_bank_account_model_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_customers_Class.dart';
import 'package:poss/const_page.dart';
import 'package:http/http.dart' as http;

class ApiAllBankAccounts {
  static GetApiAllBankAccounts(context) async {
    
    List<AllBankAccountModelClass> allBankAccountlist = [];
    AllBankAccountModelClass allBankAccountModelClass;
    try {
      var Response = await http.post(
          Uri.parse("http://testapi.happykhata.com/api/v1/getBankAccounts"),
          headers: {
            "Authorization": "Bearer ${GetStorage().read("token")}",
          },
          body: {});
      print("Accounts BankAccounts Accounts daaaaaaaaaaaaaaaaaataaaaaaaaaaaaa:::${Response.body}");
      print("BankAccounts Accounts BankAccounts");
      print("++++++++++++++++++++++++++");
      print("Accounts BankAccounts Accounts");

      var data = jsonDecode(Response.body);
      print("+++++====+++++Accounts Accounts Accounts all++++===data;;;;;: ${data}");
      for (var i in data) {
        allBankAccountModelClass = AllBankAccountModelClass.fromJson(i);
       allBankAccountlist.add(allBankAccountModelClass);
        print("BankAccounts ${allBankAccountlist }");
      }
    } catch (e) {
      print("Something is wrong all BankAccounts list=======:$e");
    }
    return allBankAccountlist ;
  }
}
