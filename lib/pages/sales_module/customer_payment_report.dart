import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:poss/common_widget/custom_appbar.dart';

class Customer_Payment_Report extends StatefulWidget {
  const Customer_Payment_Report({Key? key}) : super(key: key);

  @override
  State<Customer_Payment_Report> createState() => _Customer_Payment_ReportState();
}
class _Customer_Payment_ReportState extends State<Customer_Payment_Report> {
  bool isCategoryWiseClicked = false;
  bool isProductWiseClicked = false;
  double thFontSize = 10.0;
  String data = '';
  String data2 = '';
  bool is_second_Caregory = false;
  bool is_first_Caregory = false;

  List<String> _types = [
    'Retail',
    'WholeSale',
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

  String? _selectedTypes;
  String? _selectedCategory;
  String? _selectedProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Customer Payment Report"),
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
                                    data =newValue;
                                    is_first_Caregory=true;
                                    print("data  $data");
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
                Container(
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
                              ), // Not necessary for Option 1
                              value: _selectedCategory,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCategory = newValue!;
                                  data2=newValue;
                                  is_second_Caregory= true;
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
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
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
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    color: Color.fromARGB(255, 3, 91, 150),
                    padding: EdgeInsets.all(1.0),
                    child: InkWell(
                      onTap: () {

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
          if(data == 'Retail' && is_second_Caregory==true)

            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height/1.31,
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
                          border: TableBorder.all(color: Colors.black54,width: 1),
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
              ),
            )
          else if(data == 'WholeSale'&& is_second_Caregory==true)
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height/1.43,
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
                            border: TableBorder.all(color: Colors.black54,width: 1),
                            columns: [
                              DataColumn(label: Center(child: Text('Product Id')),),
                              DataColumn(label: Center(child: Text('Product Name')),),
                              DataColumn(label: Center(child: Text('Production Quantit')),),
                              DataColumn(label: Center(child: Text('Purchased Quantity')),),
                              DataColumn(label: Center(child: Text('Purchase Returned Quantity')),),
                              DataColumn(label: Center(child: Text('Damaged Quantity')),),
                              DataColumn(label: Center(child: Text('Sold Quantity')),),
                              DataColumn(label: Center(child: Text('Sales Returned Quantity')),),
                              DataColumn(label: Center(child: Text('Transferred In Quantity')),),
                              DataColumn(label: Center(child: Text('Transferred Out Quantity')),),
                              DataColumn(label: Center(child: Text('Current Quantity')),),
                              DataColumn(label: Center(child: Text('Stock Value')),),
                            ],
                            rows: List.generate(
                              30,
                                  (int index) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),
                                  DataCell(Center(child: Text('Row $index')),),

                                ],
                              ),
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
