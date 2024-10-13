void main() {
  // 1 - iLike
  String iLike = 'I like pizza';
  answer: CONST Because this variable never changes 

  // 2 - toppings
  String toppings = 'with tomatoes';
  toppings += " and cheese";
  answer: var because we concat later

  // 3 - message
  String message = '$iLike $toppings';
  print(message);

  answer: final because variable is determined at runtime

  // 4 - rbgColors
  List<String> rbgColors = ['red', 'blue', 'green'];
  print(rbgColors);
  answer:CONST because variable never change

  // 5 - weekDays
  List<String> weekDays = ['monday', 'tuesday', 'wednesday'];
  weekDays.add('thursday');
  print(weekDays);
  answer: final because we add another date and varaiable is determined at runtime
  // 6 - scores
  List<int> scores = [45,35,50];
  scores = [45,35,50, 78];
  print(scores);
}
 answer:var beacuse variable change againa after assign new List


