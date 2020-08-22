import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:validation/screens/introscreen.dart';
import 'package:validation/screens/login_screen.dart';
import 'package:validation/screens/register_screen.dart';

import 'model/info.dart';

void main() => runApp(Validation());

class Validation extends StatefulWidget {
  @override
  _ValidationState createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  final InfoList _infoList = InfoList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider<InfoList>.value(value: _infoList),
    ],
    child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Intro',
          theme: ThemeData(
            primaryColor: Colors.tealAccent
          ),
          home: IntroScreen(),
          routes: {
            IntroScreen.routeName: (ctx) => IntroScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            RegisterScreen.routeName: (ctx) => RegisterScreen(),
          }),
    );
  }
}
