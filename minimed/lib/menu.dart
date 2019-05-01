import 'package:flutter/material.dart';
import 'Login.dart';
import 'Signup.dart';


class MenuPage extends StatefulWidget{
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  void _signin(){
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new LoginPage();
      }),
    );
  }

  void _signup(){
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        return new SignupPage();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: [
          new Expanded(
            child: Column(
              children: <Widget>[
                new Container( margin: new EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 30.0),
                  child: new Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset('assets/M.png',scale: 3.5,
                  )
                ],
              ),
            ),
            new Container(margin: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                  child: new Text('Welcome to MiniMed', 
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: 17.0,
                    color: new Color.fromARGB(140, 0, 0, 0),
                    fontWeight: FontWeight.w500
                  ),
                  ),                  
                ),
            new Container(
            margin: new EdgeInsets.fromLTRB(70.0, 250.0, 70.0, 0.0),
            decoration: new BoxDecoration(
              color: Colors.red[400],
              borderRadius: new BorderRadius.all(
                const Radius.circular(5.0),
              ),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: const Color.fromARGB(170, 156, 47, 48),
                  offset: new Offset(0.0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      elevation: 0.0,
                      color: new Color.fromARGB(255, 156, 47, 48),
                      child: new Container(
                          margin: new EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                margin: new EdgeInsets.fromLTRB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: new Icon(Icons.apps,
                                    color: Colors.white),
                              ),
                              new Text("Sign In",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: new Color.fromARGB(
                                          255, 255, 255, 255)))
                            ],
                          )),
                      onPressed: _signin,
                ),
                )
              ],
            )),
            new Container(
            margin: new EdgeInsets.fromLTRB(70.0, 50.0, 70.0, 0.0),
            decoration: new BoxDecoration(
              color: Colors.red[400],
              borderRadius: new BorderRadius.all(
                const Radius.circular(5.0),
              ),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: const Color.fromARGB(170, 156, 47, 48),
                  offset: new Offset(0.0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      elevation: 0.0,
                      color: new Color.fromARGB(255, 156, 47, 48),
                      child: new Container(
                          margin: new EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                margin: new EdgeInsets.fromLTRB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: new Icon(Icons.account_box,
                                    color: Colors.white),
                              ),
                              new Text("Sign Up",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: new Color.fromARGB(
                                          255, 255, 255, 255)))
                            ],
                          )),
                      onPressed: _signup,
                ),
                )
              ],
            )),
            
              ],
          )
          )
        ],
      )
    );
  }
  }

