import 'package:flutter/material.dart';
import 'package:todo/classes/Task.dart';


class TaskPage extends StatelessWidget{

  TaskPage({required this.task, super.key});
  Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Enter task title',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              task.isImportant ? Icons.star : Icons.star_border,
              color: task.isImportant ? Colors.yellow : null,
            ),
            onPressed: () {
                task.isImportant = !task.isImportant;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Due Date:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text('Select Date'),
            ),
            SizedBox(height: 16),
            Text(
              'Selected Date: ${task.dueDate.toLocal()}'.split(' ')[0],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: task.dueDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2060),
    );

    if (picked != null && picked != task.dueDate)

        task.dueDate = picked;

  }

}