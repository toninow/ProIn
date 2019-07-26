import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './bodegaPage.dart';
import './powerPage.dart';

void main() => runApp(new MyApp());

String username='';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login PHP My Admin',     
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/powerPage': (BuildContext context)=> new SuperV(username: username,),
        '/bodegaPage': (BuildContext context)=> new BodegaPage(username: username,),
        '/MyHomePage': (BuildContext context)=> new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

TextEditingController user=new TextEditingController();
TextEditingController pass=new TextEditingController();

String msg='';
 
Future<List> _login() async {
   //servidor movil
 // final response = await http.post("http://192.168.43.162/ticket_reservation/mobile/bdd/login.php", body: {
final response = await http.post("http://192.168.1.4/ticket_reservation/mobile/bdd/login.php", body: {
    "cuenta_usuario": user.text,
    "password_usuario": pass.text,
  });

  var datauser = json.decode(response.body);

  if(datauser.length==0){
    setState(() {
         AlertDialog(
          content: new Text("Usuario o password incorrectos"),
         );
        });
  }else{
    if(datauser[0]['id_tipo']=='1'){
       Navigator.pushReplacementNamed(context, '/powerPage');
    }else if(datauser[0]['id_tipo']=='2'){
      Navigator.pushReplacementNamed(context, '/bodegaPage');
    }
    setState(() {
          username= datauser[0]['cuenta_usuario'];
        });

  }

  return datauser;
}

  @override
  Widget build(BuildContext context) {
    Text("",style: TextStyle(fontSize: 18.0),);
     final logo = Hero(
    
      tag: 'hero',
      child: CircleAvatar(
        
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/bus2.png'),
      ),
    );
    return Scaffold(
  
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        child: Center(
          child: Column(
            children: <Widget>[
              logo,
            SizedBox(height: 48.0),
              TextField(   
                controller: user,                
                  decoration: InputDecoration(
                    hintText: 'Usuario',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),         
                ),
              Text("",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: pass,  
                obscureText: true,                
                 decoration: InputDecoration(
                  hintText: 'Contraseña',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                  ),           
                ),
              
              RaisedButton(
                child: Text("Inicia Sesión"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                onPressed: (){
                  _login();
                  Navigator.pop(context); 
                },
              ),

              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)
            
            ],
          ),
        ),
      ),
    );
}
}