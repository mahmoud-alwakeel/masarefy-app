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

  void _addExpenseItem(Expense expense) {
    setState(() {
      _savedExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final registeredIndex = _savedExpenses.indexOf(expense);
    setState(() {
      _savedExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense item deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _savedExpenses.insert(registeredIndex, expense);
              });
            }),
      ),
    );
  }

  void _openAddEXpensesOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              top: 48,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: NewExpense(
              addExpense: _addExpenseItem,
            ),
          );
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
            Expanded(
              child: _savedExpenses.isEmpty
                  ? const Center(
                      child: Text('No expenses, Add some'),
                    )
                  : ExpensesList(
                      expenses: _savedExpenses,
                      onRemoveExpense: _removeExpense,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
