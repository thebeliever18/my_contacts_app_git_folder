import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/models/filter_contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/widgets/filter_contact_card.dart';
import 'package:my_contacts_app/my_contacts_app/home/models/contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/contacts_info_card.dart';

class ListOfFilterContacts extends StatelessWidget {
  final List<FilterContactModel>? filterContacts;
  const ListOfFilterContacts({Key? key, required this.filterContacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: filterContacts!.length,
      itemBuilder: (context, index) => InkWell(
          // onTap: () => 
          // NavigationHelper().navigateTo(
          //       RouteName.filterContentScreen,
          //       arguments: filterContacts![index].id!,
          //     ),
          child:ContactsInfoCard(contactModel: filterContacts![index]),
      )
    ));
  }
}
