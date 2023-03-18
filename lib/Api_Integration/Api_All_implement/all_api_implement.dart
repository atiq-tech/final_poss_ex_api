import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_Modelclass/salse_record_model_class.dart';
import 'package:poss/const_page.dart';


class AllApiImplement{


  static FetchAllSalseData(String ? dateFrom,String ? dateTo)async{
    String link="${BaseUrl}api/v1/getSalesRecord";
    // String basicAuth = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjI0IiwibmFtZSI6IkxpbmsgVXAgQXBpIiwidXNlcnR5cGUiOiJtIiwiaW1hZ2VfbmFtZSI6IjEuanBnIiwiYnJhbmNoIjoiMSJ9.v-zzAx2iYpfsyB-fna8_QHUkQGZpndgpAaYLRSSQ-8k';
    List<SalseRecordModelClass> sales_recordlist=[];
    try{
      SalseRecordModelClass salseRecordModelClass;
      Response response=await Dio().post(link,
          data: {
                  "dateFrom": "$dateFrom",
                  "dateTo": "$dateTo"
                },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
            "Bearer ${GetStorage().read("token")}",
          }));
         print(response.data);
         var item=jsonDecode(response.data);
         print(item);
         for(var i in item){
           salseRecordModelClass=SalseRecordModelClass.fromJson(i);
           sales_recordlist.add(salseRecordModelClass);
           print(sales_recordlist);
         }


    }catch(e){
      print(e);
    }
    return sales_recordlist;
}

}