import 'package:flutter/material.dart';
import 'package:my_contacts_app/helper/navigation_helper/navigation_helper.dart';
import 'package:my_contacts_app/my_contacts_app/department/models/department_model.dart';
import 'package:my_contacts_app/my_contacts_app/department/widgets/department_card.dart';
import 'package:my_contacts_app/my_contacts_app/districts/viewModel/district_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/pageView/filter_contact_page_view.dart';
import 'package:my_contacts_app/my_contacts_app/office/viewModel/office_view_model.dart';
import 'package:my_contacts_app/routes/route_name.dart';
import 'package:provider/provider.dart';

class ListOfDepartments extends StatelessWidget {
  final List<DepartmentModel>? departments;
  const ListOfDepartments({Key? key, required this.departments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: departments!.length,
      itemBuilder: (context, index) => InkWell(
          onTap: () => navigateToFilterContactScreen(index,context),
          child:DepartmentCard(departmentModel: departments![index]),
      )
    ));
  }

  void navigateToFilterContactScreen(int index,BuildContext context) {
    FilterContactScreenProps filterContactScreenProps = FilterContactScreenProps(
      groupId:  context.read<OfficeViewModel>().officeId,
      departmentId: departments![index].id!,
      districtId: context.read<DistrictViewModel>().distId,
    );

    NavigationHelper().navigateTo(
        RouteName.filterContactScreen,
        arguments: filterContactScreenProps,
      );
  }
}
