import 'package:flutter/material.dart';
import 'package:masarefy/screens/widgets/new_expense.dart';
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

  void _openAddEXpensesOverlay() {
    showModalBottomSheet(context: context, builder: (context) {
      return const NewExpense();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masarefy'),
        actions: [
          IconButton(
            onPressed: _openAddEXpensesOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("chart"),
            Expanded(child: ExpensesList(expenses: _savedExpenses))
          ],
        ),
      ),
    );
  }
}
