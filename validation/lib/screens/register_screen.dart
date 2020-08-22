
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:validation/screens/introscreen.dart';

import '../model/info.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _status = '';
  final InfoList _infoList = InfoList();
  String _name, _email, _password;

  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _controllerName, _controllerEmailID, _controllerPassword;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _infoList = Provider.of<InfoList>(context, listen: true);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: FlatButton(
          child: Icon(Icons.cancel, color: Colors.tealAccent,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(IntroScreen.routeName);
          },
        ),
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: Colors.tealAccent,
                      radius: 45,
                      child: Text('REGI STER',
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: Colors.white,
                            fontSize: 31,
                            fontWeight: FontWeight.bold),)
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person, color: Colors.tealAccent,),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent, style: BorderStyle.solid, width: 2),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent, style: BorderStyle.solid, width: 2),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                labelText: 'DISPLAY NAME',
                                labelStyle: TextStyle(color: Colors.tealAccent),
                              ),
                              validator: (val){
                                if (val.length < 1) {
                                  return "Name Required";
                                }
                                else
                                  return null;
                              },
                              onSaved: (val) => _name =  val,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              controller: _controllerName,
                              autocorrect: false,
                            ),
                            Padding( padding: EdgeInsets.only(top: 10)),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email, color: Colors.tealAccent,),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent, style: BorderStyle.solid, width: 2),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent, style: BorderStyle.solid, width: 2),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                labelText: 'EMAIL',
                                labelStyle: TextStyle(color: Colors.tealAccent),
                              ),
                              validator: (val){
                                if (val.length < 1) {
                                  return 'Email Required';
                                }
                                else if (EmailValidator.validate(val) == false) {
                                  return "Email should contain \'@example.com'";
                                }
                                else
                                  return null;
                              },
                              onSaved: (val) => _email =  val,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              controller: _controllerEmailID,
                              autocorrect: false,
                            ),
                            Padding( padding: EdgeInsets.only(top: 10)),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock, color: Colors.tealAccent,),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent, style: BorderStyle.solid, width: 2),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent, style: BorderStyle.solid, width: 2),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                labelText: 'PASSWORD',
                                labelStyle: TextStyle(color: Colors.tealAccent),
                              ),
                              validator: (val) =>
                              val.length < 1 ? 'Password Required' : null,
                              onSaved: (val) => _password = val,
                              obscureText: true,
                              controller: _controllerPassword,
                              keyboardType: TextInputType.text,
                              autocorrect: false,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child:  Container(
                                height: MediaQuery.of(context).size.height*.065,
                                width: MediaQuery.of(context).size.width*.95,
                                child: FlatButton(
                                  color: Colors.tealAccent,
                                  textColor: Colors.white,
                                  splashColor: Colors.tealAccent,
                                  child: Text('CREATE ACCOUNT',
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
                                  onPressed: () {
                                    final form = formKey.currentState;
                                    if(form.validate()) {
                                      form.save();
                                      var checkEmail = _infoList.items.where((element) => element.email == _email.toString().toLowerCase().trim());
                                      if(checkEmail.isNotEmpty) {
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "User with this Email already exists",
                                                textAlign: TextAlign.center,),
                                            )
                                        );
                                      }
                                      else
                                      {
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                              content: Text('Registered Successfully',textAlign: TextAlign.center,),
                                            )
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        )
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