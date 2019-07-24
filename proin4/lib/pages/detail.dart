import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import './listarUsuarios.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {

void deleteData(){
  var url="http://192.168.1.4/ticket_reservation/mobile/deleteData.php";
  http.post(url, body: {
    'id_usuario': widget.list[widget.index]['id_usuario']
  });
}


void confirm (){
  AlertDialog alertDialog = new AlertDialog(
    content: new Text("estas seguro que deseas eleminarlo? '${widget.list[widget.index]['cuenta_usuario']}'"),
    actions: <Widget>[
      new RaisedButton(
        child: new Text("OK ELIMINARLO !",style: new TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new Home(),
            )
          );
        },
      ),
      new RaisedButton(
        child: new Text("CANCELAR",style: new TextStyle(color: Colors.black)),
        color: Colors.green,
        onPressed: ()=> Navigator.pop(context),
      ),
    ],
  );

  showDialog(context: context, child: alertDialog);
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['cuenta_usuario']}")),
      body: new Container(
        height: 270.0, 
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['cuenta_usuario'], style: new TextStyle(fontSize: 20.0),),
                new Text("Tipo de usuario : ${widget.list[widget.index]['nombre_tipo_usuario']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Nombre : ${widget.list[widget.index]['nombre_usuario']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDITAR"),
                      color: Colors.green,
                      onPressed: ()=>Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context)=>new EditData(list: widget.list, index: widget.index,),
                        )
                      ),
                    ),
                    new RaisedButton(
                      child: new Text("ELIMINAR"),
                      color: Colors.red,
                      onPressed: ()=>confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}