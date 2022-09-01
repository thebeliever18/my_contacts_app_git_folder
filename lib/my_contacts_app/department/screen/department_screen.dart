import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/department/models/department_model.dart';
import 'package:my_contacts_app/my_contacts_app/department/viewModel/department_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/department/widgets/list_of_departments.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/my_contacts_app_search_feild.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/search_result_not_found.dart';

class DepartmentScreen extends StatefulWidget {
  final DepartmentViewModel departmentViewModel;

  const DepartmentScreen({Key? key, required this.departmentViewModel})
      : super(key: key);
  @override
  State<DepartmentScreen> createState() => DepartmentScreenAppState();
}

class DepartmentScreenAppState extends State<DepartmentScreen> {
  TextEditingController? searchController;
  late List<DepartmentModel>? _departments;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _departments = widget.departmentViewModel.departments;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Departments')),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyContactsAppSearchFeild(
                  textEditingController: searchController,
                  onChanged: _searchdepartments,
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
                _departments!.isNotEmpty
                    ? ListOfDepartments(
                        departments: _departments,
                      )
                    : const SearchResultNotFound(),
              ],
            )),
      ),
    );
  }

  void _clearSearchFeild() => setState(() {
        _departments = widget.departmentViewModel.departments;
        searchController!.clear();
      });

  void _searchdepartments(String value) {
    List<DepartmentModel>? departments =
        widget.departmentViewModel.departments!.where((department) {
      String name = department.name!.toLowerCase();
   
      final searchItem = value.toLowerCase();

      return name.contains(searchItem);
          
    }).toList();

    setState(() {
      _departments = departments;
    });
  }
}
