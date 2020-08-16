import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BmiMain(),
    );
  }
}

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();


  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body:Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child:Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
                controller: _heightController,
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value.trim().isEmpty){
                    return '키를 입력하세요';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _weightController,
                validator: (value){
                  if(value.trim().isEmpty){
                    return '몸무게를 입력하세요';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게'),
                  keyboardType: TextInputType.number,
                ),
                Container(
                  margin: const EdgeInsets.only(top:16.0),
                    alignment: Alignment.centerRight,
                  child:RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>BmiResult(
                              double.parse(_heightController.text.trim()),
                              double.parse(_weightController.text.trim())
                            )
                          )
                        );
                      }
                    },
                    child: Text('결과 보기'),
                  )
              ),
            ],
          )
        ),
      ),
    );
  }
}

class BmiResult extends StatelessWidget {
  final double height;
  final double weight;

  BmiResult(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('비만도 계산기')),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('정상', style: TextStyle(fontSize: 36)),
            SizedBox(height: 16,),
            Icon(
              Icons.sentiment_satisfied,
              color:Colors.green,
              size:100,
            ),
          ],
        ),
      ),
    );
  }
}

