
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Hobby"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          HobbyCard(title: "Travelling",icon: Icons.travel_explore,),
          HobbyCard(title: "Skateboarding",icon: Icons.skateboarding,color: Colors.amber,),
          HobbyCard(title: "Sledding",icon: Icons.sledding,color: Colors.blueGrey,)
          
          ],
        )
      )

      )
    ),
  );
}

class HobbyCard extends StatelessWidget {
  const HobbyCard({required this.title,required this.icon,this.color=Colors.blue,
    super.key,
  });
  final String title;
  final IconData icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0,left:30.0),
              child: Icon(icon),
            ),
           Text(title,style: TextStyle(color: Colors.white,fontSize: 25),)
          ],
        ),
      ),
    );
  }
}
