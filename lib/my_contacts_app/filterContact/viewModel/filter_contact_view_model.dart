import 'package:my_contacts_app/my_contacts_app/filterContact/models/filter_contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/pageView/filter_contact_page_view.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/repo/filter_contact_repo_local.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/repo/filter_contact_repo_remote.dart';
import 'package:my_contacts_app/my_contacts_app/home/viewModels/base_view_model.dart';


class FilterContactViewModel extends BaseViewModel{
  
  List<FilterContactModel>? _filterContacts = [];
  List<FilterContactModel>? get filterContacts => _filterContacts;

  void initialize(FilterContactScreenProps? filterContactScreenProps) {
    fetchfilterContacts(filterContactScreenProps);
  }

  Future<List<FilterContactModel>?> fetchfilterContacts(FilterContactScreenProps? filterContactScreenProps) async{
    toggleLoading();
    _filterContacts = await FilterContactRepoRemote().fetchFilterContact(filterContactScreenProps: filterContactScreenProps);
    if(_filterContacts!.isEmpty){
      _filterContacts = await FilterContactRepoLocal().getLastCachedData(filterContactScreenProps: filterContactScreenProps);
    }
    toggleLoading();
    return _filterContacts;
  }
}
































