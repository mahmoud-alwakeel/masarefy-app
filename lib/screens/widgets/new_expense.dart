import 'package:flutter/material.dart';
import 'package:masarefy/screens/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _openDatePicker() async {
    final nowTime = DateTime.now();
    final firstDate = DateTime(nowTime.year - 1, nowTime.month, nowTime.day);
    final lastDate = nowTime;
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: nowTime,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  bool get validPrice {
    final enteredPrice = double.tryParse(_priceController.text);
    return enteredPrice == null || enteredPrice >= 0;
  }

  bool get validExpense => _titleController.text.trim().isNotEmpty;
  bool get validDate => _selectedDate != null;
  bool get validPriceAndExpenseAndDate =>
      validExpense && validPrice && validDate;

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 8, 8, keyboardSpace + 8),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 20,
                decoration: const InputDecoration(
                  label: Text('label'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\$ ',
                        label: Text('price'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_selectedDate == null
                            ? 'Select Date'
                            : formater.format(_selectedDate!)),
                        IconButton(
                          onPressed: _openDatePicker,
                          icon: const Icon(Icons.calendar_month_outlined),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      if (val == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = val;
                      });
                    },
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: validPriceAndExpenseAndDate
                        ? () {
                          widget.addExpense(
                            Expense(
                              title: _titleController.text,
                              amount: double.tryParse(_priceController.text)!,
                              date: _selectedDate!,
                              category: _selectedCategory,
                            ),
                          );
                          Navigator.pop(context);
                        }
                        : null,
                    child: const Text('Save'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
