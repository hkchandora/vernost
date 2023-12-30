import 'package:dio/dio.dart';
import 'package:vernost/network/response_bean/all_student_response_bean.dart';
import 'package:vernost/util/base_dio.dart';
import 'package:vernost/util/constants.dart';
import 'package:vernost/util/strings.dart';

class AllStudentDio extends BaseDio {

  Future<List<AllStudentResponseBean>> getAllStudentList() async {
    Dio dio = await getBaseDio();
    AllStudentResponseBean wrapper = AllStudentResponseBean();
    List<AllStudentResponseBean> listData = [];
    try {
      Response response = await dio.get(Constants.studentApi);
      if (response.statusCode == 200) {
        // wrapper = AllStudentResponseBean.fromJson(response.data);

        listData = (response.data as List)
            .map((data) => AllStudentResponseBean.fromJson(data))
            .toList();

        wrapper.isSuccessFull = true;
      }
      else {
        wrapper.isSuccessFull = false;
      }
    } on DioError catch (e) {
      if (e.response == null) {
        wrapper.isSuccessFull = false;
        wrapper.errorMessage = Strings.serverErrorMessage;
        wrapper.errorCode = Constants.noInternet;
      } else {
        if(e.response!.statusCode == 500) {
          wrapper.isSuccessFull = false;
          wrapper.errorCode = e.response!.statusCode!;
          wrapper.errorMessage = Strings.internalServerError;
        } else {
          wrapper.isSuccessFull = false;
          wrapper.errorCode = e.response!.statusCode!;
          wrapper.errorMessage = Strings.somethingWentWrong;
        }
      }
    }
    return listData;
  }

}