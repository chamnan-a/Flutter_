import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isScreenA = true; // Boolean to track current screen

  // Function to switch screens
  void _switchScreen() {
    setState(() {
      _isScreenA = !_isScreenA; // Toggle between Screen A and Screen B
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Switch Screens Without Navigator"),
        ),
        body: Center(
          child: _isScreenA
              ? ScreenA(onSwitch: _switchScreen) // Show Screen A
              : ScreenB(onSwitch: _switchScreen), // Show Screen B
        ),
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  final VoidCallback onSwitch;

  ScreenA({required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("This is Screen A"),
        ElevatedButton(
          onPressed: onSwitch, // Switch to Screen B
          child: Text("Go to Screen B"),
        ),
      ],
    );
  }
}

class ScreenB extends StatelessWidget {
  final VoidCallback onSwitch;

  ScreenB({required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("This is Screen B"),
        ElevatedButton(
          onPressed: onSwitch, // Switch to Screen A
          child: Text("Go to Screen A"),
        ),
      ],
    );
  }
}
