import 'package:flutter/material.dart';
import 'package:masarefy/screens/models/expense.dart';
import 'package:masarefy/screens/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpensesItem(expense: expenses[index]),
    );
  }
}
