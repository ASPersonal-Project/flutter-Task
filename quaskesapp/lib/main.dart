import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

 Map _data;
 List _features;

void main() async{

  _data = await getQuakes();
  _features = _data['features'];

 

  runApp(new MaterialApp(
    title: 'quesapp', 
    home: Quakes()
  ));
  
}

class Quakes extends StatelessWidget{
 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:new Text("Quakes"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,

      ),
      body: new Container(
        child: new ListView.builder(
          itemCount: _features.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (BuildContext context,int position){
            if(position.isOdd) return new Divider();
            final index = position ~/2;

            var format = new DateFormat("yMd").add_jm();

            var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['time']*1000,isUtc: true));
            
            return new ListTile(
              title:new Text("At: $date",
                style: new TextStyle(fontSize:19.5,color: Colors.orange,fontWeight:FontWeight.w500),),
              subtitle: new Text("${_features[index]['properties']['place']}",
                style: new TextStyle(fontSize:14.5,fontWeight:FontWeight.normal,color: Colors.grey,fontStyle: FontStyle.italic ),),
                onTap: () {_showAlertMessage(context,"${_features[index]['type']}");},
            );
           
            
          }),
      //   // child: new ListView.builder(itemBuilder: null),
      // ),  
    )
    );
  }

}

void _showAlertMessage(BuildContext context,String message){
  var alert = new AlertDialog(
    title:new Text("Queske"),
    content:new Text(message),
    actions: <Widget>[
      new FlatButton(onPressed:(){Navigator.pop(context);},
        child: new Text("OK"))
    ],
  );
  showDialog(context: context,child:alert);
}

Future<Map> getQuakes() async{
  String apiUrl = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';

  http.Response response = await http.get(apiUrl);

// parsing json object particular object
  return json.decode(response.body);
}