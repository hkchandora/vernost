import 'dart:async';

import 'package:vernost/network/response_bean/all_student_response_bean.dart';
import 'package:vernost/students/all_student_repository.dart';
import 'package:vernost/util/strings.dart';

class AllStudentBloc {

  final allStudentRepository = AllStudentRepository();

  final _listControllerAllStudent = StreamController<List<AllStudentResponseBean>>.broadcast();
  get listAllStudent => _listControllerAllStudent.stream;


  Future<List<AllStudentResponseBean>> getAllStudentList() async {
    List<AllStudentResponseBean> wrapper = await allStudentRepository.getAllStudentList();
    if (wrapper.isNotEmpty) {
      ///Sinking the data
      _listControllerAllStudent.sink.add(wrapper);
    } else {
      _listControllerAllStudent.sink.addError(Strings.somethingWentWrong);
    }
    return wrapper;
  }
}