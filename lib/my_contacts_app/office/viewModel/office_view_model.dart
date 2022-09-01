import 'package:my_contacts_app/my_contacts_app/home/viewModels/base_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/office/models/office_model.dart';
import 'package:my_contacts_app/my_contacts_app/office/repo/office_local_repo.dart';
import 'package:my_contacts_app/my_contacts_app/office/repo/office_remote_repo.dart';


class OfficeViewModel extends BaseViewModel{
  
  List<OfficeModel>? _offices = [];
  List<OfficeModel>? get offices => _offices;

  int? _officeId;
  int? get officeId=>_officeId;

  void initialize(int? districtId) {
    fetchOffices(districtId);
  }

  Future<List<OfficeModel>?> fetchOffices(int? districtId) async{
    toggleLoading();
    _offices = await OfficeRepoRemote().fetchOffices(districtId);
    if(_offices!.isEmpty){
      _offices = await OfficeRepoLocal().getLastCachedData(districtId:districtId);
    }
    toggleLoading();
    return _offices;
  }

  void setOfficeId(int? officeId){
    toggleLoading();
    _officeId = officeId;
    toggleLoading();
  }
}
































