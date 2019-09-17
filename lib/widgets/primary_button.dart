import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String text;
  final VoidCallback _selectDate;

  PrimaryButton(this._selectDate, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoButton(
        borderRadius: new BorderRadius.circular(10.0),
        padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
        color: Theme.of(context).hintColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
            ),
            Icon(
              Icons.chevron_right,
              size: 35,
            )
          ],
        ),
        onPressed: _selectDate,
      ),
    );
  }
}
