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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Message displayed over here
              Image(
                image: NetworkImage(
                    'https://cdn.techwireasia.com/wp-content/uploads/2020/06/shutterstock_1648721011.jpg'),
              ),
              SizedBox(
                height: 20.0,
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
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Text(
                    'or',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyInputField().textField(
                  controller: _controller,
                  prefixIcon: Icon(Icons.edit),
                  label: 'Enter Vehicle no. manually'),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                padding: EdgeInsets.all(15),
                onPressed: () async {
                  setState(() {
                    qrCodeResult = _controller.value.text;

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
      ),
    );
  }
}
