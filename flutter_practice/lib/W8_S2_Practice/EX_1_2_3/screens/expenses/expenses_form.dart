import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  String get title => _titleController.text;
  Category? selectedCategory;
  DateTime? selectetDate;
  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text.trim();
    double amount = double.parse(_valueController.text);

    // 2- Create the expense
    Expense expense = Expense(
        title: title,
        amount: amount,
        date: selectetDate!,
        category: selectedCategory!);

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  Future<void> dateChoose() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectetDate = pickedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _valueController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    selectetDate == null
                        ? 'No date selected'
                        : 'Date: ${DateFormat.yMMMd().format(selectetDate!)}',
                  ),
                  IconButton(
                    onPressed: dateChoose,
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<Category>(
                value: selectedCategory,
                hint: const Text("Select a category"),
                items: Category.values.map((category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Row(
                      children: [
                        Icon(category.icon),
                        const SizedBox(width: 10),
                        Text(category.name.toUpperCase()),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (Category? value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: onCancel, child: const Text('Cancel')),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(onPressed: onAdd, child: const Text('Create')),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
