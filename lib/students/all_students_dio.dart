import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vernost/network/response_bean/all_student_response_bean.dart';
import 'package:vernost/util/base_dio.dart';
import 'package:vernost/util/constants.dart';

class AllStudentDio extends BaseDio {

  ///Main API call
  Future<List<AllStudentResponseBean>> getAllStudentList() async {
    Dio dio = await getBaseDio();
    List<AllStudentResponseBean> listData = [];
    try {
      Response response = await dio.get(Constants.studentApi);
      if (response.statusCode == 200) {
        listData = (response.data as List)
            .map((data) => AllStudentResponseBean.fromJson(data))
            .toList();
      }
    } on Exception catch (e) {
      debugPrint("Exception caught => $e");
    }
    return listData;
  }

}