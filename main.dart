import 'package:flutter/material.dart';
import '../models/student.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final nameController = TextEditingController();
  final rollController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    rollController.dispose();
    super.dispose();
  }

  void saveStudent() {
    final name = nameController.text.trim();
    final roll = rollController.text.trim();

    if (name.isEmpty || roll.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter student name and roll number'),
        ),
      );
      return;
    }

    final student = Student(
      id: DateTime.now().millisecondsSinceEpoch,
      name: name,
      rollNumber: roll,
    );

    Navigator.pop(context, student);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: rollController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Roll Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveStudent,
                child: const Text('Save Student'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
