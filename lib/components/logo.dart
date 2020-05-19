import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.white, width: 2)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LITTLE',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 22)),
            SizedBox(height: 5),
            Text(
              'COFFEE',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w300, letterSpacing: 2, fontSize: 22),
            ),
            SizedBox(height: 5),
            Text(
              'Shop',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w300, letterSpacing: 2, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
