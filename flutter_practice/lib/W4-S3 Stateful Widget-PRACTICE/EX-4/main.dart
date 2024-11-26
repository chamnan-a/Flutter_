import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Score"),
            backgroundColor: Colors.greenAccent,
          ),
          backgroundColor: Colors.green[50],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScoreCard(
                    text: "My Flutter Score",
                    colorBar: Colors.green[800],
                  ),
                  SizedBox(height: 10),
                  ScoreCard(
                    text: "My Dart Score",
                    colorBar: Colors.green[600],
                  ),
                  SizedBox(height: 10),
                  ScoreCard(
                    text: "My React Score",
                    colorBar: Colors.green[900],
                  ),
                ],
              ),
            ),
          ))));

class ScoreCard extends StatefulWidget {
  final String text;
  final Color? colorBar;

  const ScoreCard({super.key, required this.text, this.colorBar = Colors.greenAccent});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  double score = 0; // Initial score value

  // Function to increase score
  void increaseScore() {
    setState(() {
      if (score < 10) {
        score++;
      }
    });
  }

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
    if (score < 0) score = 0;
    if (score > 10) score = 10;
    return (score / 10.0) * maxWidth; // Ensure score 10 fills the entire bar
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
            LayoutBuilder(
              builder: (context, constraints) {
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
        ),
      ),
    );
  }
}