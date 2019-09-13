import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final bool isFinishedOrder;
  OrderCard(this.isFinishedOrder);

  @override
  Widget build(BuildContext context) {
    Color backgroundLightBlue = const Color.fromRGBO(231, 250, 248, 1);
    Color textColor = const Color.fromRGBO(160, 155, 191, 1);
    return Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.person_add,
                color: Theme.of(context).accentColor,
                size: 32,
              ),
              Column(
                textDirection: TextDirection.ltr,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "DEPARTAMENTO",
                    style: TextStyle(color: textColor, fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Hoje às 15h",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Escolha o tipo de pedido",
                    style: TextStyle(color: textColor, fontSize: 12),
                  )
                ],
              ),
              isFinishedOrder
                  ? Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: backgroundLightBlue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).accentColor,
                        size: 24,
                      ),
                    )
                  : Container()
            ],
          ),
        ));
  }
}
