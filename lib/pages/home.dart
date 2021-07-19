
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/classe/world_class_time.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var data;
  void _getTime()async{
    World_time inti=World_time(uro: data['uro'], location: data['location'], flag: data['flag']);
    await inti.getTime();

    setState(() {
    
    data["time"]=inti.time; 
      
    });
    
  }
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }
  @override
  Widget build(BuildContext context) {
    data=data!=null?data:ModalRoute.of(context)!.settings.arguments ;
    //print(data);
    String bgimage;
    var bgcolor;
    //set background 
    if(data!=null){
     bgimage=data['isdaytime']?'day.jpg':'night.jpg';
     bgcolor=data['isdaytime']?Colors.grey.shade900:Colors.grey.shade600;
    }
    else{
      bgimage='night.jpg';
       bgcolor=Colors.grey.shade600;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/$bgimage"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(bgcolor, BlendMode.softLight)

          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 80.0, 5.0, 10.0),
        
          child: SafeArea(
            child:Column(           
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ElevatedButton.icon(
                style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300),
  ),
              
              onPressed: ()async{

               // ignore: await_only_futures
               dynamic result= await Navigator.pushNamed(context, "/location");
               if (result!=null){
                 setState(() {
                 data={
                     "location":result['location'],
                     "flag":result['flag'],
                     "time":result['time'],
                     "Date": result['Date'],
                     "isdaytime": result['isdaytime'],
                     "uro" : result['uro'],
                 };
               });
               }
              }, 
              label: Text(
                "Set Location",
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 15.0
                ),
                ), 
              icon: Icon(Icons.location_pin,
              size: 25,
              color: Colors.grey.shade900,
              ),
             ),
            ),
            SizedBox(height:30),
            Row(
              
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data['location'],
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 4.0,
                  color: Colors.cyan.shade50
                ),),
                
                
              ],
            ),
             SizedBox(height:20),
            Text(data['Date'],
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 2.0,
                  color: Colors.grey.shade200,
                ),),
            SizedBox(height:20),
            Text(data['time'],
                style: TextStyle(
                  fontSize: 50,
                  letterSpacing: 2.0,
                  color: Colors.grey.shade200,
                ),),
          ]
          ),
          ),
        ),
      )
      
    );
  }
}