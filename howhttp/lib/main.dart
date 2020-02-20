import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main() async{

  String _data = await getJson();

  print(_data);
  runApp(new MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title:new Text("JSON page"),
        centerTitle:true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: new Center(
        child:new Text("haii")
      ),
    )
  ));
}

Future<String> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body).toString() ;
}
 