import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/empty_widget.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/loading_widget.dart';
import 'package:my_contacts_app/my_contacts_app/office/screen/office_screen.dart';
import 'package:my_contacts_app/my_contacts_app/office/viewModel/office_view_model.dart';
import 'package:provider/provider.dart';

class OfficePageView extends StatefulWidget {
  final int? districtId;
  const OfficePageView({Key? key,this.districtId}) : super(key: key);

  @override
  State<OfficePageView> createState() => _OfficePageViewState();
}

class _OfficePageViewState extends State<OfficePageView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OfficeViewModel>(context,listen:false).initialize(widget.districtId);
     });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<OfficeViewModel>(
      builder: (context, viewModel, child) {
        if(viewModel.loading){
          return const LoadingWidget();
        }else if(viewModel.offices == null){
          return const EmptyWidget(message: 'No offices found',);
        }
        return  OfficeScreen(officeViewModel: viewModel,);
        
      });
  }
}



