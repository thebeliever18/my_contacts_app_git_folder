import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/home/models/contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/contacts_info_card.dart';


class ListOfContacts extends StatelessWidget {
  final List<ContactModel>? contacts;
  const ListOfContacts({
    Key? key,
    required this.contacts
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: contacts!.length,
          itemBuilder: (context, index) => Column(
                children:  [
                  const SizedBox(
                    height: 18,
                  ),
                  ContactsInfoCard(contactModel: contacts![index]),
                  const Divider(thickness: 2,)

                ],
              )),
    );
  }
}