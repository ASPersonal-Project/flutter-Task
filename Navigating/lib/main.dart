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
            onPressed: () {
              var router = new MaterialPageRoute(
                builder: (BuildContext context) => new NextScreen(name:_nameFieldController.text));
                Navigator.of(context).push(router);
            },
            child:new Text("Send To Next Screen"))
          ),
        ]
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  final String name;

  NextScreen({this.name});
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var _backTextFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.greenAccent,
        title: new Text('Second Screen'),
        centerTitle: true,
        ),
        body: new Container(
          child:new Column(
            children: <Widget>[
              new ListTile(
                title: new Text('${widget.name}'),
              ),
              new ListTile(
                title: new TextField(
                controller: _backTextFieldController,
                ),
              ),
              new ListTile(
                title: new FlatButton(
                  onPressed: (){
                    Navigator.pop(context,{
                      'info': _backTextFieldController.text
                    });
                  },
                  child: new Text("send ")),
              ) 

            ],)
        ),
        // body:new ListTile(
        //   title: new Text('${widget.name}') 
        // )
    );
  }
}