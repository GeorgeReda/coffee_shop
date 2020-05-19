import 'dart:async';

import 'package:flutter/material.dart';
import 'package:little_coffee_shop/constants.dart';
import 'package:little_coffee_shop/routes/main_screen.dart';
import 'package:little_coffee_shop/routes/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/logo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      themeMode: ThemeMode.light,
      theme: Constants.lightTheme,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  start() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String state = prefs.get('state');
    if (state != 'in') {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Onboarding()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()));
    }
  }

  @override
  void initState() {
    Timer(Duration(seconds: 3), start);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/splash.png',
                fit: BoxFit.cover,
                color: Color(0xcc4a4a4a),
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.width / 10,
              right: MediaQuery.of(context).size.height / 20,
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Logo(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
