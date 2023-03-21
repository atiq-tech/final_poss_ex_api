import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_products_class.dart';
import 'package:http/http.dart'as http;

class ApiAllProducts{
   static GetApiAllProducts(context) async {
    //String Link = "${BaseUrl}api/v1/getCustomers";
    List<AllProductsClass> allProductslist = [];
    AllProductsClass allProductsClass;
    try {
      var Response = await http.post(
          Uri.parse("http://testapi.happykhata.com/api/v1/getProducts"),
          headers: {
            "Authorization": "Bearer ${GetStorage().read("token")}",
          },
          body: {});
      print("Products pppppppppppppppddddddddddddd:::${Response.body}");
      print("pppppppppppppp");
      print("++++++++++++++++++++++++++");
      print("ppppppppppppppppppp");

      var data = jsonDecode(Response.body);
      print("+++++====+++++product all++++===data;;;;;: ${data}");
      for (var i in data) {
        allProductsClass = AllProductsClass.fromJson(i);
       allProductslist.add(allProductsClass);
        // print(allCustomerslist);
      }
    } catch (e) {
      print("Something is wrong all Products list=======:$e");
    }
    return allProductslist;
  }
}