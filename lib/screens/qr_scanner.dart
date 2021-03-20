import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:travel_safe/components/inputField.dart';
import 'package:travel_safe/screens/basic_layout.dart';
import 'package:travel_safe/screens/driver.dart';

class QrScanner extends StatefulWidget {
  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  String qrCodeResult = "";
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Message displayed over here
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),

            //Button to scan QR code
            FlatButton(
              padding: EdgeInsets.all(15),
              onPressed: () async {
                String codeSanner =
                    await BarcodeScanner.scan(); //barcode scnner
                setState(() {
                  qrCodeResult = codeSanner;
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BasicLayout(
                      widgt: Driver(
                        vehicleId: qrCodeResult,
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "Open Scanner",
                style: TextStyle(color: Colors.indigo[900]),
              ),
              //Button having rounded rectangle border
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.indigo[900]),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            TextField(
              controller: _controller,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Enter Vehicle no. manually",
                labelStyle: TextStyle(color: Colors.grey),
              ),
            ),
            MyInputField().textField(
              controller: _controller,
              prefixIcon: Icon(Icons.edit),
            ),
            FlatButton(
              padding: EdgeInsets.all(15),
              onPressed: () async {
                setState(() {
                  qrCodeResult = _controller.value.text;
                });
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.indigo[900]),
              ),
              //Button having rounded rectangle border
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.indigo[900]),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// final vehicle = TextEditingController();
// @override
// Widget build(BuildContext context) {
//   return Container(
//     child: Column(
//       children: [
//         TextField(
//           controller: vehicle,
//         ),
//         MaterialButton(
//           child: Text('Go'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Driver(
//                   vehicleId: vehicle.text,
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     ),
//   );
