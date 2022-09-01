import 'package:my_contacts_app/my_contacts_app/department/models/department_model.dart';
import 'package:my_contacts_app/my_contacts_app/department/repo/department_repo_local.dart';
import 'package:my_contacts_app/my_contacts_app/department/repo/department_repo_remote.dart';
import 'package:my_contacts_app/my_contacts_app/home/viewModels/base_view_model.dart';


class DepartmentViewModel extends BaseViewModel{
  
  List<DepartmentModel>? _departments = [];
  List<DepartmentModel>? get departments => _departments;

  void initialize(int? officeId) {
    fetchdepartments(officeId);
  }

  Future<List<DepartmentModel>?> fetchdepartments(int? officeId) async{
    toggleLoading();
    _departments = await DepartmentRepoRemote().fetchDepartments(officeId: officeId);
    if(_departments!.isEmpty){
      _departments = await DepartmentRepoLocal().getLastCachedData(officeId: officeId);
    }
    toggleLoading();
    return _departments;
  }
}
































