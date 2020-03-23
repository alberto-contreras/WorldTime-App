import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    //make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/Europe/Madrid');
    Map data = jsonDecode(response.body);
    print(data);

    //get properties from data
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);//With substring we go from position 1 to 3 --> 01
    //print(datetime);
    //print(offset);

    //create DateTime object
    DateTime now = DateTime.parse(datetime); //Method that convert to a datetime object
    now = now.add(Duration(hours: int.parse(offset))); //Right time in Madrid beacuse we add the offset
    print(now);

  }

  @override //This function it's the one that runs first
  void initState() {
    super.initState();//First run the original function that we inherit
    //Each that we run init we run then the build function
    getTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}
