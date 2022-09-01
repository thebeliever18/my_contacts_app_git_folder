import 'package:my_contacts_app/my_contacts_app/home/viewModels/base_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/models/province_model.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/repo/province_repo_local.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/repo/province_repo_remote.dart';


class ProvinceViewModel extends BaseViewModel{
  

  List<ProvinceModel>? _provinces = [];
  List<ProvinceModel>? get provinces => _provinces;

  void initialize() {
    fetchProvince();
  }

  Future<List<ProvinceModel>?> fetchProvince() async{
    toggleLoading();
    _provinces = await ProvinceRepoRemote().fetchProvinces();
    if(_provinces!.isEmpty){
      _provinces = await ProvinceRepoLocal().getLastCachedData();
    }
    toggleLoading();
    return _provinces;
  }
}

































