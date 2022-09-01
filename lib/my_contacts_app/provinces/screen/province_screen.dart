import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/widgets/list_of_province.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/my_contacts_app_search_feild.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/search_result_not_found.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/models/province_model.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/viewModel/province_view_model.dart';

class ProvinceScreen extends StatefulWidget {
  final ProvinceViewModel provinceViewModel;

  const ProvinceScreen({Key? key, required this.provinceViewModel})
      : super(key: key);
  @override
  State<ProvinceScreen> createState() => ProvinceScreenAppState();
}

class ProvinceScreenAppState extends State<ProvinceScreen> {
  TextEditingController? searchController;
  late List<ProvinceModel>? _provinces;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _provinces = widget.provinceViewModel.provinces;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            MyContactsAppSearchFeild(
              textEditingController: searchController,
              onChanged: _searchProvinces,
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
            _provinces!.isNotEmpty
                ? ListOfProvinces(
                    provinces: _provinces,
                  )
                : const SearchResultNotFound(),
          ],
        ));
  }

  void _clearSearchFeild() => setState(() {
        _provinces = widget.provinceViewModel.provinces;
        searchController!.clear();
      });

  void _searchProvinces(String value) {
    List<ProvinceModel>? provinces =
        widget.provinceViewModel.provinces!.where((province) {
      String name = province.name!.toLowerCase();
      String nameNp = province.nameNp!.toLowerCase();
   
      final searchItem = value.toLowerCase();

      return 
      nameNp.contains(searchItem) ||
          name.contains(searchItem);
          
    }).toList();

    setState(() {
      _provinces = provinces;
    });
  }
}
