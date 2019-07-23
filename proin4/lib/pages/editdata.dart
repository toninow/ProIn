import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proin4/pages/listarUsuarios.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerCuenta;
  TextEditingController controllerPassword;



  void editData() {
    var url="http://192.168.1.4/ticket_reservation/mobile/editdata.php";
    http.post(url,body: {
      "id_usuario": widget.list[widget.index]['id_usuario'],
      "cuenta_usuario": controllerCuenta.text,
      "password_usuario": controllerPassword.text,

    });
  }


  @override
    void initState() {
      controllerCuenta= new TextEditingController(text: widget.list[widget.index]['cuenta_usuario'] );
      controllerPassword= new TextEditingController(text: widget.list[widget.index]['password_usuario'] );
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Editar usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCuenta,
                  decoration: new InputDecoration(
                      hintText: "Nombre de la cuenta", labelText: "Nombre de la cuenta"),
                ),
                new TextField(
                  controller: controllerPassword,
                  decoration: new InputDecoration(
                      hintText: "Password de la cuenta", labelText: "Password de la cuenta"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("EDITAR DATOS"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context)=>new Home()
                      )
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
