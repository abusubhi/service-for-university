import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText, initVal;
  final TextEditingController? controller;
  final IconData? icon;
  final TextAlign? align;
  // final TextInputType? type;
  // final int? lines;
  final String? Function(String?)? valid;
  // final String? pre;
  // final String? suff;
  final ValueChanged<String>? onChange;
  final TextDirection? dir;

  const CustomTextField(
      {super.key,
      this.hintText,
      this.initVal,
      this.controller,
      // this.type,
      this.align,
      this.icon,
      // this.lines,
      this.valid,
      // this.pre,
      // this.suff,
      this.onChange,
      this.dir});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          )),
      // padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.fromLTRB(4.0, 5.0, 4.0, 0.0),
      child: TextFormField(
        textAlign: TextAlign.left,
        initialValue: initVal,
        textDirection: dir,
        validator: valid ??
            (value) {
              if (value!.isEmpty) {
                return 'please enter information';
              } else {
                return null;
              }
            },
        onChanged: onChange,
        controller: controller,
        // maxLines: lines ?? 1,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            // prefixText: pre,
            // suffixText: suff,
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            hintText: hintText,
            icon: Icon(icon)),
      ),
    );
  }
}
