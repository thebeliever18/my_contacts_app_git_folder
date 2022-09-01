import 'dart:convert';

import 'package:my_contacts_app/my_contacts_app/office/models/office_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfficeRepoLocal {
  List<OfficeModel>? offices;

  OfficeRepoLocal({this.offices});
  Future<dynamic> fetchOfficesLocal({required String response,required int? districtId}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('LOCAL_OFFICES_DATA $districtId', response);
  }

  Future<List<OfficeModel>?> getLastCachedData({required int? districtId}) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('LOCAL_OFFICES_DATA $districtId');
    if (jsonString != null) {
      offices = List<OfficeModel>.from(
        json.decode(jsonString).map(
              (model) => OfficeModel.fromJson(model),
            ),
      );
    } else {
      print('cache exception');
    }
    return offices;
  }
}
