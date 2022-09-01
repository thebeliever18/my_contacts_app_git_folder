import 'dart:convert';

import 'package:my_contacts_app/my_contacts_app/home/models/contact_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactRepoLocal {
  List<ContactModel>? contacts;

  ContactRepoLocal({this.contacts});
  Future<dynamic> fetchContactsLocal(String response) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('LOCAL_CONTACTS_DATA', response);
  }

  Future<List<ContactModel>?> getLastCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('LOCAL_CONTACTS_DATA');
    if (jsonString != null) {
      contacts = List<ContactModel>.from(
        json.decode(jsonString).map(
              (model) => ContactModel.fromJson(model),
            ),
      );
    } else {
      print('cache exception');
    }
    return contacts;
  }
}
