import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkManager {
  getFavorites(BuildContext context) async {
    try {
      http.Response response = await http.get(
          'http://www.json-generator.com/api/json/get/bUAofhweJK?indent=2',
          headers: {'Accept': 'application/json'});
      var jsonData = json.decode(response.body);
      List favorites = [];
      for (var i in jsonData) {
        Map<String, dynamic> favorite = {
          'name': i['name'],
          'about': i['about'],
          'price': i['price'],
          'picture': i['picture'],
        };
        favorites.add(favorite);
      }
      return favorites;
    } catch (e) {
      print(e);
      showDialog<void>(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            titleTextStyle:
                Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18,color: Color(0xff666666)),
            title:
                Text('Couldn\' get favorites . Please check your connection !'),
            actions: <Widget>[
              RaisedButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  child: Text('Ok')),
            ],
          );
        },
      );
    }
  }
}
