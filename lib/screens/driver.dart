import 'package:flutter/material.dart';
import 'package:travel_safe/models/GetDriver.dart';
import 'package:travel_safe/screens/Gmaps.dart';
import 'package:travel_safe/screens/basic_layout.dart';

class Driver extends StatelessWidget {
  final String vehicleId;
  Driver({Key key, @required this.vehicleId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: NetworkImage(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
        ),
        GetDriver(vehicleId),
        FlatButton(
          padding: EdgeInsets.all(15),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BasicLayout(
                  widgt: Gmaps(),
                ),
              ),
            );
          },
          child: Text(
            "Proceed to Maps",
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
