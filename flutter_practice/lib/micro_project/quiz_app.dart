import 'package:flutter/material.dart';
import 'model/quiz.dart';
import './screens/question_screen.dart';
import './screens/result_screen.dart';
import './screens/welcome_screen.dart';
import 'model/submission.dart';
enum QuizState{notStarted,started,finished}

Color appColor = Colors.blue[500] as Color;
 
class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted; // Initial state
  int currentQuestionIndex = 0;
 
  final Submission submission = Submission();
  @override
  Widget build(BuildContext context) {
    Widget screen;

    // Decide which screen to show based on quiz state
    switch (quizState) {
      case QuizState.notStarted:
        screen = WelcomeScreen(
          onStart: _startQuiz,
          quizTitle: widget.quiz.title,
        );
        break;
      case QuizState.started:
        screen = QuestionScreen(
          question: widget.quiz.questions[currentQuestionIndex],
          onTap: (selectedAnswer) => _handleAnswer(selectedAnswer), // Pass VoidCallback to process the answer
        );
        break;
      case QuizState.finished:
        screen = ResultScreen(onRestart: _restartQuiz,
    submission: submission,
    quiz: widget.quiz,);
        break;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(widget.quiz.title)),
        body: screen,
      ),
    );
  }

  // Function to start the quiz
  void _startQuiz() {
    setState(() {
      quizState = QuizState.started;
      currentQuestionIndex = 0;
      
    });
  }

void _handleAnswer(String selectedAnswer) {
  setState(() {
    final currentQuestion = widget.quiz.questions[currentQuestionIndex];
    submission.addAnswer(currentQuestion, selectedAnswer);

    if (currentQuestionIndex == widget.quiz.questions.length - 1) {
      quizState = QuizState.finished; // Go to result screen
    } else {
      currentQuestionIndex++;
    }
  });
}

// Reset Quiz
void _restartQuiz() {
  setState(() {
    quizState = QuizState.notStarted;
    currentQuestionIndex = 0;
    submission.removeAnswers(); // Clear all answers
  });
}
}


