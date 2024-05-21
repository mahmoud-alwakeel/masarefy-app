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
