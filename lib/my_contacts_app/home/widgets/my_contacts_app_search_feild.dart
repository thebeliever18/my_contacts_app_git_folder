import 'package:flutter/material.dart';


class MyContactsAppSearchFeild extends StatelessWidget {
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onChanged;
  final void Function()? onPressed;
  final Widget? icon;
  final String? hintText;
  const MyContactsAppSearchFeild(
      {Key? key,
      this.textEditingController,
      this.onChanged,
      this.onPressed,
      this.icon,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        onChanged: onChanged,
        decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: onPressed, icon: icon!),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            hintText: hintText));
  }
}
