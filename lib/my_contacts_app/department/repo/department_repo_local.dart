import 'dart:convert';

import 'package:my_contacts_app/my_contacts_app/department/models/department_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DepartmentRepoLocal {
  List<DepartmentModel>? departments;

  DepartmentRepoLocal({this.departments});
  Future<dynamic> fetchDepartmentsLocal(
    {required int? officeId,
    required String response}
    
    ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('LOCAL_DEPARTMENTS_DATA $officeId', response);
  }

  Future<List<DepartmentModel>?> getLastCachedData({required int? officeId}) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('LOCAL_DEPARTMENTS_DATA $officeId');
    if (jsonString != null) {
      departments = List<DepartmentModel>.from(
        json.decode(jsonString).map(
              (model) => DepartmentModel.fromJson(model),
            ),
      );
    } else {
      print('cache exception');
    }
    return departments;
  }
}
