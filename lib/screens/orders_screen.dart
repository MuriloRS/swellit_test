import 'package:flutter/material.dart';
import 'package:projeto_swellit/screens/new_order_screen.dart';
import 'package:projeto_swellit/screens/order_solicitation.dart';

class OrdersScreen extends StatelessWidget {
  final List<ListTile> list = List();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height - 525),
              child: Container(
                  color: Theme.of(context).accentColor,
                  padding:
                      EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Pedidos",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 14),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Lista de Pedidos",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white)),
                            ],
                          ),
                          IconButton(
                            iconSize: 32,
                            icon: Icon(
                              Icons.close,
                              size: 28,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      Expanded(
                        child: TabBar(
                          indicatorColor: Theme.of(context).accentColor,
                          unselectedLabelColor: Colors.grey[300],
                          labelColor: Colors.white,
                          labelPadding: EdgeInsets.only(top: 30),
                          tabs: <Widget>[
                            Text(
                              "Pedidos Abertos",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text("Pedidos Fechados",
                                style: TextStyle(fontSize: 15))
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            body: Container(
                color: Colors.white,
                child: TabBarView(
                  children: <Widget>[
                    ListView.separated(
                      separatorBuilder: (context, i) {
                        return Divider(
                          height: 1,
                          color: Colors.grey[300],
                        );
                      },
                      itemCount: 30,
                      itemBuilder: (context, i) {
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>NewOrderScreen()
                            ));
                          },
                          title: Text(
                            "Item list",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: Colors.grey[500],
                          ),
                        );
                      },
                    ),
                    ListView.separated(
                      separatorBuilder: (context, i) {
                        return Divider(
                          height: 1,
                          color: Colors.grey[300],
                        );
                      },
                      itemCount: 30,
                      itemBuilder: (context, i) {
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>OrderSolicitation()
                            ));
                          },
                          title: Text(
                            "Item list",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                          trailing: Icon(
                            Icons.chevron_right,
                            color: Colors.grey[500],
                          ),
                        );
                      },
                    ),
                  ],
                )),
          )),
    ));
  }
}
