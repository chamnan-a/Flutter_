import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

<<<<<<< HEAD
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
=======
class _ScoreCardState extends State<ScoreCard> {
  double score = 0; // Initial score value from 0
>>>>>>> 5e963f10ab84615d5fe006f01d26a14b34216ba5

class _MyAppState extends State<MyApp> {
  bool _isScreenA = true; // Boolean to track current screen

  // Function to switch screens
  void _switchScreen() {
    setState(() {
      _isScreenA = !_isScreenA; // Toggle between Screen A and Screen B
    });
  }

<<<<<<< HEAD
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
=======
  // Function to decrease score
  void decreaseScore() {
    setState(() {
      if (score > 0) {
        score--;
      }
    });
  }

  // Function to calculate the width for the progress bar
  double calculateProgressBarWidth(double score, double maxWidth) {
      //set limit score to be range from 1-10
    if (score < 0) score = 0;
    if (score > 10) score = 10;
    return (score / 10.0) * maxWidth; //normalize the score 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.text,
                style: const TextStyle(fontSize: 28),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: decreaseScore,
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: increaseScore,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //use layout builde widget for working both chrome and emulator
            LayoutBuilder(
              builder: (context, constraints) {
                 //the maxwidth alway minus 8 to make it look stay inside the border container (the left and right width)
                double progressWidth = calculateProgressBarWidth(score, constraints.maxWidth - 8);
                return Stack(
                  fit: StackFit.loose,
                  children: [
                    // Border Container
                    Container(
                      width: constraints.maxWidth,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 4),
                      ),
                    ),
                    // Progress Container
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Container(
                        width: progressWidth,
                        height: 22,
                        decoration: BoxDecoration(
                          color: widget.colorBar,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
>>>>>>> 5e963f10ab84615d5fe006f01d26a14b34216ba5
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
