import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/empty_widget.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/loading_widget.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/screen/province_screen.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/viewModel/province_view_model.dart';
import 'package:provider/provider.dart';

class ProvincePageView extends StatefulWidget {
  const ProvincePageView({Key? key}) : super(key: key);

  @override
  State<ProvincePageView> createState() => _ProvincePageViewState();
}

class _ProvincePageViewState extends State<ProvincePageView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvinceViewModel>(
      builder: (context, viewModel, child) {
        if(viewModel.loading){
          return const LoadingWidget();
        }else if(viewModel.provinces == null){
          return const EmptyWidget(message: 'No province found',);
        }
        return  ProvinceScreen(provinceViewModel: viewModel,);
        
      });
  }
}



