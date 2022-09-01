import 'package:my_contacts_app/my_contacts_app/districts/models/district_model.dart';
import 'package:my_contacts_app/my_contacts_app/districts/repo/district_local_repo.dart';
import 'package:my_contacts_app/my_contacts_app/districts/repo/district_remote_repo.dart';
import 'package:my_contacts_app/my_contacts_app/home/viewModels/base_view_model.dart';


class DistrictViewModel extends BaseViewModel{
  

  List<DistrictModel>? _districts = [];
  List<DistrictModel>? get districts => _districts;

  int? _distId;
  int? get distId => _distId;

  void initialize(int stateId) {
    fetchDistricts(stateId);
  }

  Future<List<DistrictModel>?> fetchDistricts(int stateId) async{
    toggleLoading();
    _districts = await DistrictRepoRemote().fetchDistricts(stateId: stateId);
    if(_districts!.isEmpty){
      _districts = await DistrictRepoLocal().getLastCachedData(stateId: stateId);
    }
    toggleLoading();
    return _districts;
  }

  void setDistrictId(int? distId){
    toggleLoading();
    _distId = distId;
    toggleLoading();
  }
}
































