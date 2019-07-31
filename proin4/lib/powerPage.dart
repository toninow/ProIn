import 'package:flutter/material.dart';
import 'package:proin4/pages/usuario/listarUsuarios.dart';
import 'package:proin4/pages/usuario/registroUsuarios.dart';
import 'package:proin4/pages/reservaciones/listarReservacion.dart';

class SuperV extends StatelessWidget {
 
  SuperV({this.username});
  final String username;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text('Menu principal administrador'),),
      body: new Column(
        children: <Widget>[          
          Row(            
            //ROW 1
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: FlatButton(
                    onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) =>new Home()));
                  },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)),
                    color: Colors.orange,
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.people,
                          size: 57,
                        ),
                        Text("Usuarios"),
                      ],
                    ),
                  ),
                ),
              ),              
              Container(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: FlatButton(
                    onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) =>new AddData()));
                  },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)),
                    color: Colors.green[200],
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(
                          Icons.plus_one,
                          size: 57,
                        ),
                        Text("Registrar"),
                      ],
                    ),
                  ),
                ),
              ),                            
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
        ]
      ),
    );
  }
}