import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _fomatedText = "";

  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;
     switch(radioValue) {
      case 0: 
        _finalResult = calculateWeight(_weightController.text,0.06);
        _fomatedText = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
        break;
      case 1: 
        _finalResult = calculateWeight(_weightController.text,0.38);
         _fomatedText = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
        break;
      case 2: 
        _finalResult = calculateWeight(_weightController.text,0.91);
         _fomatedText = "Your weight on venus is ${_finalResult.toStringAsFixed(1)}";
        break;
             }
            });
          }
          @override
          Widget build(BuildContext context) {
            return new Scaffold(
              appBar: AppBar(
                title: new Text("Weight Plnet X"),
                centerTitle: true,
                backgroundColor: Colors.black54,
        
              ),
        
              backgroundColor: Colors.blueAccent,
              body: new Container(
                alignment: Alignment.topCenter,
                child: new ListView(
                  children: <Widget>[
                    new Image.asset('images/planet.png',
                    width:133.0,
                    height: 200.0,),
        
                    new Container(
                      margin: const EdgeInsets.all(3.0),
                      alignment: Alignment.center,
                      child: new Column(
                        children: <Widget>[
        
                          new TextField(
                            controller: _weightController,
                            keyboardType: TextInputType.number ,
                            decoration: new InputDecoration(
                              labelText: 'Your Weight on Earth',
                              hintText: 'In Founds ',
                              icon: new Icon(Icons.person_outline)
                            ),
                          ),
                          new Padding(padding: new EdgeInsets.all(5.0),),
        
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Radio<int>(
                                activeColor: Colors.brown,
                                value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged,
                              ),
                              new Text('pluto',style:new TextStyle(color:Colors.white30)),
                              new Radio<int>(
                                activeColor: Colors.red,
                                value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged,
                              ),
                               new Text('Mars',style:new TextStyle(color:Colors.white30)),
                              new Radio<int>(
                                activeColor: Colors.orangeAccent,
                                value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged,
                              ),
                               new Text('venus',style:new TextStyle(color:Colors.white30)),
                            ],
                          ),
        
                          new Padding(padding: new EdgeInsets.all(15.6),),
        
                          new Text(
                            _weightController.text.isEmpty? "Please enter weight" : "$_fomatedText"
                            ,style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.4,
                            fontWeight: FontWeight.w500
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              
            );
          }
        
          double calculateWeight(String weight, double multiplier) {

            if(int.parse(weight).toString().isNotEmpty && int.parse(weight)>0){
                return int.parse(weight)*multiplier;
            }else{
              print("wrong");

              return int.parse("180")*0.38;            }
          }
}
