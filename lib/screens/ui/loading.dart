import 'package:flutter/material.dart';
import 'package:travel_safe/screens/basic_layout.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasicLayout(
        widgt: Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
