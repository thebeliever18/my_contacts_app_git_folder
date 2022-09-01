import 'dart:convert';

import 'package:my_contacts_app/my_contacts_app/filterContact/models/filter_contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/pageView/filter_contact_page_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterContactRepoLocal {
  List<FilterContactModel>? filterContact;

  FilterContactRepoLocal({this.filterContact});
  Future<dynamic> fetchFilterContactLocal(
    {required FilterContactScreenProps? filterContactScreenProps,
    required String response}
    
    ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('LOCAL_FILTER_CONTACT_DATA ${filterContactScreenProps!.departmentId} ${filterContactScreenProps.districtId} ${filterContactScreenProps.groupId}', response);
  }

  Future<List<FilterContactModel>?> getLastCachedData({required FilterContactScreenProps? filterContactScreenProps}) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('LOCAL_FILTER_CONTACT_DATA ${filterContactScreenProps!.departmentId} ${filterContactScreenProps.districtId} ${filterContactScreenProps.groupId}');
    if (jsonString != null) {
      filterContact = List<FilterContactModel>.from(
        json.decode(jsonString).map(
              (model) => FilterContactModel.fromJson(model),
            ),
      );
    } else {
      print('cache exception');
    }
    return filterContact;
  }
}
