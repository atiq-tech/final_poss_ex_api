import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:poss/Api_Integration/Api_all_get_suppliers/api_all_suppliers.dart';
import 'package:poss/Api_Integration/Api_all_supplier_payment_report/api_all_supplier_payment_report.dart';
import 'package:poss/common_widget/custom_appbar.dart';
import 'package:poss/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class SupplierPaymentReport extends StatefulWidget {
  const SupplierPaymentReport({super.key});

  @override
  State<SupplierPaymentReport> createState() => _SupplierPaymentReportState();
}

class _SupplierPaymentReportState extends State<SupplierPaymentReport> {
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _Date2Controller = TextEditingController();
  String? firstPickedDate;

  void _firstSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        firstPickedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
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
        secondPickedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  String? _selectedSupplier;
  ApiAllSuppliers? apiAllSuppliers;
  ApiAllSupplierPaymentReport? apiAllSupplierPaymentReport;
  @override
  void initState() {
    firstPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    secondPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    ApiAllSuppliers apiAllSuppliers;
    Provider.of<CounterProvider>(context, listen: false).getSupplier(context);
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Suppliers
    final allSuppliersData =
        Provider.of<CounterProvider>(context).allSupplierslist;
    print("ssssssssssssssssssssssssssssssssssssss  ${allSuppliersData.length}");
    //Product Ledger
    final allSupplierPaymentReportData =
        Provider.of<CounterProvider>(context).allSupplierPaymentReportlist;
    print(
        "SupplierPaymentReport======SupplierPaymentReport=Lenght is:::::${allSupplierPaymentReportData.length}");
    return Scaffold(
      appBar: CustomAppBar(title: "Supplier Payment Report"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              child: Container(
                height: 135.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
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
                          flex: 3,
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
                                isExpanded: true,
                                hint: Text(
                                  'Select Supplier',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                dropdownColor: Color.fromARGB(255, 231, 251,
                                    255), 
                                value: _selectedSupplier,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSupplier = newValue.toString();
                                    print(
                                        "Supplier Si no ===========>: $newValue");
                                  
                                  });
                                },
                                items: allSuppliersData.map((location) {
                                  return DropdownMenuItem(
                                    child: Text(
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
                    SizedBox(height: 10.0),
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
                                      ? DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now())
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
                                      ? DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now())
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
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Provider.of<CounterProvider>(context, listen: false)
                                .getSupplierPaymentReport(
                                    context,
                                    "${_selectedSupplier}",
                                    "${firstPickedDate}",
                                    "${secondPickedDate}");

                            print(
                                "SupplierPaymentReport firstDate ++++++=====::${firstPickedDate}");
                            print(
                                "SupplierPaymentReport secondPickedDate ++++++=====::${secondPickedDate}");
                          });
                        },
                        child: Container(
                          height: 35.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 75, 196, 201),
                                width: 2.0),
                            color: Color.fromARGB(255, 87, 113, 170),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                              child: Text(
                            "Show",
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

            // SizedBox(height: 10.0),
            // Container(
            //   height: MediaQuery.of(context).size.height / 1.43,
            //   width: double.infinity,
            //   padding: EdgeInsets.only(left: 8.0, right: 8.0),
            //   child: Container(
            //     width: double.infinity,
            //     height: double.infinity,
            //     child: SingleChildScrollView(
            //       scrollDirection: Axis.vertical,
            //       child: SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: Container(
            //           // color: Colors.red,
            //           // padding:EdgeInsets.only(bottom: 16.0),
            //           child: DataTable(
            //             showCheckboxColumn: true,
            //             border:
            //                 TableBorder.all(color: Colors.black54, width: 1),
            //             columns: [
            //               DataColumn(
            //                 label: Center(child: Text('Date')),
            //               ),
            //               DataColumn(
            //                 label: Center(child: Text('Product')),
            //               ),
            //               DataColumn(
            //                 label: Center(child: Text('Sold Quantity')),
            //               ),
            //               DataColumn(
            //                 label: Center(child: Text('Purchase Rate')),
            //               ),
            //               DataColumn(
            //                 label: Center(child: Text('Purchased Total')),
            //               ),
            //               DataColumn(
            //                 label: Center(child: Text('Sold Amount')),
            //               ),
            //               DataColumn(
            //                 label: Center(child: Text('Profit/Loss')),
            //               ),
            //             ],
            //             rows: List.generate(
            //               allSupplierPaymentReportData.length,
            //               //allProfitLossData[0].saleDetails!.length,
            //               (int index) => DataRow(
            //                 cells: <DataCell>[
            //                   DataCell(
            //                     Center(
            //                         child: Text(
            //                             '${allSupplierPaymentReportData[0][index]}')),
            //                   ),
            //                   DataCell(
            //                     Center(
            //                         child: Text(
            //                             '${allSupplierPaymentReportData[0].saleDetails![index].productName}')),
            //                   ),
            //                   DataCell(
            //                     Center(
            //                         child: Text(
            //                             '${allSupplierPaymentReportData[0].saleDetails![index].saleDetailsTotalQuantity}')),
            //                   ),
            //                   DataCell(
            //                     Center(
            //                         child: Text(
            //                             '${allSupplierPaymentReportData[0].saleDetails![index].purchaseRate}')),
            //                   ),
            //                   DataCell(
            //                     Center(
            //                         child: Text(
            //                             '${allSupplierPaymentReportData[0].saleDetails![index].purchasedAmount}')),
            //                   ),
            //                   DataCell(
            //                     Center(
            //                         child: Text(
            //                             '${allSupplierPaymentReportData[0].saleDetails![index].saleDetailsTotalAmount}')),
            //                   ),
            //                   DataCell(
            //                     Center(
            //                         child: Text(
            //                             '${allSupplierPaymentReportData[0].saleDetails![index].profitLoss}')),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
