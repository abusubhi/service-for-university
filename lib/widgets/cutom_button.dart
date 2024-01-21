import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const CustomButton({required this.text, required this.onPress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 40,
        color: Theme.of(context).primaryColor,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)),
        onPressed: onPress,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
