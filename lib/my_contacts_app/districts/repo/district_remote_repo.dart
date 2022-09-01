
import 'package:dio/dio.dart';
import 'package:my_contacts_app/my_contacts_app/districts/models/district_model.dart';
import 'package:my_contacts_app/my_contacts_app/districts/repo/district_local_repo.dart';

import 'dart:convert';

class DistrictRepoRemote {
  Future<dynamic> fetchDistricts({required int stateId}) async {
    var dio = Dio();

    try {
      final response = await dio.get(
        "http://contact.itsolutionsnepal.com/api/district/$stateId",
      );

      if (response.statusCode == 200) {
        DistrictRepoLocal().fetchDistrictsLocal(
          stateId: stateId,
          response: response.data.toString()
        );

        List<DistrictModel> districts = List<DistrictModel>.from(
          json.decode(response.data.toString()).map(
            (model) => DistrictModel.fromJson(model),
          ),
        );
        return districts;
      }
    } on DioError catch (e){
      if(DioErrorType.other == e.type){
        if(e.message.contains('SocketException')){
          List<DistrictModel> districts = [];
          return districts;
        }
      }
    }
  }
}
