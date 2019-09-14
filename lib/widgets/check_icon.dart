import 'package:flutter/material.dart';

class CheckIcon extends StatelessWidget {
  final Color backgroundLightBlue = const Color.fromRGBO(231, 250, 248, 1);
  final double size;

  CheckIcon(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size+(size*0.4),
      width:size+(size*0.4),
      decoration: BoxDecoration(
        color: backgroundLightBlue,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Icon(
        Icons.check,
        color: Theme.of(context).accentColor,
        size: size,
      ),
    );
  }
}
