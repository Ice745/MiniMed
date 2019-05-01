import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'TopUpPage.dart';

class CashPage extends StatefulWidget {
  @override
  _CashPageState createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  final String baseUrl = 'https://solus.serveo.net';
  int b_ace = 1;

  Future<Null> _refresh()async{
    await Future.delayed(Duration(milliseconds: 1));
    setState(() => b_ace = b_ace);
  }

  Future<int> balance() async{
    SharedPreferences balance = await SharedPreferences.getInstance();
    int name = balance.getInt("balance");
    return name;
  }

  void run(context) async{
    b_ace = await balance();
    debugPrint("Run is running");
  }



  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=>run(context));
  }

  void _topup(){
      Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new TopUpPage();
      }),
    );
    }

  @override
  Widget build(BuildContext context) {     
    return new Material(color: new Color.fromARGB(255, 238, 66, 102),
      child: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child:
      new Column(
        children: [
          new Expanded(
            child: new ListView( 
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Container(margin: new EdgeInsets.fromLTRB(0.0, 10.0, 180.0, 0.0),
                child: new Text('Your account has',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 20.0,
                  
                  color: Colors.white
                ),  
                ),
                ),
                new Container(margin: new EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 100.0),
                  child: new Text('GHS $b_ace.00', 
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 55.0,
                  fontWeight: FontWeight.w500,
                  color: new Color.fromARGB(255, 255, 255, 255)
                  ),
                  ),                  
                ),
                
                
                new Container(
                  margin: new EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 20.0),
                  padding: EdgeInsets.all(16.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new OutlineButton(
                          onPressed: _topup,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          ),
                          child: new Container(
                            margin: new EdgeInsets.all(13.0),
                            child: new Text('Credit Account',
                          style: new TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                          ),
                          ),
                        ),
                        ),
                      )
                    ],
                  ),
                ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      )
    );
  }
}