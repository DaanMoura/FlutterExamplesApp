import 'package:flutter/material.dart';

class Blank extends StatelessWidget {
  final Widget child;

  Blank({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blank"),
      ),
      body: Center(
        child: Text("Blank"),
      ),
    );
  }
}