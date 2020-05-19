import 'package:flutter/material.dart';
import 'package:little_coffee_shop/routes/onboarding.dart';

class Constants {
  static String appName = "Little Coffee Shop";

  //Colors for theme
  static const Color lightPrimary = Colors.white;
  static const Color lightCursor = Colors.transparent;
  static const Color lightTextSelection = Color(0xff666666);

  static ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimary,
      accentColor: lightPrimary,
      primaryIconTheme: IconThemeData(color: lightPrimary, size: 10),
      backgroundColor: lightPrimary,
      buttonColor: lightPrimary,
      cursorColor: lightCursor,
      dividerTheme: DividerThemeData(
        color: Colors.white,
        thickness: 1,
      ),
      splashColor: lightCursor,
      textSelectionColor: lightTextSelection,
      textSelectionHandleColor: lightPrimary,
      textTheme: TextTheme(bodyText1: TextStyle(color: lightPrimary)),
      fontFamily: 'Open Sans',
      appBarTheme: AppBarTheme(
        color: lightPrimary,
        iconTheme: IconThemeData(color: Constants.lightTextSelection),
      ),
      scaffoldBackgroundColor: lightPrimary,
      iconTheme: IconThemeData(color: lightTextSelection),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: lightPrimary),
      splashFactory: InkSplash.splashFactory);

  signOut(context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Are you sure you want to Sign Out ?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Onboarding()),
                    (route) => false);
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            )
          ],
        );
      },
    );
  }
}

class Item {
  final String name;
  final IconData icon;
  final page;

  const Item(this.name, this.icon, {this.page});
}

class PlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
