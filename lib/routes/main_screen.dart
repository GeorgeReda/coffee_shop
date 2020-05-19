import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_coffee_shop/components/menu_list_tile.dart';
import 'package:little_coffee_shop/constants.dart';
import 'package:little_coffee_shop/routes/favorites.dart';
import 'package:little_coffee_shop/routes/profile.dart';
import 'package:little_coffee_shop/routes/settings.dart';

import 'shop.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static final innerDrawerKey = GlobalKey<InnerDrawerState>();
  final List<String> titles = [
    'Coffee',
    'Breakfast',
    'Munchies',
    'Sandwiches',
    'Specialty Drinks'
  ];

  final List<String> trailings = [
    'Freshly brewed coffee',
    'Perfectly baked & served warm',
    'Perfectly baked & served warm',
    'Fresh, healthy and tasty',
    'Special drinks for every taste '
  ];

  final List<String> imgs = [
    'menu_coffee',
    'menu_breakfast',
    'menu_munchies',
    'menu_sandwiches',
    'menu_drinks',
  ];

  static List drawerItems = [
    Item('Menu', FontAwesomeIcons.bars, page: MainScreen()),
    Item('Favorites', FontAwesomeIcons.solidHeart, page: Favorites()),
    Item('Shop', FontAwesomeIcons.shoppingCart, page: Order()),
    Item('Profile', FontAwesomeIcons.userCircle, page: Profile()),
    Item('Settings', FontAwesomeIcons.cog, page: Settings()),
    Item('Help', FontAwesomeIcons.infoCircle, page: PlaceHolder()),
    Item('Sign Out', FontAwesomeIcons.signOutAlt)
  ];

  drawerNavigation(context, route) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
    innerDrawerKey.currentState.toggle();
  }

  Widget createDrawerItem(item) {
    return ListTileTheme(
      style: ListTileStyle.drawer,
      iconColor: Colors.white,
      selectedColor: Colors.transparent,
      child: ListTile(
        onTap: () {
          if (item.name != 'Sign Out') {
            drawerNavigation(context, item.page);
          } else {
            Constants().signOut(context);
          }
        },
        leading: FaIcon(item.icon),
        title: Text(item.name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InnerDrawer(
      key: innerDrawerKey,
      scale: IDOffset.horizontal(0.8),
      backgroundColor: Constants.lightTextSelection,
      leftAnimationType: InnerDrawerAnimation.quadratic,
      onTapClose: true,
      leftChild: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 8),
        child: Column(
          children: [
            createDrawerItem(drawerItems[0]),
            createDrawerItem(drawerItems[1]),
            createDrawerItem(drawerItems[2]),
            createDrawerItem(drawerItems[3]),
            createDrawerItem(drawerItems[4]),
            createDrawerItem(drawerItems[5]),
            createDrawerItem(drawerItems[6]),
          ],
        ),
      ),
      scaffold: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  pinned: false,
                  snap: false,
                  centerTitle: true,
                  title: Text(
                    'Menu',
                    style: TextStyle(
                        color: Constants.lightTextSelection, fontSize: 28),
                  ),
                  leading: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.bars,
                        color: Constants.lightTextSelection,
                      ),
                      onPressed: () {
                        innerDrawerKey.currentState.toggle();
                      }),
                )
              ];
            },
            body: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: titles.length,
                separatorBuilder: (context, i) => Divider(
                      height: 1,
                      color: Colors.white,
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return MenuListTile(
                    title: titles[index],
                    trailing: trailings[index],
                    img: imgs[index],
                  );
                }),
          ),
        ),
      ),
    ));
  }
}
