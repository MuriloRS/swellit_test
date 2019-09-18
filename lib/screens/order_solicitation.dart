import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:projeto_swellit/widgets/primary_button.dart';

class OrderSolicitation extends StatefulWidget {
  @override
  _OrderSolicitationState createState() => _OrderSolicitationState();
}

class _OrderSolicitationState extends State<OrderSolicitation> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
              color: Theme.of(context).accentColor,
              height: MediaQuery.of(context).size.height - 540,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Tipo: outros",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                      Text(
                        "Pedido #23123",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      )
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 42,
                    ),
                    color: Colors.white,
                    iconSize: 32,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          child: new Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              (_image == null)
                                  ? CircleAvatar(
                                      maxRadius: 100,
                                      backgroundColor:
                                          Color.fromRGBO(235, 235, 235, 1),
                                      child: FlatButton(
                                        child: Icon(Icons.photo_camera),
                                        color: Colors.transparent,
                                        onPressed: () {
                                          _newPhoto(context);
                                        },
                                      ),
                                    )
                                  : CircleAvatar(
                                      backgroundImage: FileImage(_image),
                                      maxRadius: 100,
                                    ),
                              new Align(
                                  alignment: Alignment.topRight,
                                  child: new Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(0),
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: new BoxDecoration(
                                      color: Theme.of(context).hintColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _image = null;
                                        });
                                      },
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ))
                            ],
                          ))),
                  SizedBox(height: 16),
                  Text(
                    "Dados Pessoais",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration:
                        _getDecoration('Murilo Haas', Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: _getDecoration(
                        'murilo_haas@outlook.com', Icon(Icons.email)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pedido",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _getDropDownListOrder(),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: _getDecoration(
                        '16 Set 2019 - Segunda', Icon(Icons.calendar_today)),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Progresso",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                  SizedBox(height: 16),
                  Container(
                      width: double.infinity,
                      child: LinearPercentIndicator(
                        backgroundColor: Color.fromRGBO(235, 235, 235, 1),
                        lineHeight: 24,
                        percent: 0.7,
                        progressColor: Theme.of(context).primaryColor,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  PrimaryButton(_finishOrder, 'Solicitar Pedido')
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 20,
          top: MediaQuery.of(context).size.height / 8,
          child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width - 40,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Enviado",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text("Completo",
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Entregue",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text("Em progresso",
                          style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600))
                    ],
                  )
                ],
              )),
        ),
      ])),
    ));
  }

  void _newPhoto(context) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  void _finishOrder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: EdgeInsets.all(15),
          titlePadding: EdgeInsets.all(15),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text("Departamento",
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).primaryColor)),
              IconButton(
                iconSize: 32,
                icon: Icon(
                  Icons.close,
                  size: 32,
                  color: Colors.grey[600],
                ),
                onPressed: _closeDialog,
              )
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Pedido #23153",
                  style: TextStyle(
                      fontSize: 26,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 25,
              ),
              Text("Departamento", style: TextStyle(color: Colors.grey[400])),
              SizedBox(
                height: 5,
              ),
              Text("Hoje às 15h",
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              SizedBox(
                height: 15,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin congue iaculis felis a viverra. Fusce metus tellus, sagittis sit amet condimentum ac, fringilla ut magna. Quisque urna dui, auctor at augue sit amet, vehicula ullamcorper metus. Vestibulum finibus quis risus sed pharetra. In viverra, felis vestibulum faucibus auctor, ex diam aliquet massa, quis venenatis dui mauris id justo. Nullam interdum sed eros nec mattis.",
                style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                child: PrimaryButton(_closeDialog, 'Alterar Pedido'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _closeDialog() {
    Navigator.pop(context);
  }

  Widget _getDropDownListOrder() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Color.fromRGBO(235, 235, 235, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: DropdownButton<String>(
          hint: Text(
            'Escolha o Pedido',
            style: TextStyle(
                color: Colors.grey[600], decoration: TextDecoration.none),
            textAlign: TextAlign.center,
          ),
          underline: Text(''),
          isExpanded: true,
          items: <String>['A', 'B', 'C', 'D'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ));
  }

  InputDecoration _getDecoration(String hintText, Icon icon) {
    return InputDecoration(
      prefixIcon: icon,
      helperStyle: TextStyle(color: Colors.black),
      filled: true,
      fillColor: Color.fromRGBO(235, 235, 235, 1),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[600]),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      focusedBorder: OutlineInputBorder(
        borderSide:
            new BorderSide(color: const Color.fromRGBO(235, 235, 235, 1)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide:
              new BorderSide(color: const Color.fromRGBO(235, 235, 235, 1)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
