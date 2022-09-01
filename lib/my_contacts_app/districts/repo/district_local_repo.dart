import 'dart:convert';

import 'package:my_contacts_app/my_contacts_app/districts/models/district_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DistrictRepoLocal {
  List<DistrictModel>? districts;

  DistrictRepoLocal({this.districts});
  Future<dynamic> fetchDistrictsLocal(
    {required int stateId,
    required String response}
    
    ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('LOCAL_DISTRICTS_DATA $stateId', response);
  }

  Future<List<DistrictModel>?> getLastCachedData({required int stateId}) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('LOCAL_DISTRICTS_DATA $stateId');
    if (jsonString != null) {
      districts = List<DistrictModel>.from(
        json.decode(jsonString).map(
              (model) => DistrictModel.fromJson(model),
            ),
      );
    } else {
      print('cache exception');
    }
    return districts;
  }
}
