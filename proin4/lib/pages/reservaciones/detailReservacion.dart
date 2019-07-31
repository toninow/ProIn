import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import './listarReservacion.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {

void deleteData(){
  var url="http://172.16.11.192/ticket_reservation/mobile/reservacion/deleteDataReservacion.php";
  //var url="http://172.16.11.192/ticket_reservation/mobile/preferencia/deleteReservacion.php";
  http.post(url, body: {
    'id_reservacion': widget.list[widget.index]['id_reservacion']
  });
}


void confirm (){
  AlertDialog alertDialog = new AlertDialog(
    content: new Text("estas seguro que deseas eleminarlo? '${widget.list[widget.index]['id_reservacion']}'"),
    actions: <Widget>[
      new RaisedButton(
        child: new Text("OK ELIMINARLO !",style: new TextStyle(color: Colors.black),),
        color: Colors.red,
        onPressed: (){
          deleteData();
          Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (BuildContext context)=> new Home1(),
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
      appBar: new AppBar(title: new Text("información de ${widget.list[widget.index]['codigo_reservacion']}")),
      body: new Container(
        height: 270.0, 
        padding: const EdgeInsets.all(5.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text(widget.list[widget.index]['codigo_reservacion'], style: new TextStyle(fontSize: 20.0),),
                new Text("Origen : ${widget.list[widget.index]['nombre_origen']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Destino : ${widget.list[widget.index]['nombre_destino']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Unidad : ${widget.list[widget.index]['bus']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Estado : ${widget.list[widget.index]['nombre_estado']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                // new Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: <Widget>[
                  
                //     new RaisedButton(
                //       child: new Text("ELIMINAR"),
                //       color: Colors.red,
                //       onPressed: ()=>confirm(),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}