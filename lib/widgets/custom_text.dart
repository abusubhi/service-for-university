import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  // name constructor that has a positional parameters with the text required
  // and the other parameters optional
  const CustomText(
      {required this.text, this.size, this.color, this.weight, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        softWrap: true,
        style: TextStyle(
            fontSize: size ?? 18,
            color: color ?? Theme.of(context).primaryColor,
            fontWeight: weight ?? FontWeight.normal),
      ),
    );
  }
}
