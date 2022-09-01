import 'package:flutter/material.dart';
import 'package:my_contacts_app/helper/navigation_helper/navigation_helper.dart';
import 'package:my_contacts_app/my_contacts_app/department/viewModel/department_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/districts/pageView/district_page_view.dart';
import 'package:my_contacts_app/my_contacts_app/districts/viewModel/district_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/viewModel/filter_contact_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/home/pageView/contact_page_view.dart';
import 'package:my_contacts_app/my_contacts_app/home/viewModels/contact_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/office/viewModel/office_view_model.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/pageView/province_page_view.dart';
import 'package:my_contacts_app/my_contacts_app/provinces/viewModel/province_view_model.dart';
import 'package:my_contacts_app/routes/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactViewModel>(create:(context)=>ContactViewModel()),
        ChangeNotifierProvider<ProvinceViewModel>(create:(context)=>ProvinceViewModel()),
        ChangeNotifierProvider<DistrictViewModel>(create:(context)=> DistrictViewModel()),
        ChangeNotifierProvider<OfficeViewModel>(create:(context)=> OfficeViewModel()),
        ChangeNotifierProvider<DepartmentViewModel>(create:(context)=> DepartmentViewModel()),
        ChangeNotifierProvider<FilterContactViewModel>(create:(context)=> FilterContactViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey:navigatorKey,
        title: 'MY CONTACTS APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const InitialPage(),
      ),
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}


class _InitialPageState extends State<InitialPage>  {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context,listen:false).initialize();
     });

     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProvinceViewModel>(context,listen:false).initialize();
     });
  }

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    ContactPageView(),
    ProvincePageView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Contacts App'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Provinces',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
