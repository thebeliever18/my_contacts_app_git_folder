import 'package:my_contacts_app/my_contacts_app/home/models/contact_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/repository/contact_repo_local.dart';
import 'package:my_contacts_app/my_contacts_app/home/repository/contact_repo_remote.dart';
import 'package:my_contacts_app/my_contacts_app/home/viewModels/base_view_model.dart';


class ContactViewModel extends BaseViewModel{
  

  List<ContactModel>? _contacts = [];
  List<ContactModel>? get contacts => _contacts;

  void initialize() {
    fetchContacts();
  }

  Future<List<ContactModel>?> fetchContacts() async{
    toggleLoading();
    _contacts = await ContactRepoRemote().fetchContacts();
    if(_contacts!.isEmpty){
      _contacts = await ContactRepoLocal().getLastCachedData();
    }
    toggleLoading();
    return _contacts;
  }
}

































// final List<ContactModel> _contacts = const [
  //    ContactModel(
  //   position: 'Executive',
  //   name: 'Sabin Shrestha',
  //   officeName: 'Thakur International',
  //   mobileNumber: '9861604306',
  //   officeNumber: '015543524',
  //   emailAddress: 'sabvin@gmail.com'
  //   ),
  //   ContactModel(position: 'Manager',
  //   name: 'Spandan Bhandari',
  //   officeName: 'Brishman',
  //   mobileNumber: '9862604306',
  //   officeNumber: '0155435345',
  //   emailAddress: 'spanndanbhandari317@gmail.com'),
  //   ContactModel(position: 'Operations and production',
  //   name: 'Sujan Shrestha',
  //   officeName: 'Code logic',
  //   mobileNumber: '9862623306',
  //   officeNumber: '015544534',
  //   emailAddress: 'splistsvillan@gmail.com'),
  //   ContactModel(position: 'Chief executive officer (CEO)',
  //   name: 'Ereeda Maharjan',
  //   officeName: 'Brain ants technology',
  //   mobileNumber: '9862623311',
  //   officeNumber: '015544378',
  //   emailAddress: 'ereeda@gmail.com'),
  //   ContactModel(position: 'Chief operating officer (COO)',
  //   name: 'Alex Nakarami',
  //   officeName: 'Navakiran',
  //   mobileNumber: '9862623398',
  //   officeNumber: '014481378',
  //   emailAddress: 'sjfhaiu@gmail.com'),
  //   ContactModel(position: 'Chief financial officer or controller (CFO)',
  //   name: 'Mukesh Shah',
  //   officeName: 'Metro taxi',
  //   mobileNumber: '9811623398',
  //   officeNumber: '012281378',
  //   emailAddress: 'mshk@gmail.com'),
  //   ContactModel(position: 'Chief marketing officer (CMO)',
  //   name: 'Mukesh Ambani',
  //   officeName: 'ERCC',
  //   mobileNumber: '9814423398',
  //   officeNumber: '019281378',
  //   emailAddress: 'muhd@yahoo.com'),
  //   ContactModel(position: 'Chief technology officer (CTO)',
  //   name: 'Tirtha Ojha',
  //   officeName: 'All paisa',
  //   mobileNumber: '9814426532',
  //   officeNumber: '016751378',
  //   emailAddress: 'tiger@hotmail.com'),
  // ];