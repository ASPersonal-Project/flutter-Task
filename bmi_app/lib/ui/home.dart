import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home>{

  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightContorller = new TextEditingController();
  final TextEditingController _hightConroller = new TextEditingController();
  
  double result = 0.0;
  String BMIresult = "";
  String _resultReading = "";

  String _finalResult = "";



 

 void calculateBMI(){

   setState(() {
     int age = int.parse(_ageController.text);
     double weight = double.parse(_weightContorller.text);
     double height = double.parse(_hightConroller.text);
     double inces = height*12;

     if(_ageController.text.isNotEmpty && age>0 && _hightConroller.text.isNotEmpty && inces>0 && _weightContorller.text.isNotEmpty && weight>0){
          
          result= weight / (inces*inces) * 703;

          if(double.parse(result.toStringAsFixed(2))< 18.5){
            _resultReading = "UnderWeight";
          }else{
            _resultReading = "Great shape";
          }
         
     }else{
       result = 0.0;
     }
    
   });

   print(result);

   _finalResult = "${result.toStringAsFixed(2)}";
      
    }
   
     @override
     Widget build(BuildContext context) {
       return new Scaffold(
         appBar: AppBar(
           title: new Text("BMI "),
           centerTitle: true,
           backgroundColor: Colors.redAccent,
         ),
         body: new Container(
           alignment: Alignment.topCenter,
           
           child: new ListView(
             padding: const EdgeInsets.all(2.0),
             children: <Widget>[
               new Image.asset('images/bmilogo.png',
               height: 200.0,
               width: 133.0,),
   
               new Container(
                 margin: EdgeInsets.all(8.0),
                 color: Colors.grey,
                 height: 230,
                 width: 300,
                 child: Column(
                   children: <Widget>[
                     new TextField(
                       controller: _ageController,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         icon: Icon(Icons.person_outline),
                         labelText: 'Age',
                         hintText: 'Found on'
                       ),
                     ),
                     new TextField(
                       controller: _hightConroller ,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         icon: Icon(Icons.insert_chart),
                         labelText: 'Height',
                         hintText: 'Found on'
                       ),
                     ),
                     new TextField(
                       controller: _weightContorller,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         icon: Icon(Icons.line_weight),
                         labelText: 'weight',
                         hintText: 'Found on'
                       ),
                     ),

                     new RaisedButton(
                       onPressed: () => calculateBMI(),
                       color: Colors.pink,
                       child: new Text('Button'),
                       textColor: Colors.white,
                     )
                   ],
                 ),
               ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Text('BMI:$_finalResult',style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w300,
                      fontSize: 30.0
                    )),
                    new Text('Over Weight:$_resultReading',style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                    ),)
                  ],
                ),
              )
              
   
               
             ],
           ),
         ),
       );
     }
}