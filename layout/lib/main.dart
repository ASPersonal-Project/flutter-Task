import 'package:flutter/material.dart';
import './ui/home.dart';

void main(){
  var tit = "Gesture";
  runApp(
    new MaterialApp(  
      title: tit,
      home: new Home(title: tit,),
    )
  );
}


// import 'package:flutter/material.dart';
// import './ui/home.dart';

// void main(){
//   runApp(new MaterialApp(
//     title:"csacffold",
//     home: new Home(),
//   ));
// }

// import 'package:flutter/material.dart';
// import './ui/home.dart';

// void main(){
//   runApp(new MaterialApp(
//     title:"Layout",
//     home: new Home(),
//   ));
// }
