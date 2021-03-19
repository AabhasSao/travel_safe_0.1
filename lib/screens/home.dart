import 'package:flutter/material.dart';
import 'package:travel_safe/screens/driver.dart';
import 'package:travel_safe/screens/qr_scanner.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: QrScanner(),
    );
  }
}
