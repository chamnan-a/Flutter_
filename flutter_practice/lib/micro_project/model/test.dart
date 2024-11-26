// import 'quiz.dart';
// import 'submission.dart';
// void main() {
//   // Create a quiz with questions
//   final question1 = Question(
//     title: 'What is 2 + 2?',
//     possibleAnswers: ['3', '4', '5'],
//     goodAnswer: '4',
//   );
//   final question2 = Question(
//     title: 'What is the capital of France?',
//     possibleAnswers: ['Paris', 'London', 'Rome'],
//     goodAnswer: 'Paris',
//   );
  
//   final quiz = Quiz(title: 'Sample Quiz', questions: [question1, question2]);

//   // Create a submission instance
//   final submission = Submission();

//   // Test 1: Add answers
//   submission.addAnswer(question1, '4'); // Correct answer
//   submission.addAnswer(question2, 'Paris'); // Correct answer

//   // Test 2: Get score
//   final score = submission.getScore();
//   print('Test 2 - Get Score:');
//   print('Expected: 2, Got: $score'); // Both answers are correct
//   print('---');

//   // Test 3: Update an answer
//   submission.addAnswer(question1, '6'); // Incorrect answer (update)

//   // Check updated answer for question1
//   final updatedAnswer = submission.getAnswerFor(question1);
//   print('Test 3 - Update Answer:');
//   print('Expected: 5, Got: ${updatedAnswer?.userAnswer}'); // Updated to '5'
//   print('---');

//   // Test 4: Get score after updating
//   final updatedScore = submission.getScore();
//   print('Test 4 - Get Updated Score:');
//   print('Expected: 1, Got: $updatedScore'); // Only 1 correct answer now
//   print('---');

//   // Test 5: Remove answers
//   submission.removeAnswers();
//   final answersAfterRemoval = submission.answers;
//   print('Test 5 - Remove All Answers:');
//   print('Expected: 0, Got: ${answersAfterRemoval.length}'); // List should be empty
// }