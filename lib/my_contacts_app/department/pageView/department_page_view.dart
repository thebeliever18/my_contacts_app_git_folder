import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/department/screen/department_screen.dart';
import 'package:my_contacts_app/my_contacts_app/department/viewModel/department_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/empty_widget.dart';
import 'package:my_contacts_app/my_contacts_app/home/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class DepartmentPageView extends StatefulWidget {
  final int officeId;
  const DepartmentPageView({Key? key,required this.officeId}) : super(key: key);

  @override
  State<DepartmentPageView> createState() => _DepartmentPageViewState();
}

class _DepartmentPageViewState extends State<DepartmentPageView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DepartmentViewModel>(context,listen:false).initialize(widget.officeId);
     });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<DepartmentViewModel>(
      builder: (context, viewModel, child) {
        if(viewModel.loading){
          viewModel.departments!.clear();
          return const LoadingWidget();
        }else if(viewModel.departments == null){
          return const EmptyWidget(message: 'No department found',);
        }else if(viewModel.departments!.isEmpty){
          return const EmptyWidget(message: 'No department found',);
        }
        return  DepartmentScreen(departmentViewModel: viewModel,);
        
      });
  }
}



