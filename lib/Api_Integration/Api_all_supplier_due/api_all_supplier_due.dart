import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_supplier_due_class.dart';
import 'package:poss/const_page.dart';

class ApiAllSupplierDue{

    static GetApiAllSupplierDue(
      context, String? supplierId) async {
    String Link = "${BaseUrl}api/v1/getSupplierDue";
    List<AllSupplierDueClass> allSupplierDuelist = [];
    AllSupplierDueClass allSupplierDueClass;
    try {
      Response response = await Dio().post(Link,
          data: {
            "supplierId": "$supplierId",

          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
   

      var data = jsonDecode(response.data);
      print("ProductLedgerr===========ProductLedgerr: ${data}");
      for (var i in data) {
        allSupplierDueClass = AllSupplierDueClass.fromJson(i);
        allSupplierDuelist.add(allSupplierDueClass);
      }
      print("allSupplierDueClass===========allSupplierDueClass=======allSupplierDueClass");
      print("allSupplierDueClass length is==${allSupplierDuelist.length}");
    } catch (e) {
      print("Something is wrong allSupplierDueClass=======:$e");
    }
    return allSupplierDuelist;
  }
}