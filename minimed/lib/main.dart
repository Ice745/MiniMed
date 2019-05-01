import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'Login.dart';
import 'AvailableItems.dart';
import 'MoneyPage.dart';
import 'TopUpPage.dart';
import 'menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginPage(),
      home: MenuPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final String baseUrl = 'https://solus.serveo.net';


  @override
  Widget build(BuildContext context) {


  void _items() {
      Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new ItemsPage();
      }),
    );
    }

    void _topup(){
      Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new TopUpPage();
      }),
    );
    }

    Future<String> public() async{
    SharedPreferences id = await SharedPreferences.getInstance();
    String name = id.getString("public_id");
    return name;
  }
  Future<String> token() async{
    SharedPreferences tokn = await SharedPreferences.getInstance();
    String name = tokn.getString("token");
    return name;
  }

    Future<String> _money() async{
      var pubID = await public();
      var tok = await token();
      SharedPreferences balance = await SharedPreferences.getInstance();
      try {
        var response = await http.get(
          Uri.encodeFull('$baseUrl/user/$pubID/balanceCheck'),
          headers: {
            'Content-Type': 'application/json',
            'x-access-token': tok
          }
        );
        
        print('Response status: ${response.statusCode}');
        var body = json.decode(response.body);
        var balnc = body["balance"];
        balance.setInt('balance', balnc);
        print('Response body: ${response.body}');
        if (response.body.contains('balance')){
          Navigator.of(context).push(
            new MaterialPageRoute(builder: (context){
              return new CashPage();
            }),
          );
        }
        
      } catch (e) {
        debugPrint("not this time");
      }
    }
    void _emergency(){
    launch('tel:+233 501331668');
  }
    return Scaffold(
      body: Center(
        child:Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:new Column( 
          children: <Widget>[
            new Flexible(
              flex: 1,
              child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(margin: new EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                    child:
                     new FlatButton(
                       padding: EdgeInsets.all(0.0),
                      onPressed: _items,
                      
                      child: new Container(
                        height: 120.0,
                        width: 300.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/back.png'),
                          ),
                      ),
                      child: 
                      new Container(margin: new EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 10.0),
                        child:new Column(
                          children: <Widget>[
                            new Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 50.0),
                                new Text('Available Items',
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.0,
                                  color: new Color.fromARGB(255, 250 , 250, 252)
                                  
                                ),
                                )
                              ],
                            ),
                          ],
                        )
                      ),
                      )
                      )
                      )
                  ],
                ),
                
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(margin: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child:
                     new FlatButton(
                       padding: EdgeInsets.all(0.0),
                      onPressed: _topup,
                      child:  Container(
                        height: 120.0,
                        width: 300.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/back.png'),
                          ),
                      ),
                      child: 
                      new Container(margin: new EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 10.0),
                        child:new Column(
                          children: <Widget>[
                            new Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 50.0),
                                new Text('TopUp MedCredit',
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.0,
                                  color: new Color.fromARGB(255, 250 , 250, 252)
                                  
                                ),
                                )
                              ],
                            ),
                          ],
                        )
                      ),
                      )
                      ))
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(margin: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child:
                     new FlatButton(
                       padding: EdgeInsets.all(0.0),
                      onPressed: _money,
                      child:  Container(
                        height: 120.0,
                        width: 300.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/back.png'),
                          ),
                      ),
                      child: 
                      new Container(margin: new EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 10.0),
                        child:new Column(
                          children: <Widget>[
                            new Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 50.0),
                                new Text('MedCredit Balance',
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.0,
                                  color: new Color.fromARGB(255, 250 , 250, 252)
                                  
                                ),
                                )
                              ],
                            ),
                          ],
                        )
                      ),
                      )))
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(margin: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    child:
                     new FlatButton(
                       padding: new EdgeInsets.all(0.0),
                      onPressed: _emergency,
                      child:  Container(
                        height: 120.0,
                        width: 300.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/back.png'),
                          ),
                      ),
                      child: 
                      new Container(margin: new EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 10.0),
                        child:new Column(
                          children: <Widget>[
                            new Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 50.0),
                                new Text('Emergency',
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24.0,
                                  color: new Color.fromARGB(255, 250 , 250, 252)
                                  
                                ),
                                )
                              ],
                            ),
                          ],
                        )
                      ),
                      )))
                  ],
                ),
                ],
            )
            )
          ],
        ),
      // ),
              )))


    );
  }
}
