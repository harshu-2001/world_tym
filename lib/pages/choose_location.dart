import 'package:flutter/material.dart';
import 'package:world_time/classe/world_class_time.dart';

class Choose extends StatefulWidget {
  const Choose({ Key? key }) : super(key: key);

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  
   List<World_time> locations = [
    World_time(uro: 'Europe/London', location: 'London', flag: 'uk.png'),
    World_time(uro: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    World_time(uro: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    World_time(uro: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    World_time(uro: 'America/Chicago', location: 'Chicago', flag: 'america.jpg'),
    World_time(uro: 'America/New_York', location: 'New York', flag: 'america.jpg'),
    World_time(uro: 'Asia/Seoul', location: 'Seoul', flag: 'SouthKorea.jpg'),
    World_time(uro: 'Asia/kolkata', location: 'Kolkata', flag: 'india.png'),
    World_time(uro: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    World_time(uro: 'Australia/Adelaide', location: 'Adelaide', flag: 'Australia.jpg'),
    World_time(uro: 'Australia/Brisbane', location: 'Brisbane', flag:'Australia.jpg'),
    World_time(uro: 'Australia/Broken_Hill', location: 'Broken_Hill', flag: 'Australia.jpg'),
    World_time(uro: 'Australia/Darwin', location: 'Darwin', flag: 'Australia.jpg'),
    World_time(uro: 'Australia/Eucla', location: 'Eucla', flag: 'Australia.jpg'),
    World_time(uro: 'Australia/Hobart', location: 'Hobart', flag: 'Australia.jpg'),
    World_time(uro: 'Australia/Lindeman', location: 'Lindeman', flag: 'Australia.jpg'),

  ];
  void update(index)async{
    World_time inti=  locations[index];
    await inti.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      "location":inti.location,
      "flag":inti.flag,
      "time":inti.time,
      "Date": inti.date,
      "uro" : inti.uro,
      "isdaytime": inti.isdaytime,
    });

  }
   @override
  void initState() {
    super.initState();
  }
    
  Widget appBarTitle = new Text("Set Location");
  Icon actionIcon = new Icon(Icons.search); 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
    
      appBar: AppBar(
        title: appBarTitle,
        backgroundColor: Colors.blue.shade400,
        actions: <Widget>[
          new IconButton(icon: actionIcon,onPressed:(){
          setState(() {
                     if ( this.actionIcon.icon == Icons.search){
                      this.actionIcon = new Icon(Icons.close);
                      this.appBarTitle = new TextField(
                        style: new TextStyle(
                          color: Colors.white,

                        ),
                        decoration: new InputDecoration(
                          prefixIcon: new Icon(Icons.search,color: Colors.white),
                          hintText: "Search...",
                          hintStyle: new TextStyle(color: Colors.white)
                        ),
                      );}
                      else {
                        this.actionIcon = new Icon(Icons.search);
                        this.appBarTitle = new Text("Set Location");
                      }


                    });
        } ,)
        ],
        elevation: 0,
        centerTitle: true,
      ),
       body: Scrollbar(
                child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    update(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
       ),
    
    );
  }
}