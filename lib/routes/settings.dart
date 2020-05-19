import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _key = GlobalKey<FormBuilderState>();

  final _usernameController = TextEditingController();
  final _titleController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();

  File _image;
  String base64Image;
  SharedPreferences prefs;
  bool secureText = true;
  IconData icon = FontAwesomeIcons.eyeSlash;
  bool facebookAuth = false;
  bool twitterAuth = false;

  getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    base64Image = base64Encode(_image.readAsBytesSync());
  }

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown.withOpacity(0.7),
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
            key: _key,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Center(
                  child: FormBuilderCustomField(
                    attribute: 'image',
                    formField: FormField(
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: GestureDetector(
                            onTap: getImage,
                            child: _image == null
                                ? Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.white.withOpacity(0),
                                        border: Border.all(
                                            color: Colors.black.withOpacity(0),
                                            style: BorderStyle.solid,
                                            width: 1)),
                                    child: Center(
                                        child: Container(
                                      height: 200,
                                      width: 200,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://via.placeholder.com/150'),
                                      ),
                                    )),
                                  )
                                : Container(
                                    height: 200,
                                    width: 200,
                                    child: CircleAvatar(
                                      backgroundImage: FileImage(_image),
                                    )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'INFO',
                    style: TextStyle(color: Color(0xff666666), fontSize: 16),
                  ),
                ),
                Divider(
                  color: Color(0xffe6e9ed),
                  thickness: 1,
                ),
                createTextField('Name', _usernameController, TextInputType.text,
                    [FormBuilderValidators.required()]),
                createTextField('Title', _titleController, TextInputType.text,
                    [FormBuilderValidators.required()]),
                createTextField('Bio', _bioController, TextInputType.text, []),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 40, 8, 8),
                  child: Text(
                    'Account',
                    style: TextStyle(color: Color(0xff666666), fontSize: 16),
                  ),
                ),
                Divider(
                  color: Color(0xffe6e9ed),
                  thickness: 1,
                ),
                createTextField(
                    'Email', _emailController, TextInputType.emailAddress, [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email()
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    attribute: 'password',
                    maxLines: 1,
                    obscureText: secureText,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(
                      labelText: 'password',
                      labelStyle: TextStyle(fontSize: 18),
                      prefixText: 'password  ',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: FaIcon(
                              icon,
                              color: Constants.lightTextSelection,
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
                createTextField('Address', _addressController,
                    TextInputType.emailAddress, []),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 40, 8, 8),
                  child: Text(
                    'Account',
                    style: TextStyle(color: Color(0xff666666), fontSize: 16),
                  ),
                ),
                Divider(
                  color: Color(0xffe6e9ed),
                  thickness: 1,
                ),
                createSwitchTile(facebookAuth, (bool value) {
                  setState(() {
                    facebookAuth = value;
                  });
                }, 'Facebook'),
                createSwitchTile(twitterAuth, (bool value) {
                  setState(() {
                    twitterAuth = value;
                  });
                }, 'Twitter'),
              ],
            )),
      ),
    );
  }
}

createTextField(String attribute, TextEditingController controller,
    TextInputType inputType, List<FormFieldValidator> validators) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: <Widget>[
        FormBuilderTextField(
          attribute: attribute,
          keyboardType: inputType,
          decoration: InputDecoration(
              labelText: attribute,
              labelStyle: TextStyle(fontSize: 18),
              prefixText: '$attribute  '),
          controller: controller,
          validators: validators,
        ),
      ],
    ),
  );
}

createSwitchTile(bool value, Function onChanged, String title) {
  return SwitchListTile(
    value: value,
    onChanged: onChanged,
    title: Text(
      title,
      style: TextStyle(fontSize: 18, color: Color(0xff919191)),
    ),
    activeTrackColor: Color(0xff4CD764),
    dense: true,
  );
}
