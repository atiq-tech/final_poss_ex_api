import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jiffy/jiffy.dart';

import '../../common_widget/custom_appbar.dart';

class PurchaseRecord extends StatefulWidget {
  const PurchaseRecord({super.key});

  @override
  State<PurchaseRecord> createState() => _PurchaseRecordState();
}

class _PurchaseRecordState extends State<PurchaseRecord> {
  //main dropdowns logic
  bool isAllTypeClicked = false;
  bool isCategoryWiseClicked = false;
  bool isQuantityWiseClicked = false;
  bool isUserWiseClicked = false;

  //sub dropdowns logic
  bool isWithoutDetailsClicked = false;
  bool isWithDetailsClicked = false;

  // dropdown value
  String? _selectedSearchTypes;
  String? _selectedRecordTypes;
  String? _selectedCustomerTypes;
  String? _selectedProductType;
  String? _selectedEmployeeTypes;
  String? _selectedCategoryTypes;
  String? _selectedQuantityTypes;
  String? _selectedSummaryTypes;
  String? _selectedUserTypes;

  // util
  double thFontSize = 10.0;
  String data = '';

  //all the dropdown lists
  List<String> _searchTypes = [
    'All',
    'By Category',
    'By Quantity',
    'By User',
  ];

  List<String> _customerList = [
    'Noyon Trader',
    'Zahid Computer',
    'Boi Bitan',
  ];

  List<String> _productList = [
    'Gold Toilet Tissue',
    'Happy Khata',
    'Pencil',
  ];

  List<String> _recordType = [
    'Without Details',
    'With Details',
  ];

  List<String> _employeeList = [
    'Employee 1',
    'Employee 2',
    'Employee 3',
    'Employee 4',
  ];

  List<String> _categoryList = [
    'Employee 1',
    'Employee 2',
    'Employee 3',
    'Employee 4',
  ];

  List<String> _userList = [
    'Admin',
    'user 1',
    'user 2',
    'user 3',
    'user 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Purchase Record"),
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
                          "Search Type:",
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
                                value: _selectedSearchTypes,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSearchTypes = newValue!;

                                    _selectedSearchTypes == "All" ? isAllTypeClicked = true : isAllTypeClicked = false;

                                    _selectedSearchTypes == "By Category"
                                        ? isCategoryWiseClicked = true
                                        : isCategoryWiseClicked = false;

                                    _selectedSearchTypes == "By Quantity"
                                        ? isQuantityWiseClicked = true
                                        : isQuantityWiseClicked = false;

                                    _selectedSearchTypes == "By User"
                                        ? isUserWiseClicked = true
                                        : isUserWiseClicked = false;
                                  });
                                },
                                items: _searchTypes.map((location) {
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

                isAllTypeClicked == true
                    ? Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Record Type:",
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
                                      'Please select a record type',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ), // Not necessary for Option 1
                                    value: _selectedRecordTypes,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedRecordTypes = newValue!;
                                        _selectedRecordTypes == "Without Details"
                                            ? isWithoutDetailsClicked = true
                                            : isWithoutDetailsClicked = false;
                                        _selectedRecordTypes == "With Details"
                                            ? isWithDetailsClicked = true
                                            : isWithDetailsClicked = false;
                                      });
                                    },
                                    items: _recordType.map((location) {
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
                      )
                    : Container(),

                isCategoryWiseClicked == true
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Customer:",
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
                                        'Please select a Customer',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedCustomerTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedCustomerTypes = newValue!;
                                        });
                                      },
                                      items: _customerList.map((location) {
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
                          ), // Employee
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Category:",
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
                                        'Please select a Category',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedCategoryTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedCategoryTypes = newValue!;
                                        });
                                      },
                                      items: _categoryList.map((location) {
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
                        ],
                      )
                    : Container(),

                isQuantityWiseClicked == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Product:",
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
                                    'Please select a Product',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ), // Not necessary for Option 1
                                  value: _selectedQuantityTypes,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedQuantityTypes = newValue!;
                                    });
                                  },
                                  items: _productList.map((location) {
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
                      )
                    : Container(),

                isUserWiseClicked == true
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "User:",
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
                                        'Please select a Product',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedUserTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedUserTypes = newValue!;
                                        });
                                      },
                                      items: _userList.map((location) {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Category:",
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
                                        'Please select a Category',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedCategoryTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedCategoryTypes = newValue!;
                                        });
                                      },
                                      items: _categoryList.map((location) {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Product:",
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
                                        'Please select a Product',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedQuantityTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedQuantityTypes = newValue!;
                                        });
                                      },
                                      items: _productList.map((location) {
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
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Record Type:",
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
                                          'Please select a record type',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ), // Not necessary for Option 1
                                        value: _selectedRecordTypes,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedRecordTypes = newValue!;
                                            _selectedRecordTypes == "Without Details"
                                                ? isWithoutDetailsClicked = true
                                                : isWithoutDetailsClicked = false;
                                            _selectedRecordTypes == "With Details"
                                                ? isWithDetailsClicked = true
                                                : isWithDetailsClicked = false;
                                          });
                                        },
                                        items: _recordType.map((location) {
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
                        ],
                      )
                    : Container(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                        height: 30,
                        padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 7, 125, 180),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GestureDetector(
                          onTap: (() {
                            _firstSelectedDate();
                          }),
                          child: Text(
                            firstPickedDate == null
                                ? Jiffy(DateTime.now()).format("dd - MMM - yyyy")
                                : firstPickedDate!,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Text("To"),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                        height: 30,
                        padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 7, 125, 180),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GestureDetector(
                          onTap: (() {
                            _secondSelectedDate();
                          }),
                          child: Text(
                            secondPickedDate == null
                                ? Jiffy(DateTime.now()).format("dd - MMM - yyyy")
                                : secondPickedDate!,
                          ),
                        ),
                      ),
                    ),
                  ],
                ), // Date Picker
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    color: Color.fromARGB(255, 3, 91, 150),
                    padding: EdgeInsets.all(1.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          // AllType
                          if (isAllTypeClicked && isWithoutDetailsClicked) {
                            data = 'showAllWithoutDetails';
                          } else if (isAllTypeClicked && isWithDetailsClicked) {
                            data = 'showAllWithDetails';
                          }

                          // By Category
                          else if (isCategoryWiseClicked) {
                            data = 'showByCategoryDetails';
                          }
                          // By Quantity
                          else if (isQuantityWiseClicked) {
                            data = 'showByQuantityDetails';
                          }

                          // By User
                          else if (isUserWiseClicked && isWithoutDetailsClicked) {
                            data = 'showByUserWithoutDetails';
                          } else if (isUserWiseClicked && isWithDetailsClicked) {
                            data = 'showByUserWithDetails';
                          }
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
          data == 'showAllWithoutDetails'
              ? Expanded(
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
                                label: Center(child: Text('Invoice No')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Date')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Supplier Name')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Sub Total')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Discount')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Transport Cost')),
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : data == 'showAllWithDetails'
                  ? Expanded(
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
                                    label: Center(child: Text('Invoice No')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Date')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Supplier Name')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Product Name')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Price')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Quantity')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Total')),
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : data == 'showByCategoryDetails'
                      ? Expanded(
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
                                        label: Center(child: Text('Invoice No')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Date')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Supplier Name')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Product Name')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Purchases  Rate')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Quantity')),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : data == 'showByQuantityDetails'
                          ? Expanded(
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
                                            label: Center(child: Text('Invoice No')),
                                          ),
                                          DataColumn(
                                            label: Center(child: Text('Date')),
                                          ),
                                          DataColumn(
                                            label: Center(child: Text('Customer Name')),
                                          ),
                                          DataColumn(
                                            label: Center(child: Text('Product Name')),
                                          ),
                                          DataColumn(
                                            label: Center(child: Text('Sales Rate')),
                                          ),
                                          DataColumn(
                                            label: Center(child: Text('Quantity')),
                                          ),
                                          DataColumn(
                                            label: Center(child: Text('Total')),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : data == 'showByUserWithoutDetails'
                              ? Expanded(
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
                                                label: Center(child: Text('Invoice No')),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Date')),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Supplier Name')),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Saved By')),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Sub Total')),
                                              ),
                                              DataColumn(
                                                label: Center(child: Text('Discount')),
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : data == 'showByUserWithDetails'
                                  ? Expanded(
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
                                                    label: Center(child: Text('Invoice No')),
                                                  ),
                                                  DataColumn(
                                                    label: Center(child: Text('Date')),
                                                  ),
                                                  DataColumn(
                                                    label: Center(child: Text('Supplier Name')),
                                                  ),
                                                  DataColumn(
                                                    label: Center(child: Text('Product Name')),
                                                  ),
                                                  DataColumn(
                                                    label: Center(child: Text('Price')),
                                                  ),
                                                  DataColumn(
                                                    label: Center(child: Text('Quantity')),
                                                  ),
                                                  DataColumn(
                                                    label: Center(child: Text('Total')),
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container()
        ],
      ),
   
    );
  }

  String? firstPickedDate;

  void _firstSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        firstPickedDate = Jiffy(selectedDate).format("dd - MMM - yyyy");
      });
    }
  }

  String? secondPickedDate;

  void _secondSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        secondPickedDate = Jiffy(selectedDate).format("dd - MMM - yyyy");
      });
    }
  }
}
