import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart' as jiffy;
import 'package:jiffy/jiffy.dart';
import 'package:poss/common_widget/custom_appbar.dart';
import 'package:poss/pages/pages_common/supplier_page.dart';

class SupplierPaymentPage extends StatefulWidget {
  const SupplierPaymentPage({super.key});

  @override
  State<SupplierPaymentPage> createState() => _SupplierPaymentPageState();
}

class _SupplierPaymentPageState extends State<SupplierPaymentPage> {
  final TextEditingController _transactionTypeController =
      TextEditingController();
  final TextEditingController _paymentTypeController = TextEditingController();
  final TextEditingController _supplierController = TextEditingController();
  final TextEditingController _DuoController = TextEditingController();
  final TextEditingController _paymentDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String? _transactionType;
  List<String> _transactionTypeList = [
    'Receive',
    'Payment',
  ];
  bool isBankListClicked = false;
  String? _paymentType;

  List<String> _paymentTypeList = [
    'Cash',
    'Bank',
  ];
  String? _selectedBank;
  List<String> _bankList = [
    'A Bank',
    'B Bank',
    'C Bank',
    'D Bank',
    'E Bank',
    'F Bank',
    'G Bank',
  ];
  String? _selectedSupplier;
  List<String> SupplierList = [
    'Ahmed Shezad',
    'Nitish',
    'Maruf',
    'Mehedi',
    'Nahid',
    'Nuzmul',
    'Joy',
    'Musha'
  ];
  String? firstPickedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Supplier Payment"),
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(4.0),
                child: Container(
                  height: 320.0,
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
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "Transaction Type",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
                            child: Container(
                              height: 28.0,
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
                                    'Select Type',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  dropdownColor: Color.fromARGB(255, 231, 251,
                                      255), // Not necessary for Option 1
                                  value: _transactionType,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _transactionType = newValue!;
                                    });
                                  },
                                  items: _transactionTypeList.map((location) {
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
                          ),
                        ],
                      ),
                      SizedBox(height: 3.0),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Text(
                                "Payment Type",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 126, 125, 125)),
                              ),
                            ),
                            Expanded(flex: 1, child: Text(":")),
                            Expanded(
                              flex: 11,
                              child: Container(
                                height: 28.0,
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
                                      'Select Type',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    dropdownColor: Color.fromARGB(255, 231, 251,
                                        255), // Not necessary for Option 1
                                    value: _paymentType,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _paymentType = newValue!;
                                        _paymentType == "Bank"
                                            ? isBankListClicked = true
                                            : isBankListClicked = false;
                                      });
                                    },
                                    items: _paymentTypeList.map((location) {
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.0),
                      isBankListClicked == true
                          ? Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      "Bank account",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 126, 125, 125)),
                                    ),
                                  ),
                                  Expanded(flex: 1, child: Text(":")),
                                  Expanded(
                                    flex: 11,
                                    child: Container(
                                      height: 28.0,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      padding: EdgeInsets.only(left: 5.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:
                                              Color.fromARGB(255, 5, 107, 155),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Text(
                                            'Select account',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          dropdownColor: Color.fromARGB(
                                              255,
                                              231,
                                              251,
                                              255), // Not necessary for Option 1
                                          value: _selectedBank,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedBank = newValue!;
                                            });
                                          },
                                          items: _bankList.map((location) {
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
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(
                              "Supplier",
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
                                    'Select Supplier',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ), // Not necessary for Option 1
                                  value: _selectedSupplier,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedSupplier = newValue!;
                                    });
                                  },
                                  items: SupplierList.map((location) {
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
                          ),
                          SizedBox(width: 2.0),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SupplierPage()));
                                });
                              },
                              child: Container(
                                height: 28.0,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 7, 125, 180),
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                        color:
                                            Color.fromARGB(255, 75, 196, 201),
                                        width: 1)),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "Due",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
                            child: Container(
                              height: 28.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
                                controller: _DuoController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "Payment Date",
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
                                margin: EdgeInsets.only(
                                    top: 5, right: 5, bottom: 5),
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
                                    Icon(Icons.calendar_month, size: 20)
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
                            flex: 6,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
                            child: Container(
                              height: 35.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
                                controller: _descriptionController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "Amount",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
                            child: Container(
                              height: 28.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
                                controller: _amountController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(255, 7, 125, 180),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 35.0,
                            width: 85.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 88, 204, 91),
                                  width: 2.0),
                              color: Color.fromARGB(255, 5, 114, 165),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: Text(
                              "SAVE",
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                          SizedBox(width: 4.0),
                          Container(
                            height: 35.0,
                            width: 85.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 88, 204, 91),
                                  width: 2.0),
                              color: Color.fromARGB(255, 252, 33, 4),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: Text(
                              "CANCEL",
                              style: TextStyle(
                                  letterSpacing: 1.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                child: Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black38, width: 1)),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            /* Clear the search field */
                          },
                        ),
                        hintText: 'Filter...',
                        border: InputBorder.none),
                  ),
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
                              label: Center(child: Text('Transaction Id')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Date')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Supplier')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Transaction Type')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Payment by')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Amount')),
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
