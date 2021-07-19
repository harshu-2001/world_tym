import 'package:flutter/material.dart';
import 'package:world_time/classe/world_class_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
 void superc() async{

    World_time inti=World_time(location: "Kolkata",uro: "Asia/Kolkata",flag: "india.png");
    await inti.getTime();
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      "location":inti.location,
      "flag":inti.flag,
      "time":inti.time,
      "Date": inti.date,
      "isdaytime": inti.isdaytime,
      "uro" : inti.uro,
    });
    
 } 
  @override
  void initState() {
    super.initState();
    superc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: Center(
        child:SpinKitFoldingCube(

                color: Colors.white,
                size: 50.0,
          ),
      ) 
          
    );
  }
}
