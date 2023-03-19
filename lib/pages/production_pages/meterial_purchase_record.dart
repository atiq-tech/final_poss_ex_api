import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poss/Api_Integration/Api_All_get_production_record/production_record_api.dart';
import 'package:poss/Api_Integration/Api_Modelclass/production_record_model_class.dart';
import 'package:poss/Api_Integration/Api_all_get_suppliers/get_suppliers_api.dart';
import 'package:poss/common_widget/custom_appbar.dart';
import 'package:jiffy/jiffy.dart';
import 'package:poss/const_page.dart';
import 'package:http/http.dart' as http;
import 'package:poss/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class MeterialPurchaseRecord extends StatefulWidget {
  const MeterialPurchaseRecord({super.key});

  @override
  State<MeterialPurchaseRecord> createState() => _MeterialPurchaseRecordState();
}

class _MeterialPurchaseRecordState extends State<MeterialPurchaseRecord> {
  final TextEditingController _firstDateController = TextEditingController();
  final TextEditingController _secondDateController = TextEditingController();
  String? firstPickedDate;

  void _firstSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        firstPickedDate = Jiffy(selectedDate).format("dd - MMM - yyyy");
      });
    }
  }

  String? secondPickedDate;

  void _secondSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        secondPickedDate = Jiffy(selectedDate).format("dd - MMM - yyyy");
      });
    }
  }

  bool isSupplierListClicked = false;
  String? _searchType;

  List<String> _searchTypeList = [
    'All',
    'By Supplier',
  ];
  String? _selectedSupplier;
  // List<String> _selectedSupplierList = [
  //   'C0010-Noyon',
  //   'A0000000002-Sbir Enterprise',
  //   'A02220000222-Manionj Traders',
  //   'A02-Tanvir Enterprise',
  //   'A4500000000002-Hanif Enterprise',
  //   'A02-Hanan Stap',
  //   'A02-Sabir Enterprise',
  // ];
  GetSuppliersApi? getSuppliersApi;
  //ApiallProductionRecord? apiallProductionRecord;
  @override
  void initState() {
    GetSuppliersApi getSuppliersApi;
    Provider.of<CounterProvider>(context, listen: false).getSupplier(context);
    // ApiallProductionRecord? apiallProductionRecord;
    // Provider.of<CounterProvider>(context, listen: false)
    //     .getProductRecord(context);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get Suppliers
    final allGetSuppliersData =
        Provider.of<CounterProvider>(context).getSupplierlist;
    //All ProductRecord
    // final allProductionRecordData =
    //     Provider.of<CounterProvider>(context).allProductionRecordlist;
    print(
        "ssssssssssssssssssssssssssssssssssssss${allGetSuppliersData.length}");
    return Scaffold(
      appBar: CustomAppBar(title: "Meterial Purchase Record"),
      body: Container(
        padding: EdgeInsets.all(6),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 6.0, left: 10.0, right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 5, 107, 155),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Search Type",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
                            child: Container(
                              height: 30.0,
                              width: MediaQuery.of(context).size.width / 2,
                              padding: EdgeInsets.only(left: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 5, 107, 155),
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint: Text(
                                    'All',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  dropdownColor: Color.fromARGB(255, 231, 251,
                                      255), // Not necessary for Option 1
                                  value: _searchType,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _searchType = newValue!;
                                      _searchType == "By Supplier"
                                          ? isSupplierListClicked = true
                                          : isSupplierListClicked = false;
                                    });
                                  },
                                  items: _searchTypeList.map((location) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        maxLines: 1,
                                        location,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.0),
                    isSupplierListClicked == true
                        ? Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    "Supplier",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 126, 125, 125)),
                                  ),
                                ),
                                Expanded(flex: 1, child: Text(":")),
                                Expanded(
                                  flex: 11,
                                  child: Container(
                                    height: 30.0,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.only(left: 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(255, 5, 107, 155),
                                      ),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        hint: Text(
                                          'Select Supplier',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        dropdownColor: Color.fromARGB(
                                            255,
                                            231,
                                            251,
                                            255), // Not necessary for Option 1
                                        value: _selectedSupplier,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedSupplier =
                                                newValue.toString();
                                          });
                                        },
                                        items:
                                            allGetSuppliersData.map((location) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              overflow: TextOverflow.visible,
                                              maxLines: 1,
                                              "${location.supplierName}",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            value: location.supplierSlNo,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Date From",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(flex: 1, child: Text(":")),
                        Expanded(
                          flex: 11,
                          child: GestureDetector(
                            onTap: () async {
                              final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050));
                              if (selectedDate != null) {
                                setState(() {
                                  firstPickedDate = Jiffy(selectedDate)
                                      .format("dd - MMM - yyyy");
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              height: 32,
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5, right: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    firstPickedDate == null
                                        ? Jiffy(DateTime.now())
                                            .format("dd - MMM - yyyy")
                                        : firstPickedDate!,
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Date To",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(flex: 1, child: Text(":")),
                        Expanded(
                          flex: 11,
                          child: GestureDetector(
                            onTap: () async {
                              final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050));
                              if (selectedDate != null) {
                                setState(() {
                                  secondPickedDate = Jiffy(selectedDate)
                                      .format("dd - MMM - yyyy");
                                });
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              height: 32,
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5, right: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    secondPickedDate == null
                                        ? Jiffy(DateTime.now())
                                            .format("dd - MMM - yyyy")
                                        : secondPickedDate!,
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 35.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 75, 196, 201),
                                width: 2.0),
                            color: Color.fromARGB(255, 87, 113, 170),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Center(
                              child: Text(
                            "Search",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: MediaQuery.of(context).size.height / 1.43,
                width: double.infinity,
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        // color: Colors.red,
                        // padding:EdgeInsets.only(bottom: 16.0),
                        child: DataTable(
                          showCheckboxColumn: true,
                          border:
                              TableBorder.all(color: Colors.black54, width: 1),
                          columns: [
                            DataColumn(
                              label: Center(child: Text('Invoice No.')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Date')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Supplier Id')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Supplier Name')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Sub Total')),
                            ),
                            DataColumn(
                              label: Center(child: Text('VAT')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Total')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Paid')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Due')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Note')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Action')),
                            ),
                          ],
                          rows: List.generate(
                            30,
                            (int index) => DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
