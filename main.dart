import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendanceScreen extends StatelessWidget {
  final List<Student> students;

  const AttendanceScreen({
    super.key,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    final presentCount =
        students.where((student) => student.present).length;

    final absentCount = students.length - presentCount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    title: 'Total',
                    count: students.length,
                    color: Colors.blue,
                    icon: Icons.people,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _SummaryCard(
                    title: 'Present',
                    count: presentCount,
                    color: Colors.green,
                    icon: Icons.check_circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _SummaryCard(
                    title: 'Absent',
                    count: absentCount,
                    color: Colors.red,
                    icon: Icons.cancel,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];

                  return Card(
                    child: ListTile(
                      leading: Icon(
                        student.present
                            ? Icons.check_circle
                            : Icons.cancel,
                        color: student.present
                            ? Colors.green
                            : Colors.red,
                      ),
                      title: Text(student.name),
                      subtitle:
                          Text('Roll No: ${student.rollNumber}'),
                      trailing: Text(
                        student.present ? 'Present' : 'Absent',
                        style: TextStyle(
                          color: student.present
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  final IconData icon;

  const _SummaryCard({
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 6),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
