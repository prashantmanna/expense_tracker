import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final enteredTitle = TextEditingController();
  final enteredAmount = TextEditingController();

  Category selectedCategory = Category.food;
  DateTime? _selectedDate;

  @override
  void dispose() {
    enteredTitle.dispose();
    enteredAmount.dispose();
    super.dispose();
  }

  void datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void submitExpense() {
    final number = double.tryParse(enteredAmount.text);
    final invalidNumber = number == null || number <= 0; //try parse
    if (enteredTitle.text.trim().isEmpty ||
        invalidNumber ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Invalid Input"),
          content: Text(
            "Please make sure a valid title, amount, date and category was entered.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Okay"),
            ),
          ],
        ),
      );

      return;
    }

    widget.onAddExpense(
      Expense(
        title: enteredTitle.text,
        amount: number,
        date: _selectedDate!,
        category: selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx,constraints){
      final width = constraints.maxWidth;
      print(constraints.minHeight);
      print(constraints.maxWidth);
      print(constraints.maxHeight);
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(

          child: Padding(

            padding: EdgeInsets.fromLTRB(16,48,16,keyboardSpace + 16),
            child: Column(


              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                if(width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          maxLength: 50,
                          controller: enteredTitle,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: "Title",
                            labelStyle: TextStyle(color: Colors.black), // label color
                            counterStyle: TextStyle(color: Colors.black), // counter (8/50) color
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purpleAccent),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? "No Date Selected"
                                  : formatter.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: datePicker,
                              icon: Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),


                    ],)
                else
                TextField(
                  maxLength: 50,
                  controller: enteredTitle,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.black), // label color
                    counterStyle: TextStyle(color: Colors.black), // counter (8/50) color
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent),
                    ),
                  ),
                ),
                if(width >= 600)
                  Row(
                    children: [
                      DropdownButton<Category>(
                        value: selectedCategory,
                        items: Category.values

                            .map(
                              (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item.name.toUpperCase(),style: TextStyle(
                                color: Colors.black
                            ),),

                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? "No Date Selected"
                                  : formatter.format(_selectedDate!),
                            ),
                            IconButton(
                              onPressed: datePicker,
                              icon: Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Amount",style: TextStyle(color: Colors.black),),
                          prefixText: "\u20B9",
                        ),
                        controller: enteredAmount,
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            _selectedDate == null
                                ? "No Date Selected"
                                : formatter.format(_selectedDate!),
                          ),
                          IconButton(
                            onPressed: datePicker,
                            icon: Icon(Icons.calendar_month),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if(width >= 600)
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: submitExpense,
                        child: const Text("Save Expense"),
                      ),
                    ],
                  )
                else
                Row(
                  children: [
                    DropdownButton<Category>(
                      value: selectedCategory,
                      items: Category.values

                          .map(
                            (item) => DropdownMenuItem(
                          value: item,
                          child: Text(item.name.toUpperCase(),style: TextStyle(
                              color: Colors.black
                          ),),

                        ),
                      )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: submitExpense,
                      child: const Text("Save Expense"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });

  }
}
