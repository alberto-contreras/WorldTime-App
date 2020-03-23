import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed:(){
                    //We are pushing to another route that we can then came back thanks
                    //to the appbar that by default let us an arrow
                    Navigator.pushNamed(context,'/location');
                  },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
              )
            ],
          ) ),

    );
  }
}