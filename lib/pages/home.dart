import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments; //Getting the values from loading page
    print(data);

    //set background we also use a ternary operator
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue[100] : Colors.black ;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image : DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit:BoxFit.cover, )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed:(){
                      //We are pushing to another route that we can then came back thanks
                      //to the appbar that by default let us an arrow
                      Navigator.pushNamed(context,'/location');
                    },
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'], //We get the value of the location
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.deepPurple,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ) ),
          ),

    ));
  }
}