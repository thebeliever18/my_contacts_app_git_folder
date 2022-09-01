import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/department/models/department_model.dart';
import 'package:my_contacts_app/my_contacts_app/districts/models/district_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/models/filter_contact_model.dart';

class FilterContactCard extends StatelessWidget {
  final FilterContactModel? filterContactModel; 
  const FilterContactCard({Key? key,this.filterContactModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(filterContactModel!.name!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}