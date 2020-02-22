import 'package:flutter/material.dart';
import '../util/utils.dart' as util;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Kalimatic  extends StatefulWidget {
  @override
  KalimaticState createState() => KalimaticState();
}

class KalimaticState extends State<Kalimatic> {

  void showStuff() async {
    Map data = await getWeather(util.appId, util.defaultCity);
    print(data.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:new Text("Kalimatic",style: TextStyle(color: Colors.black, fontSize:40),),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.menu), onPressed: showStuff)
          
        ],
        ),

        body: new Stack(
          children: <Widget>[
            new Center(
              child:new Image.asset('images/umbrella.png',height:900.0,width: 500.0,fit: BoxFit.fill,)
            ),

            new Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsetsDirectional.fromSTEB(0.0, 10.9, 20.9, 0.0),
              child:new Text('Spokanc',style: cityStyle() ,),
            ),

            new Container(
              alignment: Alignment.center,
              child:new Image.asset('images/light_rain.png')
            ),

            new Container(
              margin: const EdgeInsetsDirectional.fromSTEB(30.8, 450.0,0.0, 0.0),
              child: updateTempWidget('rio')
            )
          ]
        ),
    );
  }

  Future<Map> getWeather(String appId,String city) async{
    String apiUrl = 'https://samples.openweathermap.org/data/2.5/weather?q=$city,uk&appid=${util.appId}';

    http.Response  response= await http.get(apiUrl); 

    return json.decode(response.body);
  }

  Widget updateTempWidget(String city){
    
    return new FutureBuilder(
      future:getWeather(util.appId,city),
      builder: (BuildContext context,AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map content = snapshot.data;
          return new Container(
            child:new Column(
              children: <Widget>[
                new ListTile(
                  title:new Text(content['main']['temp'].toString(),
                  style: new TextStyle(fontSize:40.0,fontWeight:FontWeight.w500,color: Colors.white),),
                )
              ],
              )
          );
        }else{
          return new Container();
        }

    });
  }
}

TextStyle cityStyle(){
  return new TextStyle(
    color:Colors.white,
    fontSize:22.9,
    fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize:50.0,
    fontStyle:FontStyle.italic,
    fontWeight: FontWeight.w500,
  );
}