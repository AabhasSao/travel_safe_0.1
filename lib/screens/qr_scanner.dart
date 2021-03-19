import 'package:flutter/material.dart';
import 'package:travel_safe/screens/driver.dart';

class QrScanner extends StatelessWidget {
  final vehicle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: vehicle,
          ),
          MaterialButton(
            child: Text('Go'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Driver(
                    vehicleId: vehicle.text,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
