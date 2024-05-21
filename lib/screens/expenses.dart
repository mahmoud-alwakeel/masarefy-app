import 'package:flutter/material.dart';
import 'package:masarefy/screens/models/expense.dart';
import 'package:masarefy/screens/widgets/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _savedExpenses = [
    Expense(
      title: 'coffe',
      amount: 10,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'jacket',
      amount: 500,
      date: DateTime.now(),
      category: Category.cloth,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("chart"),
            Expanded(child: ExpensesList(expenses: _savedExpenses))
          ],
        ),
      ),
    );
  }
}