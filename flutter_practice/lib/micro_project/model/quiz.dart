 
class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});
}

class Question {
  final String title;
  final List<String> possibleAnswers;
  final String goodAnswer;
  const Question({required this.title, required this.possibleAnswers, required this.goodAnswer});
}

class Answer{
 final String userAnswer;
 final Question answer;
   Answer({required this.userAnswer,required this.answer});
  bool isCorrect(){
    return userAnswer==answer.goodAnswer;
  }
}




