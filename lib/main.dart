import 'package:flutter/material.dart';
import 'package:techlift_task3/students_list.dart';

void main() => runApp(const ListOfStudents());

class ListOfStudents extends StatelessWidget {
  const ListOfStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StudentList(),
      ),
    );
  }
}