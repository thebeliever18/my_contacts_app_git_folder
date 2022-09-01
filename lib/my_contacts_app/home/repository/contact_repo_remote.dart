
import 'package:dio/dio.dart';
import 'package:my_contacts_app/my_contacts_app/home/models/contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/repository/contact_repo_local.dart';
import 'dart:convert';

class ContactRepoRemote {
  Future<dynamic> fetchContacts() async {
    var dio = Dio();

    try {
      final response = await dio.get(
        "http://contact.itsolutionsnepal.com/api/contact",
      );

      if (response.statusCode == 200) {
        //contactFromJson(response.data.toString());
        ContactRepoLocal().fetchContactsLocal(
          response.data.toString()
        );

        List<ContactModel> contacts = List<ContactModel>.from(
          json.decode(response.data.toString()).map(
            (model) => ContactModel.fromJson(model),
          ),
        );
        return contacts;
      }
    } on DioError catch (e){
      if(DioErrorType.other == e.type){
        if(e.message.contains('SocketException')){
          List<ContactModel> contacts = [];
          return contacts;
        }
      }
    }
  }
}
