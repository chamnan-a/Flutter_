import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseScreen extends StatefulWidget {
  final List<Expense> expenses   ;

  const ExpenseScreen({super.key, required this.expenses});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD"),
      ),
      body: ListView(
        children: widget.expenses.map((expense) {
          return ExpenseCard(expense: expense);
        }).toList(),
      ),
    );
  }
}

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(expense.title),
        subtitle: Text(
          "${expense.type.name.toUpperCase()} - ${expense.date.toLocal()}",
          style: TextStyle(color: Colors.grey[700]),
        ),
        trailing: Text("\$${expense.amount.toStringAsFixed(2)}"),
      ),
    );
  }
}
