import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proin4/pages/usuario/listarUsuarios.dart';

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
  TextEditingController controllerNombre;
  TextEditingController controllerCedula;
  TextEditingController controllerDireccion;
  TextEditingController controllerTelefono;



  void editData() {
    var url="http://192.168.1.4/ticket_reservation/mobile/editdata.php";
    http.post(url,body: {
      "id_usuario": widget.list[widget.index]['id_usuario'],
      "cuenta_usuario": controllerCuenta.text,
      "password_usuario": controllerPassword.text,
      "nombre": controllerNombre.text,
      "cedula": controllerCedula.text,
      "direccion": controllerDireccion.text,
      "telefono": controllerTelefono.text,


    });
  }


  @override
    void initState() {
      controllerCuenta= new TextEditingController(text: widget.list[widget.index]['cuenta_usuario'] );
      controllerPassword= new TextEditingController(text: widget.list[widget.index]['password_usuario'] );
      controllerNombre= new TextEditingController(text: widget.list[widget.index]['nombre'] );
      controllerCedula= new TextEditingController(text: widget.list[widget.index]['cedula'] );
      controllerDireccion= new TextEditingController(text: widget.list[widget.index]['direccion'] );
      controllerTelefono= new TextEditingController(text: widget.list[widget.index]['telefono'] );
      

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
                      hintText: "Nombre cuenta", labelText: "Nombre de la cuenta"),
                ),
                new TextField(
                  controller: controllerNombre,
                  decoration: new InputDecoration(
                      hintText: "Nombre de usuario", labelText: "Nombre Usuario"),
                ),
                new TextField(
                  controller: controllerPassword,
                  decoration: new InputDecoration(
                      hintText: "Password ", labelText: "password"),
                ),
                new TextField(
                  controller: controllerCedula,
                  decoration: new InputDecoration(
                      hintText: "Cedula", labelText: "cedula"),
                ),
                new TextField(
                  controller: controllerDireccion,
                  decoration: new InputDecoration(
                      hintText: "Direcion ", labelText: "direccion"),
                ),
                new TextField(
                  controller: controllerTelefono,
                  decoration: new InputDecoration(
                      hintText: "Telefono", labelText: "Telefono"),
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