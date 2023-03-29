import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_accounts_model_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_bank_account_model_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_customers_Class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_get_supplier_class.dart';
import 'package:poss/const_page.dart';
import 'package:http/http.dart' as http;

class ApiAllNewGetSuppliers {
  static GetApiAllNewGetSuppliers(context) async {
    
      List<AllGetSupplierClass> allGetSupplierslist = [];
      AllGetSupplierClass allGetSupplierClass;
    try {
      var Response = await http.post(
          Uri.parse("http://testapi.happykhata.com/api/v1/getSuppliers"),
          headers: {
            "Authorization": "Bearer ${GetStorage().read("token")}",
          },
          body: {});
      print("New Get Suppliers daaaaaaaaaaaaaaaaaataaaaaaaaaaaaa:::${Response.body}");
      print("New Get Suppliers New Get Suppliers New Get Suppliers");



      var data = jsonDecode(Response.body);
      print("New Get Suppliers New Get Suppliers===data;;;;;: ${data}");
      for (var i in data) {
          allGetSupplierClass = AllGetSupplierClass.fromJson(i);
          allGetSupplierslist.add(allGetSupplierClass);
       
      }
    } catch (e) {
      print("Something is wrong New Get Suppliers=======:$e");
    }
    return allGetSupplierslist ;
  }
}

