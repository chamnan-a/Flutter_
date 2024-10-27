import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      child:Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:Colors.blue[100],
            ),
            child: Center(child: const Text("OOP",style: TextStyle(color: Colors.white,decoration:TextDecoration.none),)),
          ),
                    Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:Colors.blue[300],
            ),
            child: Center(child: const Text("DART",style: TextStyle(color: Colors.white,decoration:TextDecoration.none),)),
          ),
                    Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                Color(0xFF64B5F6),
                Color(0xFF1E88E5),
              ]),
            ),
            child: Center(child:  const Text("FLUTTER",style: TextStyle(color: Colors.white,decoration:TextDecoration.none),)),
          )
        ],
      )
     ),
  ));
}
