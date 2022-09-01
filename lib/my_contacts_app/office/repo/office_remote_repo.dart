
import 'package:dio/dio.dart';
import 'package:my_contacts_app/my_contacts_app/office/models/office_model.dart';
import 'dart:convert';

import 'package:my_contacts_app/my_contacts_app/office/repo/office_local_repo.dart';

class OfficeRepoRemote {
  Future<dynamic> fetchOffices(int? districtId) async {
    var dio = Dio();

    try {
      final response = await dio.get(
        "http://contact.itsolutionsnepal.com/api/office/$districtId",
      );

      if (response.statusCode == 200) {
        OfficeRepoLocal().fetchOfficesLocal(
          response:response.data.toString(),
          districtId: districtId
        );

        List<OfficeModel> offices = List<OfficeModel>.from(
          json.decode(response.data.toString()).map(
            (model) => OfficeModel.fromJson(model),
          ),
        );
        return offices;
      }
    } on DioError catch (e){
      if(DioErrorType.other == e.type){
        if(e.message.contains('SocketException')){
          List<OfficeModel> offices = [];
          return offices;
        }
      }
    }
  }
}
