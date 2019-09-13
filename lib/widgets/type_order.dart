import 'package:flutter/material.dart';

class TypeOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color textColor = const Color.fromRGBO(160, 155, 191, 1);

    return Row(
      children: <Widget>[
        Container(
          height: 6,
          width: 6,
          child: null,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        SizedBox(
          width: 7,
        ),
        Text(
          "Escolha o tipo de pedido",
          style: TextStyle(color: textColor, fontSize: 12),
        )
      ],
    );
  }
}
