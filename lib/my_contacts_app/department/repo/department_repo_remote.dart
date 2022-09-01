
import 'package:dio/dio.dart';
import 'package:my_contacts_app/constants/api_list.dart';
import 'package:my_contacts_app/my_contacts_app/department/models/department_model.dart';
import 'package:my_contacts_app/my_contacts_app/department/repo/department_repo_local.dart';

import 'dart:convert';

class DepartmentRepoRemote {
  Future<dynamic> fetchDepartments({required int? officeId}) async {
    var dio = Dio();

    try {
      final response = await dio.get(
        "${ApiList.baseUrl}${ApiList.department}$officeId",
      );

      if (response.statusCode == 200) {
        DepartmentRepoLocal().fetchDepartmentsLocal(
          officeId: officeId,
          response: response.data.toString()
        );

        List<DepartmentModel> departments = List<DepartmentModel>.from(
          json.decode(response.data.toString()).map(
            (model) => DepartmentModel.fromJson(model),
          ),
        );
        return departments;
      }
    } on DioError catch (e){
      if(DioErrorType.other == e.type){
        if(e.message.contains('SocketException')){
          List<DepartmentModel> departments = [];
          return departments;
        }
      }
    }
  }
}
