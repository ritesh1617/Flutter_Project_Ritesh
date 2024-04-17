

import 'package:flutter/material.dart';

class DatePickerExample extends StatefulWidget {
  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime? _selectedDate; // Nullable DateTime

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _selectDate(context);
          },
          child: Text('Select Date'),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20.0),
        child: _selectedDate != null
            ? Text(
                'Selected Date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: TextStyle(fontSize: 18.0),
              )
            : Text(
                'No date selected',
                style: TextStyle(fontSize: 18.0),
              ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}