import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {food, work, travel, leisure, cloth}

final formater = DateFormat.yMd();

final categoryIcon = {
  Category.cloth: Icons.shopping_basket,
  Category.food: Icons.restaurant,
  Category.travel: Icons.airplanemode_active,
  Category.leisure: Icons.shopping_bag,
  Category.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get formatedDate {
    return formater.format(date);
  }
}


class ExpenseBucket {
  final List<Expense> expenses;
  final Category category;

  ExpenseBucket({required this.expenses, required this.category});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) :
  expenses = allExpenses.where((expense) => expense.category == category).toList();

  double get totalExpenses {
    double sum = 0;
    for (final expesnse in expenses) {
      sum += expesnse.amount;
    }
    return sum;
  }
}