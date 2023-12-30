import 'package:vernost/network/response_bean/all_student_response_bean.dart';
import 'package:vernost/students/all_student_repository.dart';

class AllStudentBloc {
  AllStudentBloc();
  final allStudentRepository = AllStudentRepository();

  Future<AllStudentResponseBean> getAllStudentList() async{
    AllStudentResponseBean wrapper = await allStudentRepository.getAllStudentList();
    return wrapper;
  }
}