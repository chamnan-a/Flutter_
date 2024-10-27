import 'package:flutter/material.dart';
void main() {
runApp(MaterialApp(
  
home: Container(
  margin: EdgeInsets.all(40),
  padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.blue[300]
  ),
child:Container(
  margin: EdgeInsets.all(10),
  padding:EdgeInsets.all(20),
  decoration: BoxDecoration(
    color:Colors.blue[600], 
  borderRadius: BorderRadius.circular(15)),
  child: Center(child: Text("CADT STUDENT",style:TextStyle(color: Colors.black,decoration: TextDecoration.none,fontSize: 28)),),
)

),
));

}