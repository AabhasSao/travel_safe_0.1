import 'package:flutter/material.dart';

class BasicLayout extends StatelessWidget {
  BasicLayout({this.widgt, this.fullWidth = true});
  final Widget widgt;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Safe'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: fullWidth ? _width : _width / 1.3,
          child: widgt == null ? Text("Hey") : widgt,
        ),
      ),
    );
  }
}
