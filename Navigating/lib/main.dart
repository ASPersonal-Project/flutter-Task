import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: 'Screen',
    home:new Home(),
  ));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:new AppBar(
        title:new Text('First Screeen'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: new ListView(
        children:<Widget>[
          new ListTile(
            title:new TextField(
              controller: _nameFieldController,
              decoration: new InputDecoration(
                labelText:'Enter Your Name'
              ),
            ),
          ),
          new ListTile(
            title:new RaisedButton(
            onPressed: () => debugPrint("hei") ,
            child:new Text("Send To Next Screen"))
          )
        ]
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.greenAccent,
        title: new Text('Second Screen'),
        centerTitle: true,
        )
    );
  }
}