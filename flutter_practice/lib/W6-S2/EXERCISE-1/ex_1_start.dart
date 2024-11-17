import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];


//functions using map to return list of item
List<Widget> getFruits() {
 return colors.map((item) => Text(item)).toList();
}


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children:  [
            Label("Method 1: Loop in Array", bold: true),
            // using for loop
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              for (int i = 0; i < colors.length; i++) Text(colors[i]),
              ],
              ),
            Label("Method 2: Map", bold: true),
            // using map
            Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
            ...colors.map((item) => Text(item)).toList(),
            
            ],
            ),
            Label("Method 23: Dedicated Function", bold: true),
            // using function
            ...getFruits()
          ],
        ),
      ),
    ),
  ));
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
