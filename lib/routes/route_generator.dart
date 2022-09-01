import 'package:flutter/material.dart';
import 'package:my_contacts_app/my_contacts_app/department/pageView/department_page_view.dart';
import 'package:my_contacts_app/my_contacts_app/districts/pageView/district_page_view.dart';
import 'package:my_contacts_app/my_contacts_app/filterContact/pageView/filter_contact_page_view.dart';
import 'package:my_contacts_app/my_contacts_app/office/pageView/office_page_view.dart';
import 'package:my_contacts_app/routes/route_name.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      //a
      //b
      //c
      //d
        case RouteName.districtScreen:
        {
          int stateId = settings.arguments as int;
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => DistrictPageView( stateId : stateId)
          );
        }

        case RouteName.departmentScreen:
        {
          int officeId = settings.arguments as int;
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => DepartmentPageView( officeId : officeId)
          );
        }
      //e

      //f
      case RouteName.filterContactScreen:
        {
          FilterContactScreenProps filterContactScreenProps = settings.arguments as FilterContactScreenProps;
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => FilterContactPageView(filterContactScreenProps:filterContactScreenProps)
          );
        }

      //o
      case RouteName.officeScreen:
        {
          int districtId = settings.arguments as int;
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => OfficePageView(districtId:districtId)
          );
        }
      default:
        return MaterialPageRoute(
          builder: (_) => const SafeArea(
            child: Scaffold(
              body: Center(child: Text('No routes found')),
            ),
          )
        
        );
    }
  }
}