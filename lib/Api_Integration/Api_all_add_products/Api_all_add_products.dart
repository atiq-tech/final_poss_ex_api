import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_add_cash_transactions_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_cash_transaction_class.dart';
import 'package:poss/const_page.dart';

class ApiAllAddSupplierPayment {
  static GetApiAllAddSupplierPayment(
    context,
    String? ProductCategory_ID,
    String? Product_Code,
    String? Product_Name,
    String? Product_Purchase_Rate,
    String? Product_ReOrederLevel,
    String? Product_SellingPrice,
    String? Product_SlNo,
    String? Product_WholesaleRate,
    String? Unit_ID,
    String? brand,
    String? is_service,
    String? vat,
  ) async {
    String Link = "${BaseUrl}api/v1/addSupplierPayment";

    try {
      Response response = await Dio().post(Link,
          data: {
            "ProductCategory_ID": "$ProductCategory_ID",
            "Product_Code": "$Product_Code",
            "Product_Name": "$Product_Name",
            "Product_Purchase_Rate": "$Product_Purchase_Rate",
            "Product_ReOrederLevel": "$Product_ReOrederLevel",
            "Product_SellingPrice": "5",
            "Product_SlNo": "",
            "Product_WholesaleRate": "10",
            "Unit_ID": "4",
            "brand": "",
            "is_service": true,
            "vat": "5"
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
      print(
          "AddSupplierPayment AddSupplierPayment::AddSupplierPayment:${response.data}");
      var data = jsonDecode(response.data);
      print("Add Supplier Payment length is ${data}");
    } catch (e) {
      print("Something is wrong AAAAdd Supplier PPPayment=======:$e");
    }
  }
}
