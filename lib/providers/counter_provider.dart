import 'package:flutter/material.dart';
import 'package:poss/Api_Integration/Api_All_get_production_record/production_record_api.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_accounts_model_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_add_cash_transactions_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_bank_account_model_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_bank_transaction_model_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_cash_transaction_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_customers_Class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_get_bank_transaction_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_get_cash_transaction_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_get_customer_payment_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_get_supplier_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_product_ledger_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_products_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_supplier_due_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_supplier_payment_report_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/all_suppliers_class.dart';
import 'package:poss/Api_Integration/Api_Modelclass/production_record_model_class.dart';
import 'package:poss/Api_Integration/Api_all_accounts/Api_all_accounts.dart';
import 'package:poss/Api_Integration/Api_all_add_cash_transaction/Api_all_add_cash_transaction.dart';
import 'package:poss/Api_Integration/Api_all_bank_accounts/Api_all_bank_accounts.dart';
import 'package:poss/Api_Integration/Api_all_bank_transaction/Api_all_bank_transaction.dart';
import 'package:poss/Api_Integration/Api_all_cash_transaction/Api_all_cash_transaction.dart';
import 'package:poss/Api_Integration/Api_all_customers/Api_all_customers.dart';
import 'package:poss/Api_Integration/Api_all_get_bank_transaction/Api_all_get_bank_transaction.dart';
import 'package:poss/Api_Integration/Api_all_get_cash_transaction/Api_all_get_cash_transaction.dart';
import 'package:poss/Api_Integration/Api_all_get_customer_payment/Api_all_get_customer_payment.dart';
import 'package:poss/Api_Integration/Api_all_get_suppliers/api_all_suppliers.dart';
import 'package:poss/Api_Integration/Api_all_newget_supplier/Api_all_newget_supplier.dart';
import 'package:poss/Api_Integration/Api_all_products/api_all_products.dart';
import 'package:poss/Api_Integration/Api_all_profit&loss/Api_all_profit_&_loss.dart';
import 'package:poss/Api_Integration/Api_all_supplier_due/api_all_supplier_due.dart';
import 'package:poss/Api_Integration/Api_all_supplier_payment_report/api_all_supplier_payment_report.dart';

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

  //Supplier Due
  List<AllSupplierDueClass> allSupplierDuelist = [];
  getSupplierDue(context, String? supplierId) async {
    allSupplierDuelist =
        await ApiAllSupplierDue.GetApiAllSupplierDue(context, supplierId);
    notifyListeners();
  }

  //Product Ledger
  List<Payments> allSupplierPaymentReportlist = [];
  getSupplierPaymentReport(
      context, String? supplierId, String? dateFrom, String? dateTo) async {
    allSupplierPaymentReportlist =
        await ApiAllSupplierPaymentReport.GetApiAllSupplierPaymentReport(
            context, supplierId, dateFrom, dateTo);
    notifyListeners();
  }

  //ACCOUNTS
  List<AllAccountsModelClass> allAccountslist = [];
  getAccounts(BuildContext context) async {
    allAccountslist = await ApiAllAccounts.GetApiAllAccounts(context);
    notifyListeners();
  }

  //CashTransactions
  List<AllCashTransactionsClass> allCashTransactionslist = [];
  getCashTransactions(context, String? transactionType, String? accountId,
      String? dateFrom, String? dateTo) async {
    allCashTransactionslist =
        await ApiAllCashTransactions.GetApiAllCashTransactions(
            context, transactionType, accountId, dateFrom, dateTo);
    notifyListeners();
  }

  // Bank ACCOUNTS
  List<AllBankAccountModelClass> allBankAccountlist = [];
  getBankAccounts(BuildContext context) async {
    allBankAccountlist =
        await ApiAllBankAccounts.GetApiAllBankAccounts(context);
    notifyListeners();
  }

  //Bank Transactions
  List<AllBankTransactionModelClass> allBankTransactionslist = [];
  getBankTransactions(context, String? accountId, String? dateFrom,
      String? dateTo, String? transactionType) async {
    allBankTransactionslist =
        await ApiAllBankTransactions.GetApiAllBankTransactions(
            context, accountId, dateFrom, dateTo, transactionType);
    notifyListeners();
  }

  //Get CashTransactions
  List<AllGetCashTransactionsClass> allGetCashTransactionslist = [];
  getGetCashTransactions(context, String? dateFrom, String? dateTo) async {
    allGetCashTransactionslist =
        await ApiAllGetCashTransactions.GetApiAllGetCashTransactions(
            context, dateFrom, dateTo);
    notifyListeners();
  }

  //Get bankTransactions
  List<AllGetBankTransactionClass> allGetBankTransactionslist = [];
  getGetBankTransactions(context, String? dateFrom, String? dateTo) async {
    allGetBankTransactionslist =
        await ApiAllGetBankTransactions.GetApiAllGetBankTransactions(
            context, dateFrom, dateTo);
    notifyListeners();
  }

  //New Get Supplier
  List<AllGetSupplierClass> allGetSupplierslist = [];
  getNewSuppliers(context) async {
    allGetSupplierslist =
        await ApiAllNewGetSuppliers.GetApiAllNewGetSuppliers(context);
    notifyListeners();
  }

  //Get CustomerPayment
  List<AllGetCustomerPaymentClass> allGetCustomerPaymentlist = [];
  getGetCustomerPayment(context, String? dateFrom, String? dateTo) async {
    allGetCustomerPaymentlist =
        await ApiAllGetCustomerPayments.GetApiAllGetCustomerPayments(
            context, dateFrom, dateTo);
    notifyListeners();
  }
}
