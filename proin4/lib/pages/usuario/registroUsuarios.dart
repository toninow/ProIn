import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../powerPage.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerNombre = new TextEditingController();
  TextEditingController controllerCedula = new TextEditingController();
  TextEditingController controllerDireccion = new TextEditingController();
  TextEditingController controllerTelefono = new TextEditingController();
  TextEditingController controllerTipo = new TextEditingController();
  //TextEditingController controllerNivel = new TextEditingController();

  var _formKey = GlobalKey<FormState>();
 
  void addData() {
    
    //var url = "http://192.168.43.162/ticket_reservation/mobile/usuario/adddata.php";
  var url = "http://192.168.1.4/ticket_reservation/mobile/usuario/adddata.php";     
    http.post(url, body: {
      "cuenta_usuario": controllerUsername.text,
      "password_usuario": controllerPassword.text,
      "nombre": controllerNombre.text,
      "cedula": controllerCedula.text,
      "telefono": controllerTelefono.text,
      "direccion": controllerDireccion.text,
      "id_tipo": controllerTipo.text //aqui traemos el DropdownMenuItem lo llamamos _mySelection este es como el controller
      //"nivel": controllerNivel.text
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Registro de Usuarios"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerUsername,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa un nombre de usurio";
                          },
                      decoration: new InputDecoration(
                        hintText: "Usurio", labelText: "Usuario",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPassword,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa una Contraseña";
                          } ,
                      decoration: new InputDecoration(
                        hintText: "Contraseña", labelText: "Contraseña",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerNombre,
                      decoration: new InputDecoration(
                        hintText: "Nombre", labelText: "Nombre",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCedula,
                      decoration: new InputDecoration(
                        hintText: "Cedula", labelText: "Cedula",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerDireccion,
                      decoration: new InputDecoration(
                        hintText: "Direccion", labelText: "Direccion",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerTelefono,
                      decoration: new InputDecoration(
                        hintText: "Telefono", labelText: "Telefono",
                      ),
                    ),
                  ),

                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerTipo,
                      decoration: new InputDecoration(
                        hintText: "Escriba el numero ", labelText: "tipo 1 administrador 2 cajero ",
                      ),
                    ),
                  ),
                  new Padding(
                   padding: const EdgeInsets.all(30.0),
                 ),              
                  new RaisedButton(
                    child: new Text("Agregar Usuario"),
                    color: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        addData();
                        Navigator.pop(context);
                      }
                    },
                  ),
                  new RaisedButton(
                    child: new Text("Salir"),
                    color: Colors.blueAccent,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) =>new SuperV()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
