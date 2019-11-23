import 'package:flutter/material.dart';


class Home extends StatelessWidget{ 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}



// import 'package:flutter/material.dart';

// class Home extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     void _onPress(){
//       print("Search");
//     }
    
//     return new Scaffold(
//       appBar: new AppBar(
//         backgroundColor: Colors.amberAccent,
//         title: new Text("Fency Day"),
//         actions: <Widget>[
//           new IconButton(
//             icon: new Icon(Icons.send),
//             onPressed: () => debugPrint("Icon Tapped"),
//           ),

//           new IconButton(
//             icon: new Icon(Icons.search),
//             onPressed: _onPress,
//           )
//         ],
//       ),

//       backgroundColor: Colors.grey.shade100,
//       body: new Container(
//           alignment: Alignment.center,
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Text("anajana",style:new TextStyle(fontSize: 14.5,
//             fontWeight:FontWeight.w400,
//             color: Colors.deepOrange ),),
//             new InkWell(
//               child: new Text("button"),
//               onTap: () => debugPrint("button Tapped"),
//             ),
//           ],
//         ),


//       ), 

//       floatingActionButton: new FloatingActionButton(
//         onPressed: null,
//         backgroundColor: Colors.lightGreen,
//         tooltip: 'Going Up!',
//         child: new Icon(Icons.call_missed),
//       ),
      
//       bottomNavigationBar: new BottomNavigationBar(items: [
//         new BottomNavigationBarItem(icon: new Icon(Icons.add),title: new Text("hey")),
//         new BottomNavigationBarItem(icon: new Icon(Icons.print),title: new Text("hey")),
//         new BottomNavigationBarItem(icon: new Icon(Icons.call_missed),title: new Text("call Missed"))
//       ], onTap: (int i) => debugPrint("hey touch $i"),), 
//     );
//   }

// }

 

// import 'package:flutter/material.dart';

// class Home extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return new Container(
//       color: Colors.greenAccent,
//       alignment: Alignment.center,

//       // child: new Column(
//       //   mainAxisAlignment:MainAxisAlignment.center,

//       //   children: <Widget>[
//       //     new Text("First ",textDirection: TextDirection.ltr, style:new TextStyle(color: Colors.white)),

//       //     new Text("second", textDirection: TextDirection.rtl, style: new TextStyle(color: Colors.blue),),

//       //     new Container(
//       //       color: Colors.redAccent,
//       //       alignment: Alignment.bottomLeft,

//       //       child: new Text("third", textDirection: TextDirection.ltr,style: new TextStyle(color: Colors.black),),
//       //     )
//       //   ],
//       // )
//     );
//   }

// }