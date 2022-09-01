import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/department/screen/department_screen.dart';
import 'package:my_contacts_app/my_contacts_app/department/viewModel/department_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/screen/filter_contact_screen.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/viewModel/filter_contact_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/empty_widget.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class FilterContactScreenProps {
  final int? groupId;
  final int? departmentId;
  final int? districtId;
  FilterContactScreenProps({
    this.groupId,
    this.departmentId,
    this.districtId
  });
}
class FilterContactPageView extends StatefulWidget {
  final FilterContactScreenProps filterContactScreenProps;
  const FilterContactPageView({Key? key,required this.filterContactScreenProps}) : super(key: key);

  @override
  State<FilterContactPageView> createState() => _FilterContactPageViewState();
}

class _FilterContactPageViewState extends State<FilterContactPageView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FilterContactViewModel>(context,listen:false).initialize(widget.filterContactScreenProps);
     });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterContactViewModel>(
      builder: (context, viewModel, child) {
        if(viewModel.loading){
          viewModel.filterContacts!.clear();
          return const LoadingWidget();
        }else if(viewModel.filterContacts == null){
          return const EmptyWidget(message: 'No contacts found',);
        }else if(viewModel.filterContacts!.isEmpty){
          return const EmptyWidget(message: 'No contacts found',);
        }
        return  FilterContactScreen(filterContactViewModel: viewModel,);
        
      });
  }
}



