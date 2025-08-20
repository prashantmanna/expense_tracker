import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {

  var enteredTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 16,
            onChanged: _saveInput,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  print(enteredTitle);
                },
                child: const Text("Save Expense"),
              )
            ],
          )

        ],
      ),
    );
  }
}
