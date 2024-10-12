void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];
  var pass=scores.where((score)=>score>50);
  print(pass.toList());
  print('Student who pass:${pass.length}');
  // You code
  
}