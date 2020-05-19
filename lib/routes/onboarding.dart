import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_coffee_shop/components/logo.dart';
import 'package:little_coffee_shop/routes/login.dart';
import 'package:little_coffee_shop/routes/signup.dart';

bool isVisible = false;

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  Widget _myAnimatedWidget = Intro();

  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        _myAnimatedWidget = FormOptions();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/coffee.png'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Color(0xcc4a4a4a), BlendMode.darken)),
          ),
          child: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  Container(
                    child: Center(
                      child: Hero(tag: 'logo', child: Logo()),
                    ),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 2),
                      child: _myAnimatedWidget,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'The Little Coffee Shop serves specialty',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 10),
                Text(
                  'coffee, fancy grilled cheese sandwiches,',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 10),
                Text(
                  'scratch cooking, craft ales, and cider.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class FormOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.of(context) //Todo: Push and Remove until
                  .push(MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: Text('Sign Up',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.bold)),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 3,
                vertical: 15),
            color: Color(0xff0d9f67),
            splashColor: Colors.transparent,
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton.icon(
            onPressed: () {
              Navigator.of(context) //Todo: Push and Remove until
                  .push(MaterialPageRoute(builder: (context) => SignUp()));
            },
            icon: FaIcon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
            ),
            label: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 7,
                  vertical: 15),
              child: Text('Sign in with Facebook',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            color: Color(0xff3b5998),
            splashColor: Colors.transparent,
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()));
            },
            child: Text(
              'Already have account - Login',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          )
        ],
      ),
    );
  }
}
