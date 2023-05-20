import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class bookParking extends StatefulWidget {
  const bookParking({super.key});

  @override
  State<bookParking> createState() => _bookParking();
}

class _bookParking extends State<bookParking> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedStartTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _selectedEndTime = const TimeOfDay(hour: 10, minute: 0);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedStartTime);
    if (picked != null && picked != _selectedStartTime) {
      setState(() {
        _selectedStartTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _selectedEndTime);
    if (picked != null && picked != _selectedEndTime) {
      setState(() {
        _selectedEndTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text('Book Parking Details'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select Date'),
          ),
          const SizedBox(height: 40),
          Text(
            'Selected Start Time: ${_selectedStartTime.format(context)}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectStartTime(context),
            child: const Text('Select Start Time'),
          ),
          const SizedBox(height: 40),
          Text(
            'Selected End Time: ${_selectedEndTime.format(context)}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _selectEndTime(context),
            child: const Text('Select End Time'),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
