import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_coffee_shop/tools/network_manager.dart';

import '../constants.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              centerTitle: true,
              title: Text(
                'Favorites',
                style: TextStyle(
                    color: Constants.lightTextSelection, fontSize: 28),
              ),
              iconTheme: IconThemeData(color: Color(0xff666666)),
            )
          ];
        },
        body: FutureBuilder(
          future: NetworkManager().getFavorites(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: snapshot.data.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data != null) {
                    return FavGridTile(
                      name: snapshot.data[index]['name'],
                      about: snapshot.data[index]['about'],
                      picture: snapshot.data[index]['picture'],
                      price: snapshot.data[index]['price'],
                    );
                  } else {
                    return  Container(
                color: Theme.of(context).backgroundColor,
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Color(0xff0d9f67)),
                      backgroundColor: Color(0xff666666),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Loading',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ));
              
                  }
                });
          },
        ),
      ),
    ));
  }
}

class FavGridTile extends StatefulWidget {
  final String name;
  final String about;
  final String price;
  final String picture;
  const FavGridTile({
    Key key,
    @required this.name,
    @required this.about,
    @required this.price,
    @required this.picture,
  }) : super(key: key);

  @override
  _FavGridTileState createState() => _FavGridTileState();
}

class _FavGridTileState extends State<FavGridTile> {
  IconData favIcon = FontAwesomeIcons.heart;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${widget.name}',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff666666),
              ),
            ),
            Text(
              '${widget.about}',
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 16,
              ),
            ),
          ],
        ),
        child: Image.network(
          '${widget.picture}',
        ),
        footer: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '${widget.price}',
                style: TextStyle(color: Color(0xff0d9f67),fontSize: 16),
              ),
              IconButton(
                  icon: FaIcon(favIcon, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      favIcon == FontAwesomeIcons.solidHeart
                          ? favIcon = FontAwesomeIcons.heart
                          : favIcon = FontAwesomeIcons.solidHeart;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
