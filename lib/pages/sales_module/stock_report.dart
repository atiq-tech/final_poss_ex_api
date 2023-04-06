import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common_widget/custom_appbar.dart';

class StockReportPage extends StatefulWidget {
  const StockReportPage({super.key});

  @override
  State<StockReportPage> createState() => _StockReportPageState();
}

class _StockReportPageState extends State<StockReportPage> {
  bool isCategoryWiseClicked = false;
  bool isProductWiseClicked = false;
  double thFontSize = 10.0;
  String data = '';
  List<String> _types = [
    'Current Stock',
    'Total Stock',
    'Category Wise Stock',
    'Product Wise Stock'
  ];

  List<String> _category = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
  ];
  List<String> _product = [
    'P1',
    'P2',
    'P3',
    'P4',
    'P5',
    'P6',
    'P7',
  ];
  String? _selectedTypes;
  String? _selectedCategory;
  String? _selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Stock Report"),
      body: Column(
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
                                ),
                                value: _selectedTypes,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedTypes = newValue!;
                                    _selectedTypes == "Category Wise Stock"
                                        ? isCategoryWiseClicked = true
                                        : isCategoryWiseClicked = false;
                                    _selectedTypes == "Product Wise Stock"
                                        ? isProductWiseClicked = true
                                        : isProductWiseClicked = false;
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
                isCategoryWiseClicked == true
                    ? Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Select Category:",
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
                                      'Please select a category',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    value: _selectedCategory,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedCategory = newValue!;
                                      });
                                    },
                                    items: _category.map((location) {
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
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
                isProductWiseClicked == true
                    ? Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Select Product",
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
                                      "Please select a product",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    value: _selectedProduct,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedProduct = newValue!;
                                      });
                                    },
                                    items: _product.map((location) {
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
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    color: Color.fromARGB(255, 3, 91, 150),
                    padding: EdgeInsets.all(1.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTypes == "Current Stock"
                              ? data = 'current stock'
                              : _selectedTypes == "Total Stock"
                                  ? data = 'Total Stock'
                                  : _selectedTypes == "Category Wise Stock"
                                      ? data = "Category Wise Stock"
                                      : _selectedTypes == "Product Wise Stock"
                                          ? data = "Product Wise Stock"
                                          : data = '';
                        });
                      },
                      child: Container(
                        height: 30.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 4, 113, 185),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Center(
                            child: Text(
                          "Show Report",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 92, 90, 90),
          ),
          if (data == 'current stock')
            Container(
              height: MediaQuery.of(context).size.height / 1.31,
              width: double.infinity,
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
                            label: Center(child: Text('Product Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Product Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Current Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Stock Value')),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          else if (data == 'Total Stock')
            Container(
              height: MediaQuery.of(context).size.height / 1.31,
              width: double.infinity,
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
                            label: Center(child: Text('Product Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Product Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Production Quantit')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Purchased Quantity')),
                          ),
                          DataColumn(
                            label: Center(
                                child: Text('Purchase Returned Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Damaged Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Sold Quantity')),
                          ),
                          DataColumn(
                            label:
                                Center(child: Text('Sales Returned Quantity')),
                          ),
                          DataColumn(
                            label:
                                Center(child: Text('Transferred In Quantity')),
                          ),
                          DataColumn(
                            label:
                                Center(child: Text('Transferred Out Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Current Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Stock Value')),
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
          else if (data == 'Category Wise Stock')
            Container(
              height: MediaQuery.of(context).size.height / 1.43,
              width: double.infinity,
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
                            label: Center(child: Text('Product Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Product Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Production Quantit')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Purchased Quantity')),
                          ),
                          DataColumn(
                            label: Center(
                                child: Text('Purchase Returned Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Damaged Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Sold Quantity')),
                          ),
                          DataColumn(
                            label:
                                Center(child: Text('Sales Returned Quantity')),
                          ),
                          DataColumn(
                            label:
                                Center(child: Text('Transferred In Quantity')),
                          ),
                          DataColumn(
                            label:
                                Center(child: Text('Transferred Out Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Current Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Stock Value')),
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
          else if (data == 'Product Wise Stock')
            Container(
              height: MediaQuery.of(context).size.height / 1.43,
              width: double.infinity,
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
                            label: Center(child: Text('Product Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Product Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Production Quantit')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Purchased Quantity')),
                          ),
                          DataColumn(
                            label: Center(
                                child: Text('Purchase Returned Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Damaged Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Sold Quantity')),
                          ),
                          DataColumn(
                            label:
                                Center(child: Text('Sales Returned Quantity')),
                          ),
                          DataColumn(
                            label:
                                Center(child: Text('Transferred In Quantity')),
                          ),
                          DataColumn(
                            label:
                                Center(child: Text('Transferred Out Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Current Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Stock Value')),
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
