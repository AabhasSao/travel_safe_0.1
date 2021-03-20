import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  BasicLayout({this.widgt});
  final Widget widgt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: widgt == null ? Text("Hey") : widgt,
        ),
      ),
    );
  }
}
