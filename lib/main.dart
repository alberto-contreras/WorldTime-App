import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';

void main() => runApp(MaterialApp(
  //home screen
  //loading screen
  //update location screen
  //all are located in pages packages
  initialRoute:'/' , //By default the route is Loading but we can change it

  routes: { //This property is a Map Object where we pass key value
    '/':(context) => Loading(), //Basic route context-> where we are we execute a function in this case we load all the data
    '/home':(context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));
