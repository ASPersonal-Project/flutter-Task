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
  String _welcomeString = "";

  void _erase(){
    setState(() {
      _userController.clear();
      _pswdController.clear();
    });
  }

  void _showWelcome(){
    setState(() {
      if(_userController.text.isNotEmpty && _pswdController.text.isNotEmpty){
        _welcomeString = _userController.text;
      }else{
        _welcomeString = "Nothing";
      }
    }); 

  }
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
                      icon: new Icon(Icons.lock)
                    ),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(15.5),),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left:38.0),
                         child:new RaisedButton(
                          onPressed: _showWelcome,
                          color: Colors.redAccent ,
                         child: new Text("Login", style: new TextStyle(color: Colors.white,fontSize: 16.9),),
                        )
                        ),

                         new Container(
                          margin: const EdgeInsets.only(left:78.0),
                         child:new RaisedButton(
                          onPressed: _erase,
                          color: Colors.redAccent ,
                         child: new Text("Clear", style: new TextStyle(color: Colors.white,fontSize: 16.9),),
                        ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(14.0),),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("welcome, $_welcomeString",style: TextStyle(color: Colors.white,fontSize: 19.4,fontWeight: FontWeight.w500),),
              ],
            )
          ],
        ),
      ),
    );
  }

} 