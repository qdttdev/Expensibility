import 'package:flutter/material.dart';
import '/utilities/myPalette.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    // If title is empty or amount is negative, or date not selected
    // exit, don't addTx
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    // closes the top most screen displayed (when interaction is done)
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // Trigger: stateful widget updates and should run again
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(), // not used ever param
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(), // not used ever param
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    // Takes all space it can, push "Choose Date" to the end
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: Text('Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ))
                ],
              ),
            ),
            ElevatedButton(
              // Flat/RaisedButton is deprecated
              child: Text('Add Transaction'),
              // textColor: Theme.of(context).textTheme.button.color,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Palette.redShade)),
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
