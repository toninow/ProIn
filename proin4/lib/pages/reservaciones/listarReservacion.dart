import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './detailReservacion.dart';

import 'dart:async';
import 'dart:convert';


class Home1 extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home1> {
  Future<List> getData() async {
    final response = await http.get("http://172.16.11.192/ticket_reservation/mobile/reservacion/getDataReservacion.php");
    //final response = await http.get("http://192.168.1.4/ticket_reservation/mobile/reservacion/getDataReservacion.php");
    
    print('body: [${response.body}]');
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listado de Reservaciones"),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            list: list,
                            index: i,
                          )),
                ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  'Código Nº: ${list[i]['codigo_reservacion']}',
                  style: TextStyle(fontSize: 25.0, color: Colors.orangeAccent),
                ),
                
                leading: new Icon(
                  Icons.person_pin,
                  size: 77.0,
                  color: Colors.orangeAccent,
                ),
                subtitle: new Text(
                  "Fecha Reservación : ${list[i]['fecha_reservacion']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
