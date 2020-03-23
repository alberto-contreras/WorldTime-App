import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url = '';//location url for api endpoint
  bool isDaytime; //True or False if daytime or not

  WorldTime ({this.location,this.flag,this.url});//Setting it directly



  Future<void> getTime() async { //Future it's like a promise in JS it's going to return a void after doing everything (Also let us to set the await)

    try {
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      print(data);

      //get properties from data
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);//With substring we go from position 1 to 3 --> 01
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime); //Method that convert to a datetime object
      now = now.add(Duration(hours: int.parse(offset))); //Right time in Madrid because we add the offset
      //isDaytime = condition ? true : false -> ternary operator
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false ;
      //if the hour is between 6 and 20 it's day so it's true if not it's false = night
      time = DateFormat.jm().format(now); //Set the property time
    }
    catch(e){
      print(e);
      time = 'could not get time data'; //In order to don't brake the app
    }


  }
}

