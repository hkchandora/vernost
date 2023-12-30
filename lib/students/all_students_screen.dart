import 'package:flutter/material.dart';
import 'package:vernost/students/all_student_bloc.dart';
import 'package:vernost/util/strings.dart';
import 'package:vernost/util/utility.dart';

class AllStudentsScreen extends StatefulWidget {
  const AllStudentsScreen({Key? key}) : super(key: key);

  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {

  AllStudentBloc allStudentBloc = AllStudentBloc();

  @override
  void initState() {
    allStudentBloc.getAllStudentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utility.commonAppBar(title: Strings.allStudents, isCenter: false),
      body: Text(""),
    );
  }
}
