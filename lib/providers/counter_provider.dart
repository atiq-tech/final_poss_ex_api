import 'package:flutter/material.dart';
import 'package:poss/Api_Integration/Api_All_get_production_record/production_record_api.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_customers_Class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_product_ledger_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_products_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_suppliers_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/production_record_model_class.dart';
import 'package:poss/Api_Integration/Api_all_customers/Api_all_customers.dart';
import 'package:poss/Api_Integration/Api_all_get_suppliers/api_all_suppliers.dart';
import 'package:poss/Api_Integration/Api_all_products/api_all_products.dart';
import 'package:poss/Api_Integration/Api_all_profit&loss/Api_all_profit_&_loss.dart';

import '../Api_Integration/Api_Modelclass/all_meterial_purchase_record_class.dart';
import '../Api_Integration/Api_all_meterial_purchase_record/Api_all_meterial_purchase_record.dart';
import '../Api_Integration/Api_all_product_ledger/api_all_product_ledger.dart';

class CounterProvider extends ChangeNotifier {
  //production record
  List<ProductionRecordModelClass> allProductionRecordlist = [];
  getProductionRecord(
      BuildContext context, String? dateFrom, String? dateTo) async {
    allProductionRecordlist =
        await ApiallProductionRecord.GetApiProductionRecord(
            context, dateFrom, dateTo);
    notifyListeners();
  }

  //Get Suppliers
  List<AllSuppliersClass> allSupplierslist = [];
  getSupplier(BuildContext context) async {
    allSupplierslist = await ApiAllSuppliers.GetApiAllSuppliers(context);
    notifyListeners();
  }

  //Meterial purchase record
  List<Purchases> allPurchaseslist = [];
  getMeterialPurchaseRecord(
      context, String? supplier_id, String? dateFrom, String? dateTo) async {
    allPurchaseslist =
        await ApiAllMeterialPurchaseRecord.GetApiAllMeterialPurchaseRecord(
            context, supplier_id, dateFrom, dateTo);
    notifyListeners();
  }

  //Customers
  List<AllCustomersClass> allCustomerslist = [];
  getCustomers(BuildContext context) async {
    allCustomerslist = await ApiAllCustomers.GetApiAllCustomers(context);
    notifyListeners();
  }

  //Profit & Loss
  List<AllProfitLossClass> allProfitLosslist = [];
  getProfitLoss(
      context, String? customer, String? dateFrom, String? dateTo) async {
    allProfitLosslist = await ApiAllProfitLoss.GetApiAllProfitLoss(
        context, customer, dateFrom, dateTo);
    notifyListeners();
  }

  //Products
  List<AllProductsClass> allProductslist = [];
  getProducts(BuildContext context) async {
    allProductslist = await ApiAllProducts.GetApiAllProducts(context);
    notifyListeners();
  }

  //Product Ledger
  List<Ledger> allProductLedgerlist = [];
  getProductLedger(
      context, String? productId, String? dateFrom, String? dateTo) async {
    allProductLedgerlist = await ApiAllProductLedger.GetApiAllProductLedger(
        context, productId, dateFrom, dateTo);
    notifyListeners();
  }
}
