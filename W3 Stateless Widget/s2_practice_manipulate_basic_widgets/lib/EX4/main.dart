import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      child:Column(
        children: [
          CustomCard("OOP",color: Colors.blue[100],),
          CustomCard("Dart",color: Colors.blue[300],),
          CustomCard("FLUTTER",color: Colors.blue[600],)
        ],
      )
     ),
  ));
}

class CustomCard extends StatelessWidget {
  const CustomCard(this.label,{
    super.key,this.color=Colors.blue
  });
    final String label;
    final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:color,
      ),
      child: Center(child:  Text(label,style: TextStyle(color: Colors.white,decoration:TextDecoration.none),)),
    );
  }
}
