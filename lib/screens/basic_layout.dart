import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  BasicLayout({this.widgt});
  final Widget widgt;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: widgt == null ? Text("Hey") : widgt,
      ),
    );
  }
}
