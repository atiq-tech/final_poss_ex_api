import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_customers_Class.dart';
import 'package:poss/const_page.dart';
import 'package:http/http.dart' as http;

class ApiAllCustomers {
  static GetApiAllCustomers(context) async {
  
    List<AllCustomersClass> allCustomerslist = [];
    AllCustomersClass allCustomersClass;
    try {
      var Response = await http.post(
          Uri.parse("http://testapi.happykhata.com/api/v1/getCustomers"),
          headers: {
            "Authorization": "Bearer ${GetStorage().read("token")}",
          },
          body: {});
      print("Customers daaaaaaaaaaaaaaaaaataaaaaaaaaaaaa:::${Response.body}");
      print("======================");
      print("++++++++++++++++++++++++++");
 

      var data = jsonDecode(Response.body);
      print("+++++====+++++customer all++++===data;;;;;: ${data}");
      for (var i in data) {
        allCustomersClass = AllCustomersClass.fromJson(i);
        allCustomerslist.add(allCustomersClass);
      
      }
    } catch (e) {
      print("Something is wrong all Customers list=======:$e");
    }
    return allCustomerslist;
  }
}
