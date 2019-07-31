import 'package:flutter/material.dart';
import 'package:proin4/pages/reservaciones/listarReservacion.dart';

class BodegaPage extends StatelessWidget {

  BodegaPage({this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xFFD8D8D8),
        appBar: new AppBar(
            title: new Text("Panel Cajero"),
            backgroundColor: Colors.blueAccent),
        body: Column(children: <Widget>[
          Row(
            //ROW 1
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: FlatButton(
                    onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) =>new Home1()));
                  },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)),
                    color: Colors.yellow[200],
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.today,
                          size: 57,
                        ),
                        Text("Reservas"),
                      ],
                    ),
                  ),
                ),
              ),     
            ],
          ),
        ]));
  }
}
