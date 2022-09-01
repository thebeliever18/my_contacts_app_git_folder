import 'package:flutter/material.dart';
import 'package:my_contacts_app/helper/navigation_helper/navigation_helper.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/models/province_model.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/widgets/province_card.dart';
import 'package:my_contacts_app/routes/route_name.dart';

class ListOfProvinces extends StatelessWidget {
  final List<ProvinceModel>? provinces;
  const ListOfProvinces({Key? key, required this.provinces}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: provinces!.length,
      itemBuilder: (context, index) => InkWell(
          onTap: () => NavigationHelper().navigateTo(
                RouteName.districtScreen,
                arguments: provinces![index].stateId!,
              ),
          child: ProvinceCard(provinceModel: provinces![index])),
    ));
  }
}
