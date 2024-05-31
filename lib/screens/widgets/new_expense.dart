import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState(){
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _textEditingController,
            maxLength: 20,
            decoration: InputDecoration(
              label: Text('label')
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                print(_textEditingController.text);
              }, child: Text('Save'),),
            ],
          )
        ],
      ),  
    );
  }
}