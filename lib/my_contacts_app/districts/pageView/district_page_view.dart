import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/districts/screen/district_screen.dart';
import 'package:my_contacts_app/my_contacts_app/districts/viewModel/district_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/empty_widget.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class DistrictPageView extends StatefulWidget {
  final int stateId;
  const DistrictPageView({Key? key,required this.stateId}) : super(key: key);

  @override
  State<DistrictPageView> createState() => _DistrictPageViewState();
}

class _DistrictPageViewState extends State<DistrictPageView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DistrictViewModel>(context,listen:false).initialize(widget.stateId);
     });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<DistrictViewModel>(
      builder: (context, viewModel, child) {
        if(viewModel.loading){
          viewModel.districts!.clear();
          return const LoadingWidget();
        }else if(viewModel.districts == null){
          return const EmptyWidget(message: 'No districts found',);
        }else if(viewModel.districts!.isEmpty){
          return const EmptyWidget(message: 'No districts found',);
        }
        return  DistrictScreen(districtViewModel: viewModel,);
        
      });
  }
}



