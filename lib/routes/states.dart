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
  String tempInput;

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
      tempInput = "";
    });
  }

  void _updateInput(String input) {
    setState(() {
      tempInput = input;
    });
  }

  void _updateLayout() {
    setState(() {
      bodyContent = tempInput;
    });

    Navigator.pop(context);
  }

  Widget _buildDialog() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  "Customization",
                  style: Theme.of(context).textTheme.headline,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Change the content here."
                  ),
                  onChanged: (String input) => _updateInput(input),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text("Done"),
                      onPressed: _updateLayout,
                    )
                  ],
                )
              ],
            ),
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
        title: Text("States and Layout Customization"),
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
