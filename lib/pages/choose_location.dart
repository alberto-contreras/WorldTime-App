import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  //This function it's going use getTime on wherever instance and then once we have the data re root to the home page
  void updateTime(index) async
  {
    WorldTime instance = locations[index]; //now we have the instance stored
    await instance.getTime();
    //We are going to navigate to home page and passing the data
    Navigator.pop(context,  { //We use pop (PILA DE PAGINAS) to get back to the homepage that we where before the choose_location
      'location': instance.location,
      'flag': instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,

    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical:1.0, horizontal: 4.0),
          itemCount: locations.length,
      itemBuilder: (context,index){ //This function will make a widget tree of the one we choose
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index); //Here we update with the one we choose
              },//Link on press function
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index]}'),
              ),
            )
          );
      },)
    );
  }
}
