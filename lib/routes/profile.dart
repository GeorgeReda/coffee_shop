import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'settings.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown.withOpacity(0.7),
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 22),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> Settings()
                ));
              },
              icon: FaIcon(
                FontAwesomeIcons.cog,
                color: Colors.white,
              ),
            ),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'images/profile.png',
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.4),
                    colorBlendMode: BlendMode.darken,
                  ),
                  Positioned(
                    bottom: 10,
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Alexander Karev',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontSize: 28),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('UI Designer & Coffee Lover',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontSize: 15)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.camera,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Born in Singapore, received my design training in '
                      'London and New York, and am always striving to '
                      'create work that combines strategic design with '
                      'compelling visuals and an attention to detail.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff919191),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
            Expanded(
              flex: 1,
                child: Row(
              children: <Widget>[
                Expanded(child: createInfoTile(0, 'Favorites')),
                divideVertically(),
                Expanded(child: createInfoTile(30, 'Likes')),
                divideVertically(),
                Expanded(child: createInfoTile(25, 'Followers')),
                divideVertically(),
                Expanded(child: createInfoTile(60, 'Following')),
              ],
            )),
            Expanded(
              flex: 1,
                child: RaisedButton(
                    color: Color(0xff0d9f67),
                    onPressed: () {},
                    child: Center(
                      child: Text('Follow',
                      style: Theme.of(context).textTheme.bodyText1),
                    )))
          ],
        ),
      ),
    );
  }
}

Widget createInfoTile(int num, String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(
        child: Text(num.toString(),
            style: TextStyle(
              fontSize: 32,
              color: Color(0xff919191),
            )),
      ),
      Expanded(
        child: Text(text,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff919191),
            )),
      ),
    ],
  );
}

divideVertically() {
  return VerticalDivider(
    color: Color(0xff919191).withOpacity(0.3),
    width: 1,
    thickness: 1,
  );
}
