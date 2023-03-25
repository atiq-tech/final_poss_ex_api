import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_supplier_payment_report_class.dart';
import 'package:poss/const_page.dart';

class ApiAllSupplierPaymentReport{
    static GetApiAllSupplierPaymentReport(
      context, String? supplierId, String? dateFrom, String? dateTo) async {
    String Link = "${BaseUrl}api/v1/getSupplierLedger";
    List<Payments> allSupplierPaymentReportlist = [];
    Payments payments;
    try {
      Response response = await Dio().post(Link,
          data: {
            "supplierId": "$supplierId",
            "dateFrom": "$dateFrom",
            "dateTo": "$dateTo"
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
   

      var data = jsonDecode(response.data)["payments"];
      print("Supplier payments===========Supplier payments: ${data}");
      for (var i in data) {
        payments= Payments.fromJson(i);
        allSupplierPaymentReportlist.add(payments);
      }
      print("Supplier payments==========Supplier payments=======Supplier payments");
      print("Supplier paymentsSupplier paymentsSupplier payments length is ${allSupplierPaymentReportlist.length}");
    } catch (e) {
      print("Something is wrong Supplier payments=======:$e");
    }
    return allSupplierPaymentReportlist;
  }
}