import 'package:flutter/material.dart';
import 'package:travel_safe/models/GetDriver.dart';
import 'package:travel_safe/screens/basic_layout.dart';

class Driver extends StatelessWidget {
  final String vehicleId;
  Driver({Key key, @required this.vehicleId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      widgt: GetDriver(vehicleId),
    );
  }
}
