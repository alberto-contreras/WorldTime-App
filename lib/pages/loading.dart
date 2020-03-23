import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time = 'loading'; //It's going to be loading until we receive the answer


  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png' ,url:'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,

    });//Route to home page replacing the page and sending data throw

  }

  @override //This function it's the one that runs first
  void initState() {
    super.initState();//First run the original function that we inherit
    //Each that we run init we run then the build function
    setupWorldTime();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center( //To put in the center -> Spin
        child: SpinKitFadingCube(
          color: Colors.blue,
          size: 50.0,
        ),
      )
    );
  }
}
