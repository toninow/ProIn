import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proin4/bodegaPage.dart';
import 'package:proin4/powerPage.dart';

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
  final response = await http.post("http://192.168.1.4/ticket_reservation/mobile/login.php", body: {
    "cuenta_usuario": user.text,
    "password_usuario": pass.text,
  });

  var datauser = json.decode(response.body);

  if(datauser.length==0){
    setState(() {
          msg="Login Fail";
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
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(   
                controller: user,                
                decoration: InputDecoration(
                  hintText: 'Username'
                ),           
                ),
              Text("Password",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: pass,  
                obscureText: true,                
                 decoration: InputDecoration(
                  hintText: 'Password'
                ),                
                ),
              
              RaisedButton(
                child: Text("Login"),
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