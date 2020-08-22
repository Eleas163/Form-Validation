import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validation/screens/login_screen.dart';
import 'package:validation/screens/register_screen.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = '/introscreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {


  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 80),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                      child: ClipRect(
                        child: Image.asset(
                          'assets/images/gologo.png',
                        ),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 110.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: FlatButton(
                            color: Colors.white,
                              textColor: Colors.tealAccent,
                              splashColor: Colors.tealAccent,
                              child: Text('LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.2
                              ),),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                      style: BorderStyle.solid
                                  ),
                                borderRadius: BorderRadius.circular(30.0),),
                            onPressed: (){
                              Navigator.of(context).pushNamed(LoginScreen.routeName);
                            },
                          ),
                          height: MediaQuery.of(context).size.height*.065,
                          width: MediaQuery.of(context).size.width*.95,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        Container(
                          child: FlatButton(
                              color: Colors.tealAccent,
                              textColor: Colors.white,
                              splashColor: Colors.white,
                              child: Text('REGISTER',
                                style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.2
                                ),),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white,
                                    width: 1,
                                    style: BorderStyle.solid
                                ),
                                borderRadius: BorderRadius.circular(30.0),),
                            onPressed: (){
                              Navigator.of(context).pushNamed(RegisterScreen.routeName);
                            },
                          ),
                          height: MediaQuery.of(context).size.height*.065,
                          width: MediaQuery.of(context).size.width*.95,
                        ),
                      ],
                    ),
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