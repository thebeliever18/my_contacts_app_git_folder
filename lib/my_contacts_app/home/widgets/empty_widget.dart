import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String? message;
  const EmptyWidget({
    Key? key,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(message!)
          ],
        ),
      ),
    ));
  }
}