import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {

  final enteredTitle = TextEditingController();
  final enteredAmount = TextEditingController();

  @override
  void dispose() {
    enteredTitle.dispose();
    enteredAmount.dispose();
    super.dispose();
  }


  void datePicker(){
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1,now.month , now.day);
    final lastDate = DateTime(now.year + 1,now.month , now.day);
    showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate,initialDate: now);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            maxLength: 50,
            controller: enteredTitle,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text("Amount"),prefixText: "\u20B9"),
                  controller: enteredAmount,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Selected Date"),
                    IconButton(onPressed: datePicker, icon: Icon(Icons.calendar_month)),
                  ],
                ),
              )
            ],
          ),

          Row(
            children: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Cancel")),
              ElevatedButton(
                onPressed: (){
                  print(enteredTitle.text);
                  print(enteredAmount.text);
                },
                child: const Text("Save Expense"),
              )
            ],
          ),


        ],
      ),
    );
  }
}
