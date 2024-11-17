import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              color: Colors.blue,
            ),
            Container(
              height: 100,
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.pink,
                    height: 100,
                    width: 100,
                  )
                ],
              ),
            ),
            Container( 
              height: 100,  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    
                    child: Container(color: Colors.yellow),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                   
                    child: Container(color: Colors.yellow),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                
                    child: Container(color: Colors.yellow),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(  
              child: Container(
                color: Colors.pink,  
              )
            )
          ],
        ),
      ),
    ),
  );
}
