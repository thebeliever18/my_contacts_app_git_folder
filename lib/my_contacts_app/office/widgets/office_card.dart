import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/office/models/office_model.dart';


class OfficeCard extends StatelessWidget {
  final OfficeModel? officeModel; 
  const OfficeCard({Key? key,this.officeModel}) : super(key: key);

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
                Text(officeModel!.groupename!),
                //Text(officeModel!.nameNp!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}