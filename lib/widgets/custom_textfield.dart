import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final TextAlign? align;
  final TextInputType? type;
  final int? lines;
  final String? Function(String?)? valid;
  ValueChanged<String>? onChanged;

  CustomTextField(
      {this.hintText,
      this.controller,
      this.type,
      this.align,
      this.icon,
      this.lines,
      this.valid,
      this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          )),
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      margin: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 0.0),
      child: TextFormField(
        validator: valid ??
            (value) {
              if (value!.isEmpty) {
                return 'Please Enter Information';
              } else {
                return null;
              }
            },
        onChanged: onChanged,
        controller: controller,
        maxLines: lines ?? 1,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: type ?? TextInputType.text,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            fillColor: Theme.of(context).primaryColor,
            focusColor: Theme.of(context).primaryColor,
            hoverColor: Theme.of(context).primaryColor,
            hintText: hintText,
            icon: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            )),
      ),
    );
  }
}
