import 'package:flutter/material.dart';
import 'package:my_contacts_app/helper/navigation_helper/navigation_helper.dart';
import 'package:my_contacts_app/my_contacts_app/districts/models/district_model.dart';
import 'package:my_contacts_app/my_contacts_app/districts/viewModel/district_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/districts/widgets/district_card.dart';
import 'package:my_contacts_app/routes/route_name.dart';
import 'package:provider/provider.dart';

class ListOfDistricts extends StatelessWidget {
  final List<DistrictModel>? districts;
  const ListOfDistricts({Key? key, required this.districts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: districts!.length,
            itemBuilder: (context, index) => InkWell(
                  onTap: () => navigateToOfficeScreen(index,context),
                  child: DistrictCard(districtModel: districts![index]),
                )));
  }

  void navigateToOfficeScreen(int index,BuildContext context) {

    Provider.of<DistrictViewModel>(context,listen: false).setDistrictId(districts![index].distId);

    NavigationHelper().navigateTo(
      RouteName.officeScreen,
      arguments: districts![index].distId!,
    );
  }
}
