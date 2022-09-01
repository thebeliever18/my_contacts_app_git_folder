import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/districts/models/district_model.dart';
import 'package:my_contacts_app/my_contacts_app/districts/viewModel/district_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/districts/widgets/list_of_district.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/my_contacts_app_search_feild.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/search_result_not_found.dart';

class DistrictScreen extends StatefulWidget {
  final DistrictViewModel districtViewModel;

  const DistrictScreen({Key? key, required this.districtViewModel})
      : super(key: key);
  @override
  State<DistrictScreen> createState() => DistrictScreenAppState();
}

class DistrictScreenAppState extends State<DistrictScreen> {
  TextEditingController? searchController;
  late List<DistrictModel>? _districts;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _districts = widget.districtViewModel.districts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Districts')),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyContactsAppSearchFeild(
                  textEditingController: searchController,
                  onChanged: _searchdistricts,
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
                _districts!.isNotEmpty
                    ? ListOfDistricts(
                        districts: _districts,
                      )
                    : const SearchResultNotFound(),
              ],
            )),
      ),
    );
  }

  void _clearSearchFeild() => setState(() {
        _districts = widget.districtViewModel.districts;
        searchController!.clear();
      });

  void _searchdistricts(String value) {
    List<DistrictModel>? districts =
        widget.districtViewModel.districts!.where((district) {
      String name = district.distName!.toLowerCase();
      String nameNp = district.distNameNep!.toLowerCase();
   
      final searchItem = value.toLowerCase();

      return 
      nameNp.contains(searchItem) ||
          name.contains(searchItem);
          
    }).toList();

    setState(() {
      _districts = districts;
    });
  }
}
