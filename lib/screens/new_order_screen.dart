import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_swellit/widgets/order_card.dart';
import 'package:projeto_swellit/widgets/primary_button.dart';
import 'package:projeto_swellit/widgets/type_order.dart';

class NewOrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<NewOrderScreen> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                top: 25, left: 15, right: 15, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Escolha o tipo de pedido",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: const Color.fromRGBO(
                                              160, 155, 191, 1)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Novo Pedido",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.chat_bubble,
                                  size: 25,
                                  color: const Color.fromRGBO(193, 195, 216, 1),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 450,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: DefaultTabController(
                              length: 2,
                              child: Scaffold(
                                appBar: PreferredSize(
                                    preferredSize: Size.fromHeight(80),
                                    child: Container(
                                        color: Colors.grey[200],
                                        child: ClipRRect(
                                            clipBehavior: Clip.antiAlias,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight:
                                                    Radius.circular(20.0)),
                                            child: AppBar(
                                              title: null,
                                              elevation: 0,
                                              titleSpacing: 0,
                                              backgroundColor: Colors.white,
                                              bottom: TabBar(
                                                indicatorColor:
                                                    Theme.of(context)
                                                        .accentColor,
                                                indicatorWeight: 3,
                                                unselectedLabelColor:
                                                    Colors.grey,
                                                labelColor: Theme.of(context)
                                                    .primaryColor,
                                                labelPadding:
                                                    EdgeInsets.all(25),
                                                tabs: <Widget>[
                                                  Text(
                                                    "Flex",
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Text("Seleção",
                                                      style: TextStyle(
                                                          fontSize: 16))
                                                ],
                                              ),
                                            )))),
                                body: Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.only(
                                        top: 35,
                                        left: 35,
                                        right: 35,
                                        bottom: 20),
                                    child: TabBarView(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            TypeOrder(),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TypeOrder(),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TypeOrder(),
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            TypeOrder(),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TypeOrder(),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TypeOrder(),
                                          ],
                                        ),
                                      ],
                                    )),
                              )),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Pedido Realizados",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        OrderCard(true),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Próximos pedidos",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        OrderCard(false),
                        PrimaryButton(_selectDate, 'Adicionar Pedido')
                      ],
                    )))));
  }

  

  void _selectDate() async {
   
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2020));

    if (picked != null) setState(() => _value = picked.toString());
  }
}
