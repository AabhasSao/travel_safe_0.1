import 'package:flutter/material.dart';
import 'package:travel_safe/screens/basic_layout.dart';

class JourneyComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      widgt: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          child: Center(
            child: Text(
              'Destination Reached Safely',
              style: TextStyle(
                fontSize: 23,
                color: Colors.blue.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
        Image(
          image: NetworkImage(
              "https://memegenerator.net/img/instances/54598741/thank-you-yessss-finally-over.jpg"),
        ),
      ]),
    );
  }
}
