import 'package:flutter/material.dart';
import 'package:travel_safe/screens/sign_in.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: SignIn(),
      ),
    );
  }
}
