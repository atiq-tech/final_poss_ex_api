import 'package:flutter/material.dart';
import 'package:poss/Api_Integration/Api_All_get_production_record/production_record_api.dart';
import 'package:poss/Api_Integration/Api_Modelclass/production_record_model_class.dart';

class CounterProvider extends ChangeNotifier{
  //production record
 List<ProductionRecordModelClass> allProductionRecordlist = [];

  getProductRecord(BuildContext context) async {
    allProductionRecordlist = await ApiallProductionRecord.GetApiProductionRecord(context);
    notifyListeners();
  }
}