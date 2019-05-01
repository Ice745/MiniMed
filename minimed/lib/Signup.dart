import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'Login.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}


class _SignupPageState extends State<SignupPage>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final userInput = TextEditingController();
  final passwordInput = TextEditingController();
  final String baseUrl = 'https://solus.serveo.net';


  @override
  void dispose(){
    userInput.dispose();
    passwordInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    Future<String> _home() async{
    var user = userInput.text;
    var password = passwordInput.text; 
    var content = {
      'username': user,
      'password': password
      };
    var bodcon = json.encode(content);
    try {
      var response = await http.post(
      Uri.encodeFull('$baseUrl/signup'), 
      body: bodcon,
      headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200){
          Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new LoginPage();
      }),
    );
      }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    } catch (e) {
      debugPrint("this no dey job");
    }
    }
      final emailField = TextField(
        controller: userInput,
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Username",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final passwordField = TextField(
          controller: passwordInput,
          obscureText: true,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Password",
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
            child: Text("Sign Up",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

        return Scaffold(
          body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(36.0,100.0,36.0,100.0),
                child: SingleChildScrollView(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/M.png",
                        scale: 4.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
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