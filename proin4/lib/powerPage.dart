import 'package:flutter/material.dart';
import 'package:proyecto/pages/listarUsuarios.dart';

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
                padding: EdgeInsets.all(8.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) =>new Home()));
                  },
                  child: new Icon(
                    Icons.people,
                    color: Colors.blueAccent,
                    size: 63.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(7.0),
                child: new RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/LoginPage');
                  },
                  child: new Icon(
                    Icons.list,
                    color: Colors.grey[300],
                    size: 63.0,
                  ),
                  shape: new CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                ),
              ),

            ],
          ),
        ]
      ),
    );
  }
}