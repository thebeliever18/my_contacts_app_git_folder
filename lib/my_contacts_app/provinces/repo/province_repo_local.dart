import 'dart:convert';

import 'package:my_contacts_app/my_contacts_app/provinces/models/province_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProvinceRepoLocal {
  List<ProvinceModel>? provinces;

  ProvinceRepoLocal({this.provinces});

  Future<dynamic> fetchProvincesLocal(String response) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('LOCAL_PROVINCES_DATA', response);
  }

  Future<List<ProvinceModel>?> getLastCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('LOCAL_PROVINCES_DATA');
    if (jsonString != null) {
      provinces = List<ProvinceModel>.from(
        json.decode(jsonString).map(
              (model) => ProvinceModel.fromJson(model),
            ),
      );
    } else {
      print('cache exception');
    }
    return provinces;
  }
}
