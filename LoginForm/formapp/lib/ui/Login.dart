import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return LoginState();
  }

}

class LoginState extends State<Login>{

  final TextEditingController _userController = new TextEditingController();
  TextEditingController _pswdController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ), 

      backgroundColor: Colors.blueGrey,

      body: new Container(
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            new Image.asset('images/download.jpg',
            width:90.0,
            height:90.0,
            ),

            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'userName',
                      icon: new Icon(Icons.person)
                    ),
                  
                  ),
                  new TextField(
                    controller: _pswdController,
                    decoration: new InputDecoration(
                      hintText: 'password',
                      icon: new Icon(Icons.person)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

} 