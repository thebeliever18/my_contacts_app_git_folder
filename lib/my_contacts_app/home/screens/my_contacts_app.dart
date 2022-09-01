import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/home/models/contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/viewModels/contact_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/list_of_contacts.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/my_contacts_app_search_feild.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/search_result_not_found.dart';

class MyContactsApp extends StatefulWidget {
  final ContactViewModel contactViewModel;

  const MyContactsApp({Key? key, required this.contactViewModel})
      : super(key: key);
  @override
  State<MyContactsApp> createState() => _MyContactsAppState();
}

class _MyContactsAppState extends State<MyContactsApp> {
  TextEditingController? searchController;
  late List<ContactModel>? _contacts;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _contacts = widget.contactViewModel.contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyContactsAppSearchFeild(
              textEditingController: searchController,
              onChanged: _searchContacts,
              icon: searchController!.text.isEmpty
                  ? const Icon(Icons.search)
                  : const Icon(Icons.close),
              onPressed: searchController!.text.isNotEmpty
                  ? _clearSearchFeild
                  : null,
              hintText: 'Search here',
            ),
            const SizedBox(
              height: 10,
            ),
            _contacts!.isNotEmpty
                ? ListOfContacts(
                    contacts: _contacts,
                  )
                : const SearchResultNotFound(),
          ],
        ));
  }

  void _clearSearchFeild() => setState(() {
        _contacts = widget.contactViewModel.contacts;
        searchController!.clear();
      });

  void _searchContacts(String value) {
    List<ContactModel>? contacts =
        widget.contactViewModel.contacts!.where((contact) {
      //String position = contact.position!.toLowerCase();
      String name = contact.name!.toLowerCase();
      String officeName = contact.company!.toLowerCase();
      String mobileNumber = contact.phone!.toLowerCase();
      String address = contact.address!.toLowerCase();
      String emailAddress = contact.email!.toLowerCase();

      final searchItem = value.toLowerCase();

      return 
          name.contains(searchItem) ||
          officeName.contains(searchItem) ||
          mobileNumber.contains(searchItem) ||
          address.contains(searchItem) ||
          emailAddress.contains(searchItem);
    }).toList();

    setState(() {
      _contacts = contacts;
      //searchController!.text = value;
    });
  }
}
