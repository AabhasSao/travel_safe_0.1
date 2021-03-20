import 'package:flutter/material.dart';
import 'package:travel_safe/screens/basic_layout.dart';
import 'package:travel_safe/screens/auth/signIn.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasicLayout(
        widgt: SignIn(),
        fullWidth: false,
      ),
    );
  }
}
