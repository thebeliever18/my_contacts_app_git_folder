import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/models/filter_contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/viewModel/filter_contact_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/widgets/list_of_filter_contact.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/my_contacts_app_search_feild.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/search_result_not_found.dart';

class FilterContactScreen extends StatefulWidget {
  final FilterContactViewModel filterContactViewModel;

  const FilterContactScreen({Key? key, required this.filterContactViewModel})
      : super(key: key);
  @override
  State<FilterContactScreen> createState() => FilterContactScreenAppState();
}

class FilterContactScreenAppState extends State<FilterContactScreen> {
  TextEditingController? searchController;
  late List<FilterContactModel>? _filterContacts;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _filterContacts = widget.filterContactViewModel.filterContacts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Filter Contacts')),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyContactsAppSearchFeild(
                  textEditingController: searchController,
                  onChanged: _searchfilterContacts,
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
                _filterContacts!.isNotEmpty
                    ? ListOfFilterContacts(
                        filterContacts: _filterContacts,
                      )
                    : const SearchResultNotFound(),
              ],
            )),
      ),
    );
  }

  void _clearSearchFeild() => setState(() {
        _filterContacts = widget.filterContactViewModel.filterContacts;
        searchController!.clear();
      });

  void _searchfilterContacts(String value) {
    List<FilterContactModel>? filterContacts =
        widget.filterContactViewModel.filterContacts!.where((filterContact) {
      String name = filterContact.name!.toLowerCase();
      String officeName = filterContact.company!.toLowerCase();
      String mobileNumber = filterContact.phone!.toLowerCase();
      String address = filterContact.address!.toLowerCase();
      String emailAddress = filterContact.email!.toLowerCase();

      final searchItem = value.toLowerCase();

      return 
          name.contains(searchItem) ||
          officeName.contains(searchItem) ||
          mobileNumber.contains(searchItem) ||
          address.contains(searchItem) ||
          emailAddress.contains(searchItem);

          
    }).toList();

    setState(() {
      _filterContacts = filterContacts;
    });
  }
}
