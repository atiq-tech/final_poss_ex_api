import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_suppliers_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/production_record_model_class.dart';
import 'package:poss/const_page.dart';
import 'package:http/http.dart' as http;

class ApiAllSuppliers {
  static GetApiAllSuppliers(context) async {
    //String Link = "${BaseUrl}api/v1/getSuppliers";
    List<AllSuppliersClass> allSupplierslist = [];
   AllSuppliersClass allSuppliersClass;
    try {
      var Response = await http.post(
          Uri.parse("http://testapi.happykhata.com/api/v1/getSuppliers"),
          headers: {
            "Authorization": "Bearer ${GetStorage().read("token")}",
          },
          body: {});
      print("===Get======Ssssupplierssssssss==========:::${Response.body}");
      print("Supplier data=====Supplier data");

      var data = jsonDecode(Response.body);
      print("=====this is==Supplier data===aaaaapppppiiii====dada : ${data}");
      for (var i in data) {
        allSuppliersClass = AllSuppliersClass.fromJson(i);
        allSupplierslist.add(allSuppliersClass);
       
      }
    } catch (e) {
      print("Something is wrong:$e");
    }
    return allSupplierslist;
  }
}
