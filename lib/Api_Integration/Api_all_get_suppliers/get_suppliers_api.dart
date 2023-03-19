import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/get_supplier_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/production_record_model_class.dart';
import 'package:poss/const_page.dart';
import 'package:http/http.dart' as http;

class GetSuppliersApi {
  static GetApiGetSupplier(context) async {
    String Link = "${BaseUrl}api/v1/getSuppliers";
    List<GetSupplierClass> getSupplierlist = [];
    GetSupplierClass getSupplierClass;
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
        getSupplierClass = GetSupplierClass.fromJson(i);
        getSupplierlist.add(getSupplierClass);
        print(getSupplierlist);
      }
    } catch (e) {
      print("Something is wrong:$e");
    }
    return getSupplierlist;
  }
}
