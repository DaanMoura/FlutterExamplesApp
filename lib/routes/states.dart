import 'package:flutter/material.dart';

class StatesWithParameters extends StatefulWidget {
  final Widget child;

  StatesWithParameters({Key key, this.child}) : super(key: key);

  _StatesWithParametersState createState() => _StatesWithParametersState();
}

class _StatesWithParametersState extends State<StatesWithParameters> {
  double barElevation;
  Color barColor;
  Color titleColor;
  String bodyContent = "You can't change this content";
  double textSize = 24;
  double topPadding = 8;
  double bottomPadding = 8;
  double leftPadding = 8;
  double rightPadding = 8;

  @override
  void initState() {
    super.initState();
    setState(() {
      barElevation = 6;
      textSize = 20;
      topPadding = 8;
      bottomPadding = 8;
      leftPadding = 8;
      rightPadding = 8;
      barColor = Colors.blue;
      titleColor = Colors.white;
      bodyContent = "You can't change this content";
    });
  }

  Widget _buildDialog() {
    return Center(
      child: Material(
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Title of dialog",
                style: Theme.of(context).textTheme.headline,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(context: context, builder: (context) => _buildDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State and Visual Parameters"),
        elevation: barElevation,
        backgroundColor: barColor,
      ),
      body: Container(
        color: Colors.grey,
        child: Center(
          child: Text(
            bodyContent,
            style: TextStyle(fontSize: textSize),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: _showDialog,
      ),
    );
  }
}
