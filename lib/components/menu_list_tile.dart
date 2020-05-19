import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  final String title;
  final String trailing;
  final String img;

  const MenuListTile(
      {Key key,
      @required this.title,
      @required this.trailing,
      @required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 25),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/$img.png'),
                fit: BoxFit.fitWidth,
                colorFilter:
                    ColorFilter.mode(Color(0xcc4a4a4a), BlendMode.darken))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              SizedBox(height: 5),
              Text(
                trailing,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
