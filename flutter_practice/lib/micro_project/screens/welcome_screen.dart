import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final String quizTitle;

  const WelcomeScreen({
    Key? key,
    required this.onStart,
    required this.quizTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Blue background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/w7-s1/quiz-logo.png',
            width: 250,
            height: 250,
            fit: BoxFit.contain,),
            SizedBox(height: 20), // Spacing
            // Quiz title
            Text(
              quizTitle,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40), // Spacing
            // Start button
            ElevatedButton.icon(
              onPressed: onStart, // Trigger callback
              icon: Icon(Icons.arrow_forward), // Arrow icon
              label: Text('Start Quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // White background
                foregroundColor: Colors.blue, // Text/icon color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
