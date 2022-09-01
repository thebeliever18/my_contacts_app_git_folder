import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/list_of_contacts.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/my_contacts_app_search_feild.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/search_result_not_found.dart';
import 'package:my_contacts_app/my_contacts_app/office/models/office_model.dart';
import 'package:my_contacts_app/my_contacts_app/office/viewModel/office_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/office/widgets/list_of_offices.dart';

class OfficeScreen extends StatefulWidget {
  final OfficeViewModel officeViewModel;

  const OfficeScreen({Key? key, required this.officeViewModel})
      : super(key: key);
  @override
  State<OfficeScreen> createState() => _OfficeScreenState();
}

class _OfficeScreenState extends State<OfficeScreen> {
  TextEditingController? searchController;
  late List<OfficeModel>? _offices;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _offices = widget.officeViewModel.offices;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Office Lists')),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyContactsAppSearchFeild(
                  textEditingController: searchController,
                  onChanged: _searchOffices,
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
                _offices!.isNotEmpty
                    ? ListOfOffices(
                        offices: _offices,
                      )
                    : const SearchResultNotFound(),
              ],
            )),
      ),
    );
  }

  void _clearSearchFeild() => setState(() {
        _offices = widget.officeViewModel.offices;
        searchController!.clear();
      });

  void _searchOffices(String value) {
    List<OfficeModel>? offices =
        widget.officeViewModel.offices!.where((office) {
      String name = office.groupename!.toLowerCase();
      

      final searchItem = value.toLowerCase();

      return 
      //position.contains(searchItem) ||
          name.contains(searchItem);
    }).toList();

    setState(() {
      _offices = offices;
      //searchController!.text = value;
    });
  }
}
