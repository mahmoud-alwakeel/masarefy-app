import 'package:flutter/material.dart';
import 'package:masarefy/screens/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${expense.amount.toStringAsFixed(2)}"),
                Row(
                  children: [
                    Icon(categoryIcon[expense.category]),
                    const SizedBox(width: 5),
                    Text(expense.formatedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}