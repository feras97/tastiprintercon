// import 'package:flutter/material.dart';
// import 'package:tastiiCom/printservice.dart';

// class DataInputPrinter extends StatelessWidget {
//   final urlController = TextEditingController();
//   final ipController = TextEditingController();
//   final portController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TextField(
//           controller: ipController,
//           textAlign: TextAlign.center,
//           decoration: InputDecoration(
//             hintText: "Enter IP Adress",
//           ),
//         ),
//         TextField(
//           controller: portController,
//           textAlign: TextAlign.center,
//           decoration: InputDecoration(
//             hintText: "Enter Port",
//           ),
//         ),
//         RaisedButton(
//           child: Text("Start!"),
//           onPressed: () {
//             PrintService.printReceipt(portController.text, ipController.text);
//           },
//         ),
//       ],
//     );
//   }
// }