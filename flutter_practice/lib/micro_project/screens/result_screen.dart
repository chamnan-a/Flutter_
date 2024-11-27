import 'package:flutter/material.dart';
import '../model/quiz.dart';
import '../model/submission.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart; // Callback to restart the quiz
  final Submission submission; 
  final Quiz quiz; // Quiz details

  const ResultScreen({
    required this.onRestart,
    required this.submission,
    required this.quiz,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final score = submission.getScore();
    final totalQuestions = quiz.questions.length;

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Quiz Score
            Text(
              'You answered $score on $totalQuestions!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            // Question Results
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final answer = submission.getAnswerFor(question);

                  return _ResultItem(
                    index:index+1 ,
                    question: question,
                    userAnswer: answer?.userAnswer,
                  );
                },
              ),
            ),

          
            ElevatedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              label: const Text("Restart Quiz"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Result Item Widget
class _ResultItem extends StatelessWidget {
  final int index; 
  final Question question;
  final String? userAnswer;

  const _ResultItem({
    required this.index, 
    required this.question,
    required this.userAnswer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCorrect = userAnswer == question.goodAnswer;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Identifier
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: isCorrect ? Colors.green : Colors.red,
                  child: Text(
                    '$index', // Display the question index
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    question.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            
...question.possibleAnswers.map(
  (answer) {
    return Row(
      children: [
        
        Icon(
          answer == question.goodAnswer
              ? Icons.check_circle
              : (answer == userAnswer ? Icons.cancel : Icons.circle),
          color: answer == question.goodAnswer
              ? Colors.green
              : (answer == userAnswer ? Colors.red : Colors.grey),
        ),
        const SizedBox(width: 8), 

        
        Text(
          answer,
          style: TextStyle(
            color: answer == question.goodAnswer
                ? Colors.green // Correct answer text is always green
                : (answer == userAnswer ? Colors.red : Colors.black),
            fontWeight: answer == userAnswer ? FontWeight.bold : FontWeight.normal,
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
