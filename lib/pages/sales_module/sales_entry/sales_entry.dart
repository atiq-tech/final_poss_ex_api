import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jiffy/jiffy.dart';
import 'package:poss/hive/hive/product.dart';

import '../../../common_widget/custom_appbar.dart';
import 'add_customer.dart';

class SalesEntryPage extends StatefulWidget {
  const SalesEntryPage({super.key});
  @override
  State<SalesEntryPage> createState() => _SalesEntryPageState();
}

class _SalesEntryPageState extends State<SalesEntryPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _paidController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _discountPercentController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _salesRateController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _transportController = TextEditingController();

  List<String> salesByList = ['A', 'B', 'C', 'D'];
  List<String> customerList = ['General Customer', 'C0123', 'C0456', 'C0789'];
  List<String> categoryList = ['Paper', 'Khata', 'Printing Paper', 'Tissue'];
  List<String> productList = ['Drawing Khata', 'Pencil', 'Notebook', 'Pen'];

  String? _selectedSalesBy;
  String? _selectedCustomer;
  String? _selectedCategory;
  String? _selectedProduct;
  String level = "Retails";
  String availableStock = "41 reem";

  double h1TextSize = 16.0;
  double h2TextSize = 12.0;

  bool isVisible = false;
  bool isEnabled = false;

  late final Box box;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Sales Entry"),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 8),
                color: Color.fromARGB(255, 7, 125, 180),
                child: Center(
                  child: Text(
                    'Sales Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                height: 110.0,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Invoice no",
                          style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("123456789"),
                      ],
                    ), // Invoice no drop down
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Sales By",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
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
                                  'Select Customer',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ), // Not necessary for Option 1
                                value: _selectedSalesBy,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSalesBy = newValue!;
                                  });
                                },
                                items: salesByList.map((location) {
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
                    ), // Sales by drop down

                    GestureDetector(
                      onTap: () {
                        _selectedDate();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                        height: 32,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 7, 125, 180),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              firstPickedDate == null
                                  ? Jiffy(DateTime.now()).format("dd - MMM - yyyy")
                                  : firstPickedDate!,
                            ),
                            Icon(Icons.calendar_month)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 225.0,
                width: double.infinity,
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Sales Type",
                          style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.15,
                              child: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color.fromARGB(255, 5, 114, 165),
                                  ),
                                  value: "Retails",
                                  groupValue: level,
                                  onChanged: (value) {
                                    setState(() {
                                      level = value.toString();
                                    });
                                  }),
                            ),
                            Text("Retails"),
                          ],
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.15,
                              child: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                    (states) => Color.fromARGB(255, 5, 114, 165),
                                  ),
                                  value: "Wholesale",
                                  groupValue: level,
                                  onChanged: (value) {
                                    setState(() {
                                      level = value.toString();
                                    });
                                  }),
                            ),
                            Text("Wholesale"),
                          ],
                        ),
                      ],
                    ), // radio button
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Customer",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
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
                                  'Select Customer',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ), // Not necessary for Option 1
                                value: _selectedCustomer,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedCustomer = newValue!;
                                    _selectedCustomer == "General Customer" ? isVisible = true : isVisible = false;
                                    _selectedCustomer == "General Customer" ? isEnabled = true : isEnabled = false;
                                    print(_selectedCustomer);
                                    print(isVisible);
                                  });
                                },
                                items: customerList.map((location) {
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
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCustomer()));
                            },
                            child: Container(
                              height: 28.0,
                              margin: EdgeInsets.only(left: 5, bottom: 5, right: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Color.fromARGB(255, 75, 196, 201), width: 1)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ), // drop down
                    Visibility(
                      visible: isVisible,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Name",
                              style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 28.0,
                              margin: EdgeInsets.only(bottom: 5),
                              child: TextField(
                                controller: _nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
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
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Mobile",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              enabled: isEnabled,
                              controller: _mobileNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: isEnabled == true ? Colors.white : Colors.grey[200],
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
                    ), // mobile
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Address",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              maxLines: 3,
                              controller: _addressController,
                              enabled: isEnabled,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: isEnabled == true ? Colors.white : Colors.grey[200],
                                contentPadding: EdgeInsets.only(left: 10, top: 10),
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
                    //address
                  ],
                ),
              ),
              Container(
                height: 200.0,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 10.0,
                ),
                padding: EdgeInsets.only(top: 10.0, left: 6.0, right: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Category",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 30,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            margin: EdgeInsets.only(bottom: 5),
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
                                  'Select Category',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ), // Not necessary for Option 1
                                value: _selectedCategory,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedCategory = newValue!;
                                  });
                                },
                                items: productList.map((location) {
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
                    ), // category
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Product",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 30,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            margin: EdgeInsets.only(bottom: 5),
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
                                  'Select Product',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ), // Not necessary for Option 1
                                value: _selectedProduct,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedProduct = newValue!;
                                  });
                                },
                                items: productList.map((location) {
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
                    ), // product

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Sales Rate",
                          style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: TextField(
                              controller: _salesRateController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                        Text(
                          "Qty",
                          style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: TextField(
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                    ), // quantity
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Amount",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5, right: 5),
                            height: 30,
                            padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(
                                color: Color.fromARGB(255, 7, 125, 180),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              "",
                            ),
                          ),
                        ),
                        Text(
                          "Available Stock",
                          style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("$availableStock"),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 6, 118, 170),
                          ),
                          onPressed: () {
                            ProductDetails productDetails = ProductDetails(
                                productName: _nameController.text,
                                category: _selectedCategory,
                                quantity: int.parse(_quantityController.text),
                                saleRate: double.parse(_salesRateController.text),
                                totalAmount: double.parse(_amountController.text));
                            box.add(productDetails);
                          },
                          child: Text("Add to cart")),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Divider(thickness: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Catg",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "P. Name",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Qty",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Rate",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Amount",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Action",
                              textAlign: TextAlign.end,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Divider(thickness: 2),
                  ],
                ),
              ),
              Container(
                height: 200.0,
                width: double.infinity,
                child: ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (context, Box box, widget) {
                    if (box.isEmpty) {
                      return Center(
                        child: Text('No Product in Cart'),
                      );
                    } else {
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: box.length,
                              itemBuilder: (context, index) {
                                var currentBox = box;
                                var itemData = currentBox.getAt(index)!;
                                return Column(
                                  children: [
                                    Container(
                                      color: Colors.blue[50],
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 10,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "${itemData.category}",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black87,
                                                      fontSize: h2TextSize,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "${itemData.productName}",
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: h2TextSize,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "${itemData.quantity}",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black87,
                                                      fontSize: h2TextSize,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "${itemData.saleRate}",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black87,
                                                      fontSize: h2TextSize,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "${itemData.totalAmount}",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black87,
                                                      fontSize: h2TextSize,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: Container(
                                                color: Colors.white,
                                                child: FloatingActionButton.small(
                                                  heroTag: null,
                                                  onPressed: () {
                                                    _deleteProduct(index);
                                                    setState(() {
                                                      box.length;
                                                    });
                                                  },
                                                  shape: CircleBorder(),
                                                  backgroundColor: Colors.redAccent,
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: double.infinity,
                      color: Color.fromARGB(255, 7, 125, 180),
                      child: Center(
                        child: Text(
                          'Amount Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Sub Total",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              height: 30,
                              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "",
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Vat",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: TextField(
                              controller: _salesRateController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                        Text(
                          "%",
                          style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              height: 30,
                              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "",
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Discount",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: TextField(
                              controller: _salesRateController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                        Text(
                          "%",
                          style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: TextField(
                              controller: _discountPercentController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                          flex: 1,
                          child: Text(
                            "Transport",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            child: TextField(
                              controller: _transportController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Total",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              height: 30,
                              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "",
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Paid",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              controller: _paidController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                          flex: 1,
                          child: Text(
                            "Due",
                            style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            height: 30,
                            padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 7, 125, 180),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text("828.00"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {},
                            child: Text("Sale")),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 6, 118, 170),
                            ),
                            onPressed: () {},
                            child: Text("New Sale")),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? firstPickedDate;

  void _selectedDate() async {
    final selectedDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        firstPickedDate = Jiffy(selectedDate).format("dd - MMM - yyyy");
      });
    }
  }
}
