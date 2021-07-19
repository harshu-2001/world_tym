import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
// ignore: camel_case_types
class World_time{

  var time; //the time in that location
  var time1;
  var flag;//url to an assest flat icon
  var location;//the location name for ui
  var uro ;//location url for api endpoint
  var date;// date of a location 
  var isdaytime; // true or false if day or Navigator

  World_time({this.uro,this.location,this.flag});

  // Future<void>get1()async{
  //   try {
  //      var response = await http.get(
  //     Uri.parse("http://worldtimeapi.org/api/timezone/$uro"),
  //     headers: {
  //       "Accept": "application/json"
  //     }
  //   );
  //   Map data =jsonDecode(response.body);
  //   if (data!=null) {
  //     var datetime=data['datetime'];
  //   var offseth=data['utc_offset'].substring(1,3);
  //   var offsetm=data['utc_offset'].substring(4,);

  //   DateTime now =DateTime.parse(datetime);
  //   now=now.add(Duration(hours:int.parse(offseth),minutes: int.parse(offsetm)));
    
  //   time1 =DateFormat.jms().format(now);
  //   }
    
    
  //   } catch (e) {
  //     print("output: -$e");

  //       time1="could not get time data :";
  //   }
  // }
  Future<void> getTime() async{
    try{
    //make the request 
    //Response response= await get(Uri.parse("http://worldtimeapi.org/api/timezone/$uro"));
    var response = await http.get(
      Uri.parse("http://worldtimeapi.org/api/timezone/$uro"),
      headers: {
        "Accept": "application/json"
      }
    );
    Map data =jsonDecode(response.body);
    //print(data);
    //http://worldtimeapi.org/api/timezone/Asia/Kolkata
    //GET PROPERTIES FROM JSON data
    if (data!=null){
    var datetime=data['datetime'];
    var offseth=data['utc_offset'].substring(1,3);
    var offsetm=data['utc_offset'].substring(4,);
    
    //print("$datetime \n $offseth\n $offsetm");

    // create date time object
    DateTime now =DateTime.parse(datetime);
    now=now.add(Duration(hours:int.parse(offseth),minutes: int.parse(offsetm)));

    isdaytime=now.hour >6 && now.hour<20 ?true :false;

    
    time =DateFormat.jms().format(now);
    date=DateFormat.yMMMEd().format(now);
    }
    }
    catch(e){
        print("output: -$e");

        time="could not get time data :";
    }
  }

  toLowerCase() {}

}