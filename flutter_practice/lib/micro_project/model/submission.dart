import './quiz.dart';
class Submission{
  final List<Answer> answers=[];
  //function
  int getScore(){
    int score=0;
    for(var answer in answers){
      if(answer.isCorrect()){
        score++;
      }
    }
    return score;
  }
    Answer? getAnswerFor(Question question) {
    for (var answer in answers) {
      if (answer.answer == question) {
        return answer;
      }
    }
    return null; // Return null if no match
  }
  
void addAnswer(Question question, String userAnswer) {
  // Check if the question already has an answer
  for (var i = 0; i < answers.length; i++) {
    if (answers[i].answer == question) {
      answers[i] = Answer(userAnswer: userAnswer, answer: question);
      return; 
    }
  }
  answers.add(Answer(userAnswer: userAnswer, answer: question));
}
  // remove all answers
  void removeAnswers() {
    answers.clear(); 
  }
  


}

