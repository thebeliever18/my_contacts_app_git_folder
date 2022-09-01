import 'package:flutter/material.dart';

class SearchResultNotFound extends StatelessWidget {
  const SearchResultNotFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:const[
        Icon(Icons.search_off,size: 100,),
        Text('No results found',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
      ]
    );
  }
}