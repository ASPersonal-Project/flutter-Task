import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async{

  List _data = await getJson();
  // String body;

  // print(_data[0]['name']);

  // for(int i = 0; i< _data.length; i++){
  //   print(_data[i]['name']);
  // }

  // body = _data[0]['name'];

  runApp(new MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title:new Text("JSON page"),
        centerTitle:true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Center(
        child:new ListView.builder(
          itemCount: _data.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context,int position){
            return new ListTile(
              title: new Text("${_data[position]['name']}",
              style: new TextStyle(fontSize:18.1),
              ),
              subtitle: new Text("${_data[position]["username"]}"),
              leading: new CircleAvatar(
                backgroundColor: Colors.red,
                child: new Text("${_data[position]["id"]}",
                style: new TextStyle(fontSize: 13.4,color: Colors.white)),
              ),
              onTap: () {showOnTapMessage(context,"${_data[position]['name']}");}
              
            );
          },
        )
      ),
    )
  )); 
}

void showOnTapMessage(BuildContext context,String message){
  var alert = new AlertDialog(
    title:new Text('App'),
    content: new Text("$message"),
    actions: <Widget>[
      new FlatButton(onPressed: (){Navigator.pop(context);} , child: new Text("OK"))
    ],
  );
  showDialog(context:context,child:alert);
}

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body) ;
}
 