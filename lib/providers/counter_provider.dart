import 'package:flutter/material.dart';
import 'package:poss/Api_Integration/Api_All_get_production_record/production_record_api.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_customers_Class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/get_supplier_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/production_record_model_class.dart';
import 'package:poss/Api_Integration/Api_all_customers/Api_all_customers.dart';
import 'package:poss/Api_Integration/Api_all_get_suppliers/get_suppliers_api.dart';
import 'package:poss/Api_Integration/Api_all_profit&loss/Api_all_profit_&_loss.dart';

class CounterProvider extends ChangeNotifier {
  // //production record
  // List<ProductionRecordModelClass> allProductionRecordlist = [];
  // getProductRecord(BuildContext context) async {
  //   allProductionRecordlist =
  //       await ApiallProductionRecord.GetApiProductionRecord(context);
  //   notifyListeners();
  // }

  // //Get Suppliers
  // List<GetSupplierClass> getSupplierlist = [];
  // getSupplier(BuildContext context) async {
  //   getSupplierlist = await GetSuppliersApi.GetApiGetSupplier(context);
  //   notifyListeners();
  // }

  //Customers
  List<AllCustomersClass> allCustomerslist = [];
  getCustomers(BuildContext context) async {
    allCustomerslist = await ApiAllCustomers.GetApiAllCustomers(context);
    notifyListeners();
  }

  //Profit & Loss
  List<AllProfitLossClass> allProfitLosslist = [];
  getProfitLoss(context,String ?customer ,String ?dateFrom,String ?dateTo) async {
    allProfitLosslist = await ApiAllProfitLoss.GetApiAllProfitLoss(context,customer ,  dateFrom, dateTo);
    notifyListeners();
  }
}
