
import 'package:dio/dio.dart';
import 'package:my_contacts_app/constants/api_list.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/models/filter_contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/pageView/filter_contact_page_view.dart';

import 'dart:convert';

import 'package:my_contacts_app/my_contacts_app/filterContact/repo/filter_contact_repo_local.dart';

class FilterContactRepoRemote {
  Future<dynamic> fetchFilterContact({required FilterContactScreenProps? filterContactScreenProps}) async {
    var dio = Dio();

    try {
      final response = await dio.post(
        "${ApiList.baseUrl}${ApiList.filterContent}",
        data: {
          'group_id':filterContactScreenProps!.groupId,
          'dept_id':filterContactScreenProps.departmentId,
          'district':filterContactScreenProps.districtId
        }
      );

      if (response.statusCode == 200) {
        FilterContactRepoLocal().fetchFilterContactLocal(
          filterContactScreenProps: filterContactScreenProps,
          response: response.data.toString()
        );

        List<FilterContactModel> filterContacts = List<FilterContactModel>.from(
          json.decode(response.data.toString()).map(
            (model) => FilterContactModel.fromJson(model),
          ),
        );
        return filterContacts;
      }
    } on DioError catch (e){
      if(DioErrorType.other == e.type){
        if(e.message.contains('SocketException')){
          List<FilterContactModel> filterContacts = [];
          return filterContacts;
        }
      }
    }
  }
}
