// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:my_second_poss_app/common_widget/custom_appbar.dart';
// import 'package:my_second_poss_app/hive_model/item.dart';
//
// class SalesEntryPage extends StatefulWidget {
//   const SalesEntryPage({super.key});
//
//   @override
//   State<SalesEntryPage> createState() => _SalesEntryPageState();
// }
//
// class _SalesEntryPageState extends State<SalesEntryPage> {
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//
//   final TextEditingController _availableStockController = TextEditingController();
//   final TextEditingController _salesRateController = TextEditingController();
//   final TextEditingController _quantityController = TextEditingController();
//
//   late final Box box;
//
//   double h1TextSize = 16.0;
//   double h2TextSize = 14.0;
//
//   @override
//   void initState() {
//     super.initState();
//     box = Hive.box('productBox');
//   }
//
//   // Delete info from people box
//   _deleteProduct(int index) {
//     box.deleteAt(index);
//     print('Product deleted from box at index: $index');
//   }
//
//   String lavel = "Retails";
//   String dropdownCustomerValue = 'Atiq';
//   String dropdownProductValue = 'Mango';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: "Sales Entry"),
//       body: InkWell(
//         onTap: () {
//           FocusManager.instance.primaryFocus!.unfocus();
//         },
//         child: Container(
//           padding: EdgeInsets.all(10),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: 175.0,
//                   width: double.infinity,
//                   padding: EdgeInsets.only(left: 6.0, right: 6.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.0),
//                     border: Border.all(color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 6.0, left: 15.0, right: 15.0),
//                         child: Container(
//                           height: 25.0,
//                           width: double.infinity,
//                           color: Color.fromARGB(255, 5, 114, 165),
//                           child: const Center(
//                               child: Text(
//                             "Sales Type",
//                             style: TextStyle(color: Colors.white),
//                           )),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Transform.scale(
//                                 scale: 1.15,
//                                 child: Radio(
//                                     fillColor: MaterialStateColor.resolveWith(
//                                       (states) => Color.fromARGB(255, 5, 114, 165),
//                                     ),
//                                     value: "Retails",
//                                     groupValue: lavel,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         lavel = value.toString();
//                                       });
//                                     }),
//                               ),
//                               Text("Retails"),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Transform.scale(
//                                 scale: 1.15,
//                                 child: Radio(
//                                     fillColor: MaterialStateColor.resolveWith(
//                                       (states) => Color.fromARGB(255, 5, 114, 165),
//                                     ),
//                                     value: "Wholesale",
//                                     groupValue: lavel,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         lavel = value.toString();
//                                       });
//                                     }),
//                               ),
//                               Text("Wholesale"),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           const Expanded(
//                             flex: 1,
//                             child: Text(
//                               "Customer",
//                               style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               height: 30.0,
//                               width: MediaQuery.of(context).size.width / 2,
//                               child: DropdownButtonFormField(
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.only(bottom: 5.0, left: 5.0),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     //<-- SEE HERE
//                                     borderSide: BorderSide(color: Color.fromARGB(255, 90, 149, 238)),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     //<-- SEE HERE
//                                     borderSide: BorderSide(color: Color.fromARGB(255, 77, 137, 226)),
//                                   ),
//                                   filled: true,
//                                 ),
//                                 dropdownColor: Colors.greenAccent,
//                                 value: dropdownCustomerValue,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     dropdownCustomerValue = newValue!;
//                                   });
//                                 },
//                                 items: <String>['Atiq', 'Nitish', 'Maruf', 'Mehedi', 'Nahid', 'Nuzmul', 'Joy', 'Musha']
//                                     .map<DropdownMenuItem<String>>((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(
//                                       value,
//                                       style: TextStyle(fontSize: 14.0),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 3.0),
//                       Row(
//                         children: [
//                           const Expanded(
//                             flex: 1,
//                             child: Text(
//                               "Mobile Number",
//                               style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               height: 28.0,
//                               width: MediaQuery.of(context).size.width / 2,
//                               child: TextField(
//                                 controller: _phoneNumberController,
//                                 keyboardType: TextInputType.phone,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 3.0),
//                       Row(
//                         children: [
//                           const Expanded(
//                             flex: 1,
//                             child: Text(
//                               "Address",
//                               style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               height: 28.0,
//                               width: MediaQuery.of(context).size.width / 2,
//                               child: TextField(
//                                 controller: _addressController,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 6.0),
//                 Container(
//                   height: 185.0,
//                   width: double.infinity,
//                   padding: EdgeInsets.only(top: 2.0, left: 6.0, right: 6.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.0),
//                     border: Border.all(color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           const Expanded(
//                             flex: 1,
//                             child: Text(
//                               "Product",
//                               style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               height: 36.0,
//                               width: MediaQuery.of(context).size.width / 2,
//                               child: DropdownButtonFormField(
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.only(bottom: 5.0, left: 5.0),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     //<-- SEE HERE
//                                     borderSide: BorderSide(color: Color.fromARGB(255, 90, 149, 238)),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     //<-- SEE HERE
//                                     borderSide: BorderSide(color: Color.fromARGB(255, 77, 137, 226)),
//                                   ),
//                                   filled: true,
//                                 ),
//                                 dropdownColor: Colors.greenAccent,
//                                 value: dropdownProductValue,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     dropdownProductValue = newValue!;
//                                   });
//                                 },
//                                 items: <String>['Mango', 'Cap', 'Banana', 'Umbrella', 'Bike', 'Car', 'Cycle', 'Spider']
//                                     .map<DropdownMenuItem<String>>((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(
//                                       value,
//                                       style: TextStyle(fontSize: 14.0),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 3.0),
//                       Row(
//                         children: [
//                           const Expanded(
//                             flex: 1,
//                             child: Text(
//                               "Available Stock",
//                               style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               height: 28.0,
//                               width: MediaQuery.of(context).size.width / 2,
//                               child: TextField(
//                                 controller: _availableStockController,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 3.0),
//                       Row(
//                         children: [
//                           const Expanded(
//                             flex: 1,
//                             child: Text(
//                               "Sales Rate",
//                               style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               height: 28.0,
//                               width: MediaQuery.of(context).size.width / 2,
//                               child: TextField(
//                                 controller: _salesRateController,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 3.0),
//                       Row(
//                         children: [
//                           const Expanded(
//                             flex: 1,
//                             child: Text(
//                               "Quantity",
//                               style: TextStyle(color: Color.fromARGB(255, 126, 125, 125)),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               height: 28.0,
//                               width: MediaQuery.of(context).size.width / 2,
//                               child: TextField(
//                                 controller: _quantityController,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                       color: Color.fromARGB(255, 7, 125, 180),
//                                     ),
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10.0),
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: InkWell(
//                           onTap: () {
//                             ItemDetails itemDetails = ItemDetails(
//                                 customerName: dropdownCustomerValue,
//                                 address: _addressController.text,
//                                 mobile: int.parse(_phoneNumberController.text),
//                                 product: dropdownProductValue,
//                                 quantity: int.parse(_quantityController.text),
//                                 salseRate: int.parse(_salesRateController.text),
//                                 stock: int.parse(_availableStockController.text));
//                             box.add(itemDetails);
//                             _addressController.text = '';
//                             //dropdownCustomerValue = '';
//                             _phoneNumberController.text = '';
//                             //dropdownProductValue = '';
//                             _quantityController.text = '';
//                             _salesRateController.text = '';
//                             _availableStockController.text = '';
//                           },
//                           child: Container(
//                             height: 35.0,
//                             width: MediaQuery.of(context).size.width / 3,
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 6, 118, 170),
//                               border: Border.all(color: Color.fromARGB(255, 98, 236, 103), width: 2.0),
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: const Center(
//                                 child: Text(
//                               "ADD TO CART",
//                               style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
//                             )),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 320.0,
//                   width: double.infinity,
//                   child: ValueListenableBuilder(
//                     valueListenable: box.listenable(),
//                     builder: (context, Box box, widget) {
//                       if (box.isEmpty) {
//                         return Center(
//                           child: Text('No Product in Cart'),
//                         );
//                       } else {
//                         return Column(
//                           children: [
//                             Expanded(
//                               child: ListView.builder(
//                                 itemCount: box.length,
//                                 itemBuilder: (context, index) {
//                                   var currentBox = box;
//                                   var itemData = currentBox.getAt(index)!;
//                                   return Column(
//                                     children: [
//                                       SizedBox(
//                                         height: 140,
//                                         child: Card(
//                                           elevation: 5,
//                                           shape: RoundedRectangleBorder(
//                                               side: const BorderSide(
//                                                 color: Color.fromARGB(255, 0, 0, 0),
//                                               ),
//                                               borderRadius: BorderRadius.circular(10.0)),
//                                           color: Colors.white,
//                                           child: Row(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             children: [
//                                               Expanded(
//                                                 flex: 5,
//                                                 child: Container(
//                                                   padding: const EdgeInsets.only(left: 10, top: 6),
//                                                   decoration: const BoxDecoration(
//                                                       color: Color.fromARGB(255, 2, 105, 150),
//                                                       borderRadius: BorderRadius.only(
//                                                           topLeft: Radius.circular(10.0),
//                                                           bottomLeft: Radius.circular(10.0))),
//                                                   child: Column(
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                     children: [
//                                                       Text(
//                                                         "Customer Name:  ${itemData.customerName}",
//                                                         style: TextStyle(
//                                                           color: Colors.white,
//                                                           fontWeight: FontWeight.bold,
//                                                           fontSize: h1TextSize,
//                                                         ),
//                                                       ),
//                                                       Text(
//                                                         "Phone No:  ${itemData.mobile}",
//                                                         style: TextStyle(
//                                                           fontWeight: FontWeight.w500,
//                                                           color: Colors.white,
//                                                           fontSize: h2TextSize,
//                                                         ),
//                                                       ),
//                                                       Text(
//                                                         "Address:  ${itemData.address}",
//                                                         style: TextStyle(
//                                                           fontWeight: FontWeight.w500,
//                                                           color: Colors.white,
//                                                           fontSize: h2TextSize,
//                                                         ),
//                                                       ),
//                                                       Text(
//                                                         "Product:  ${itemData.product}",
//                                                         style: TextStyle(
//                                                           fontWeight: FontWeight.w500,
//                                                           color: Colors.white,
//                                                           fontSize: h2TextSize,
//                                                         ),
//                                                       ),
//                                                       Text(
//                                                         "Available Stock:  ${itemData.stock}",
//                                                         style: TextStyle(
//                                                           fontWeight: FontWeight.w500,
//                                                           color: Colors.white,
//                                                           fontSize: h2TextSize,
//                                                         ),
//                                                       ),
//                                                       Text(
//                                                         "Sales Rate:  \$${itemData.salseRate}",
//                                                         style: TextStyle(
//                                                           fontWeight: FontWeight.w500,
//                                                           color: Colors.white,
//                                                           fontSize: h2TextSize,
//                                                         ),
//                                                       ),
//                                                       Text(
//                                                         "Quantity:  ${itemData.quantity}",
//                                                         style: TextStyle(
//                                                           fontWeight: FontWeight.w500,
//                                                           color: Colors.white,
//                                                           fontSize: h2TextSize,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                   flex: 1,
//                                                   child: Container(
//                                                     color: Colors.white,
//                                                     child: FloatingActionButton(
//                                                       heroTag: null,
//                                                       onPressed: () {
//                                                         _deleteProduct(index);
//                                                         setState(() {
//                                                           box.length;
//                                                         });
//                                                       },
//                                                       mini: true,
//                                                       shape: const CircleBorder(),
//                                                       backgroundColor: Colors.white,
//                                                       child: const Icon(
//                                                         Icons.delete,
//                                                         color: Color.fromARGB(255, 3, 3, 3),
//                                                       ),
//                                                     ),
//                                                   ))
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 5,
//                                       )
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
