import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
// import 'main.dart';

class ItemsPage extends StatefulWidget {
  @override
  _ItemsPageState createState() => _ItemsPageState();
}


class _ItemsPageState extends State<ItemsPage>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final String baseUrl = 'https://solus.serveo.net';


  @override
  Widget build(BuildContext context) {

    void _settingModalBottomSheet(context, mess){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: new Wrap(
            children: <Widget>[
new ListTile(
            leading: new Icon(Icons.info_outline),
            title: new Text(mess, style: style),
            onTap: () => {}          
          ),
          new SizedBox(height: 100),
            ],
          ),
          );
      }
    );
    }

    Future<String> token() async{
    SharedPreferences tokn = await SharedPreferences.getInstance();
    String name = tokn.getString("token");
    return name;
  }
    
    Future<String> _condoms() async{
      var tok = await token();
      var bodycon = {
        'quantity': 1,
        'price': 18
      };
      var jbodycon = json.encode(bodycon);
      try {
        var response = await http.put(
        Uri.encodeFull('$baseUrl/inventory/1/purchase'),
        headers: {
            'Content-Type': 'application/json',
            'x-access-token': tok
          },
          body: jbodycon
      );
      print('Response Status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var body = json.decode(response.body);
      var message = body["message"];
      _settingModalBottomSheet(context, message);
      } catch (e) {
        _settingModalBottomSheet(context, 'Transaction Failed');
      }
    }

    Future<String> _pad() async{
      var tok = await token();
      var bodycon = {
        'quantity': 1,
        'price': 7
      };
      var jbodycon = json.encode(bodycon);
      try {
        var response = await http.put(
        Uri.encodeFull('$baseUrl/inventory/2/purchase'),
        headers: {
            'Content-Type': 'application/json',
            'x-access-token': tok
          },
          body: jbodycon
      );
      print('Response Status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var body = json.decode(response.body);
      var message = body["message"];
      _settingModalBottomSheet(context, message);
      } catch (e) {
        _settingModalBottomSheet(context, 'Transaction Failed');
      }
    }
    Future<String> _kit() async{
      var tok = await token();
      var bodycon = {
        'quantity': 1,
        'price': 9
      };
      var jbodycon = json.encode(bodycon);
      try {
        var response = await http.put(
        Uri.encodeFull('$baseUrl/inventory/3/purchase'),
        headers: {
            'Content-Type': 'application/json',
            'x-access-token': tok
          },
          body: jbodycon
      );
      print('Response Status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var body = json.decode(response.body);
      var message = body["message"];
      _settingModalBottomSheet(context, message);
      } catch (e) {
        _settingModalBottomSheet(context, 'Transaction Failed');
      }
    }
    
    return Scaffold(
      body: Center(
        child: new Container(
          color: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child:
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Column(
                children: <Widget>[
                new Container(margin: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                    child:
                     new FlatButton(
                       padding: EdgeInsets.all(0.0),
                      onPressed: _condoms,
                      child: new Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/cd.jpg'),
                            fit: BoxFit.fill
                          ),
                      ),                      
                      )
                      )
                
                      ),
                      new Container(margin: new EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
                        child:new Column(
                          children: <Widget>[
                            new Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20.0),
                                new Text('Price: GHS 18.00',
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0,
                                  color: new Color.fromARGB(155, 0 , 0, 0)
                                  
                                ),
                                )
                              ],
                            ),
                          ],
                        )
                      ),
                        ],
                      )
              ],
              ),
              new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                new Container(margin: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                    child:
                     new FlatButton(
                       padding: EdgeInsets.all(0.0),
                      onPressed: _pad,
                      child: new Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/pad.jpg'),
                            fit: BoxFit.fill
                          ),
                      ),
                      )
                      )
                      ),
                      new Container(margin: new EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
                        child:new Column(
                          children: <Widget>[
                            new Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20.0),
                                new Text('Price: GHS 7.00',
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0,
                                  color: new Color.fromARGB(155, 0 , 0, 0)
                                  
                                ),
                                )
                              ],
                            ),
                          ],
                        )
                      ),
                  ]
                )
              ],
              ),
              new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                new Container(margin: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                    child:
                     new FlatButton(
                       padding: EdgeInsets.all(0.0),
                      onPressed: _kit,
                      child: new Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('assets/kit.jpg'),
                            fit: BoxFit.fill
                          ),
                      ),
                      )
                      )
                      ),
                      new Container(margin: new EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
                        child:new Column(
                          children: <Widget>[
                            new Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20.0),
                                new Text('Price: GHS 9.00',
                                style: new TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0,
                                  color: new Color.fromARGB(155, 0 , 0, 0)
                                  
                                ),
                                )
                              ],
                            ),
                          ],
                        )
                      ),
                  ]
                )
              ],
              ),
            ],
          ),
          )
        ),
      ),
    );
  }
  
}