import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'MoneyPage.dart';

class TopUpPage extends StatefulWidget {
  @override
  _TopUpPageState createState() => _TopUpPageState();
}


class _TopUpPageState extends State<TopUpPage>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final vouchInput = TextEditingController();
  final String baseUrl = 'https://solus.serveo.net';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar(){
    final snackbar = new SnackBar(
      content: Text('Sorry voucher not present'),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  _showSnack(){
    final snackbar = new SnackBar(
      content: Text("Successfully Topped up"),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context){
    
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

    Future<String> _home() async{
    var pubID = await public();
      var tok = await token();
      var content = {
        'code': vouchInput.text
      };
      var jcontent = json.encode(content);
    try {
      var response = await http.put(
        Uri.encodeFull('$baseUrl/user/$pubID/balance'),
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': tok
        },
        body: jcontent
        );
        if (response.body.contains('updated')){         
      // Navigator.of(context).push(
      // new MaterialPageRoute(builder: (context){
      //   return new CashPage();
      // }),
    // );
    _showSnack();
        }else {
          _showSnackBar();
        }
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
    } catch (e) {
      debugPrint('Nope');
    }
    }
      final emailField = TextField(
        keyboardType: TextInputType.numberWithOptions(),
        controller: vouchInput,
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "voucher numbers",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: _home,
            child: Text("Top up",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

        return Scaffold(
          key: _scaffoldKey,
          body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: SingleChildScrollView(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/M.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 70.0),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
            ),
          ),
        );
  }
  
}