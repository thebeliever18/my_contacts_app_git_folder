import 'package:flutter/material.dart';
import 'package:my_contacts_app/helper/navigation_helper/navigation_helper.dart';
import 'package:my_contacts_app/my_contacts_app/office/models/office_model.dart';
import 'package:my_contacts_app/my_contacts_app/office/viewModel/office_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/office/widgets/office_card.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/models/province_model.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/widgets/province_card.dart';
import 'package:my_contacts_app/routes/route_name.dart';
import 'package:provider/provider.dart';

class ListOfOffices extends StatelessWidget {
  final List<OfficeModel>? offices;
  const ListOfOffices({Key? key, required this.offices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: offices!.length,
      itemBuilder: (context, index) => InkWell(
          onTap: () => nagivateToDepartmentScreen(index, context),
          child: OfficeCard(officeModel: offices![index])),
    ));
  }

  void nagivateToDepartmentScreen(int index, BuildContext context) {

    Provider.of<OfficeViewModel>(context,listen: false).setOfficeId(offices![index].id);

    NavigationHelper()
        .navigateTo(RouteName.departmentScreen, arguments: offices![index].id);
  }
}
