import 'package:vernost/network/response_bean/all_student_response_bean.dart';
import 'package:vernost/students/all_students_dio.dart';

class AllStudentRepository{
  final allStudentDio = AllStudentDio();

  Future<List<AllStudentResponseBean>> getAllStudentList() => allStudentDio.getAllStudentList();
}