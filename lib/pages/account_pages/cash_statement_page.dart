import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:jiffy/jiffy.dart';
import 'package:poss/common_widget/custom_appbar.dart';

class CashStatementPage extends StatefulWidget {
  const CashStatementPage({super.key});

  @override
  State<CashStatementPage> createState() => _CashStatementPageState();
}

class _CashStatementPageState extends State<CashStatementPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cash Statement"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 100.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 5, 107, 155),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Date :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 35,
                            child: GestureDetector(
                              onTap: (() {
                                _firstSelectedDate();
                              }),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  suffixIcon: Icon(
                                    Icons.calendar_month,
                                    color: Colors.black87,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: firstPickedDate == null
                                      ? Jiffy(DateTime.now())
                                          .format("dd - MMM - yyyy")
                                      : firstPickedDate,
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Text("to"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 35,
                            child: GestureDetector(
                              onTap: (() {
                                _secondSelectedDate();
                              }),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  suffixIcon: Icon(
                                    Icons.calendar_month,
                                    color: Colors.black87,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: secondPickedDate == null
                                      ? Jiffy(DateTime.now())
                                          .format("dd - MMM - yyyy")
                                      : secondPickedDate,
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                   
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 35.0,
                          width: 85.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 40, 104, 163),
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
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 87, 141, 87),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      color: Colors.white,
                                      size: 12.0,
                                    ),
                                    Text(
                                      "Cash In",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color.fromARGB(
                                              255, 239, 244, 248)),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 184, 199, 173),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    )),
                                child: Center(child: Text("tk.200.0")),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 87, 141, 87),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      color: Colors.white,
                                      size: 12.0,
                                    ),
                                    Text(
                                      "Cash Out",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color.fromARGB(
                                              255, 239, 244, 248)),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 184, 199, 173),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    )),
                                child: Center(child: Text("tk.200.0")),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 87, 141, 87),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      color: Colors.white,
                                      size: 12.0,
                                    ),
                                    Text(
                                      "Balance",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Color.fromARGB(
                                              255, 239, 244, 248)),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 184, 199, 173),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0),
                                    )),
                                child: Center(child: Text("tk.200.0")),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
                child: Text(
              "Sales",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Invoice')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Customer')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Received')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
           
           
            Center(
                child: Text(
              "Received from Customers",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Invoice')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Customer')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Received')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
            Center(
                child: Text(
              "Received from Suppliers",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Invoice')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Supplier')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Received')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
            Center(
                child: Text(
              "Cash Received",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Account Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Received')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
            Center(
                child: Text(
              "Bank Withdraws",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Sl')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Account Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Account Number')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Bank Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Withdraw')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
            Center(
                child: Text(
              "Purchases",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Invoice')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Supplier')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Paid')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
            Center(
                child: Text(
              "Paid to Suppliers",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Invoice')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Supplier')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Paid')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
            Center(
                child: Text(
              "Paid to Customers",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Invoice')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Customer')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Paid')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
            Center(
                child: Text(
              "Cash Paid",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Account Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Paid')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
            Center(
                child: Text(
              "Bank Deposits",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Sl')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Account Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Account Number')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Bank Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Deposit')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
            ),
            Center(
                child: Text(
              "Employee Payments",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 15, 101, 199),
              ),
            )),
            SizedBox(height: 3.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
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
                            label: Center(child: Text('Employee Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Employee Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Month')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Amount')),
                          ),
                        ],
                        rows: List.generate(
                          8,
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
    );
  }
}
