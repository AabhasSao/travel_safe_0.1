import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_safe/models/GetDriver.dart';
import 'package:travel_safe/screens/basic_layout.dart';
import 'package:travel_safe/screens/maps/mapsView.dart';

class Driver extends StatelessWidget {
  final String vehicleId;
  Driver({Key key, @required this.vehicleId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        GetDriver(vehicleId),
        SizedBox(height: 60),
        FlatButton(
          padding: EdgeInsets.all(15),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BasicLayout(
                  widgt: MapView(
                    driverId: vehicleId,
                  ),
                ),
              ),
            );
          },

          child: Text(
            "Start Journey",
            style: TextStyle(color: Colors.indigo[900]),
          ),
          //Button having rounded rectangle border
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.indigo[900]),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ],
    );
  }
}
