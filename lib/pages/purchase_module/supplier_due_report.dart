import 'package:flutter/material.dart';
import 'package:poss/common_widget/custom_appbar.dart';

class SupplierDueReport extends StatefulWidget {
  const SupplierDueReport({Key? key}) : super(key: key);

  @override
  State<SupplierDueReport> createState() => _SupplierDueReportState();
}

class _SupplierDueReportState extends State<SupplierDueReport> {
  bool isCategoryWiseClicked = false;
  bool isProductWiseClicked = false;
  double thFontSize = 10.0;
  String data = 'By all';
  List<String> _types = ['By all', 'By Current Stock'];

  String? _selectedTypes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Supplier Due"),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Select Type:",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            height: 30,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 7, 125, 180),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                hint: Text(
                                  'Please select a type',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ), // Not necessary for Option 1
                                value: _selectedTypes,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedTypes = newValue!;
                                    data = newValue;
                                  });
                                },
                                items: _types.map((location) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      location,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    value: location,
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 92, 90, 90),
          ),
          if (data == 'By all')
            Expanded(
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
                        border: TableBorder.all(color: Colors.black54, width: 1),
                        columns: [
                          DataColumn(
                            label: Center(child: Text('Product Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Product Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Customer Mobile')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Total Bill')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Total Paid')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Paid to Customer')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Sales Returned')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Due Amount')),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          else if (data == 'By Current Stock')
            Expanded(
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
                        border: TableBorder.all(color: Colors.black54, width: 1),
                        columns: [
                          DataColumn(
                            label: Center(child: Text('Product Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Product Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Customer Mobile')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Total Bill')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Total Paid')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Paid to Customer')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Sales Returned')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Due Amount')),
                          ),
                        ],
                        rows: List.generate(
                          1,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
