import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/districts/models/district_model.dart';

class DistrictCard extends StatelessWidget {
  final DistrictModel? districtModel; 
  const DistrictCard({Key? key,this.districtModel}) : super(key: key);

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
                Text(districtModel!.distName!),
                Text(districtModel!.distNameNep!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}