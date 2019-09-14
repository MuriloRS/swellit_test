import 'package:flutter/material.dart';
import 'package:projeto_swellit/widgets/check_icon.dart';

class SuccessOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color backgroundLightBlue = const Color.fromRGBO(231, 250, 248, 1);

    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CheckIcon(100),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Pedido Realizado com Sucesso!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 26)),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Seu pedido já está sendo processado. Aguarde o prazo de 7 dias.",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 13, color: const Color.fromRGBO(
                                              160, 155, 191, 1)),
                      )
                    ],
                  )))),
    );
  }
}
