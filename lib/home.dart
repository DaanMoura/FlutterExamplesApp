import 'package:flutter/material.dart';
import 'package:flutter_layouts/routes/states.dart';
import 'package:flutter_layouts/routes/blank.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  final _radius = BorderRadius.all(Radius.circular(10.0));

  List<String> examples = [
    "State and visual parameters",
    "SliverList and SliverGrid",
    "Hero",
    "Floating Navigation Bar with Navigation Drawer",
    "Animations",
    "ML Kit - Image Classification",
    "Geolocation",
    "API - News",
    "Pie Chart",
  ];

  List<Widget> examplesRoutes = [
    StatesWithParameters(),
    Blank(),
    Blank(),
    Blank(),
    Blank(),
    Blank(),
    Blank(),
    Blank(),
    Blank(),
  ];

  Widget buildListTile(BuildContext context, List list, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Material(
        color: Colors.grey[200],
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: _radius,
        ),
        elevation: 6,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: _radius,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => examplesRoutes[index],
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                examples[index],
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: examples.length,
          itemBuilder: (BuildContext context, int index) =>
              buildListTile(context, examples, index),
        ));
  }
}
