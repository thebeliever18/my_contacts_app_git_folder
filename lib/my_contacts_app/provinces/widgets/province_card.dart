import 'package:flutter/material.dart';

import 'package:my_contacts_app/my_contacts_app/provinces/models/province_model.dart';

class ProvinceCard extends StatelessWidget {
  final ProvinceModel? provinceModel; 
  const ProvinceCard({Key? key,this.provinceModel}) : super(key: key);

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
                Text(provinceModel!.name!),
                Text(provinceModel!.nameNp!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}