import 'package:flutter/material.dart';
import 'package:masarefy/screens/expenses.dart';

void main() {
  runApp(const MasarefyApp());
}

class MasarefyApp extends StatelessWidget {
  const MasarefyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    );
  }
}