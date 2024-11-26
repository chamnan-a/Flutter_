 import 'package:uuid/uuid.dart';
 const Uuid uuid=Uuid();
class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType type;
  Expense({required this.title,required this.amount,required this.date,required this.type}):this.id=uuid.v4();
}
enum ExpenseType{
  food,
  travel,
  leisure,
  work
}

