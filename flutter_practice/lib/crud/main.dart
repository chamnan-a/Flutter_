import 'package:flutter/material.dart';
import './screens/ExpenseView.dart';
import './models/expense.dart';
void main() {
  runApp(MaterialApp(
    home: ExpenseScreen(
      expenses: [
        Expense(
          title: "Lunch",
          amount: 12.50,
          date: DateTime.now(),
          type: ExpenseType.food,
        ),
        Expense(
          title: "Taxi Ride",
          amount: 20.00,
          date: DateTime.now(),
          type: ExpenseType.travel,
        ),
        Expense(
          title: "Movie Tickets",
          amount: 15.00,
          date: DateTime.now(),
          type: ExpenseType.leisure,
        ),
        Expense(
          title: "Office Supplies",
          amount: 30.00,
          date: DateTime.now(),
          type: ExpenseType.work,
        ),
      ],
    ),
  ));
}
