
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:my_contacts_app/my_contacts_app/provinces/models/province_model.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/repo/province_repo_local.dart';

class ProvinceRepoRemote {
  Future<dynamic> fetchProvinces() async {
    var dio = Dio();

    try {
      final response = await dio.get(
        "http://contact.itsolutionsnepal.com/api/province",
      );

      if (response.statusCode == 200) {
        ProvinceRepoLocal().fetchProvincesLocal(
          response.data.toString()
        );

        List<ProvinceModel> provinces = List<ProvinceModel>.from(
          json.decode(response.data.toString()).map(
            (model) => ProvinceModel.fromJson(model),
          ),
        );
        return provinces;
      }
    } on DioError catch (e){
      if(DioErrorType.other == e.type){
        if(e.message.contains('SocketException')){
          List<ProvinceModel> provinces = [];
          return provinces;
        }
      }
    }
  }
}
