import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_coffee_shop/components/logo.dart';

import '../constants.dart';
import 'main_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormBuilderState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool secureText = true;
  IconData icon = FontAwesomeIcons.eyeSlash;

  togglePassword() {
    setState(() {
      secureText = !secureText;
      if (icon == FontAwesomeIcons.eyeSlash) {
        icon = FontAwesomeIcons.eye;
      } else {
        icon = FontAwesomeIcons.eyeSlash;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightPrimary,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/signup.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Color(0xcc4a4a4a), BlendMode.darken)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 6.5,
                    horizontal: MediaQuery.of(context).size.width / 3.5),
                child: Hero(tag: 'logo', child: Logo()),
              )
            ]),
            FormBuilder(
              key: _key,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FormBuilderTextField(
                      attribute: 'email',
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'email',
                        labelStyle: TextStyle(fontSize: 18),
                      ),
                      controller: _emailController,
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FormBuilderTextField(
                      attribute: 'password',
                      maxLines: 1,
                      obscureText: secureText,
                      decoration: InputDecoration(
                        labelText: 'password',
                        labelStyle: TextStyle(fontSize: 18),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(
                              splashColor: Colors.transparent,
                              icon: FaIcon(
                                icon,
                                color: Color(0xff919191),
                              ),
                              onPressed: togglePassword),
                        ),
                      ),
                      controller: _passwordController,
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.min(8)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      splashColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 40),
                      color: Color(0xff0d9f67),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => MainScreen()),
                            (Route<dynamic> route) => false);
                      },
                      child: Center(
                        child: Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 22),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
