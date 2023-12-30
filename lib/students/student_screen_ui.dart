import 'package:flutter/material.dart';

class StudentScreenUi extends StatefulWidget {
  const StudentScreenUi({Key? key}) : super(key: key);

  @override
  State<StudentScreenUi> createState() => _StudentScreenUiState();
}

class _StudentScreenUiState extends State<StudentScreenUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student List"),
      ),
      body: Text(""),
    );
  }
}
