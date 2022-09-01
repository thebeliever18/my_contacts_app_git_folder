import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/home/screens/my_contacts_app.dart';
import 'package:my_contacts_app/my_contacts_app/home/viewModels/contact_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/empty_widget.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class ContactPageView extends StatelessWidget {
  const ContactPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactViewModel>(
      builder: (context, viewModel, child) {
        if(viewModel.loading){
          return const LoadingWidget();
        }else if(viewModel.contacts == null){
          return const EmptyWidget(message: 'No contacts found',);
        }
        return  MyContactsApp(contactViewModel: viewModel,);
        
      });
  }
}



