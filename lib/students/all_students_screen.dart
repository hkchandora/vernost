import 'package:flutter/material.dart';
import 'package:vernost/network/response_bean/all_student_response_bean.dart';
import 'package:vernost/students/all_student_bloc.dart';
import 'package:vernost/util/strings.dart';
import 'package:vernost/util/utility.dart';
import 'package:vernost/util/widgets/ErrorMessageWidget.dart';
import 'package:vernost/util/widgets/LoadingWidget.dart';
import 'package:vernost/util/widgets/NoDataWidget.dart';

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
      body: listWidget(),
    );
  }


  listWidget(){
    return StreamBuilder(
      stream: allStudentBloc.listAllStudent,
      builder: (context, AsyncSnapshot<List<AllStudentResponseBean>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == null) {
            return const NoDataWidget();
          } else {
            return paymentLoanDetails(snapshot);
          }
        } else if (snapshot.hasError) {
          return ErrorMessageWidget(error: snapshot.error.toString());
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  paymentLoanDetails(snapshot){
    return Text(snapshot.toString());
  }
}
