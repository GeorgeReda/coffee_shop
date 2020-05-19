import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_coffee_shop/constants.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  IconData favIcon = FontAwesomeIcons.heart;
  var selectedAmount;

  DropdownMenuItem createDropdownItem(val) {
    return DropdownMenuItem(
      value: val.toString(),
      onTap: () {
        setState(() {
          selectedAmount = val;
        });
      },
      child: Text(
        '$val',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  onTapFav() {
    setState(() {
      if (favIcon == FontAwesomeIcons.heart) {
        favIcon = FontAwesomeIcons.solidHeart;
      } else {
        favIcon = FontAwesomeIcons.heart;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.lightPrimary,
        title: Text(
          'Chocolate Muffin',
          style: TextStyle(color: Constants.lightTextSelection, fontSize: 22),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: FaIcon(favIcon, color: Colors.red), onPressed: onTapFav)
        ],
      ),
      backgroundColor: Constants.lightPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Center(child: Image.asset('images/order_muffin.png'))),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Our muffin unites rich, dense chocolate with'),
                    Text('a gooey caramel center for bliss in every bite.'),
                    Text("As far as we're concerned, there's no such"),
                    Text('thing as too much caramel.'),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Quantity',
                              style: TextStyle(fontSize: 18),
                            ),
                            DropdownButton(
                              icon: FaIcon(FontAwesomeIcons.sortNumericUpAlt),
                              style: TextStyle(
                                  color: Constants.lightTextSelection),
                              hint: Text('select quantity'),
                              value: selectedAmount,
                              items: [
                                createDropdownItem(0),
                                createDropdownItem(1),
                                createDropdownItem(2),
                                createDropdownItem(3),
                                createDropdownItem(4),
                                createDropdownItem(5),
                                createDropdownItem(6),
                                createDropdownItem(7),
                                createDropdownItem(8),
                                createDropdownItem(9),
                                createDropdownItem(10),
                              ],
                              onChanged: (val) {
                                selectedAmount = val;
                              },
                            )
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Total',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '\$20',
                            style: TextStyle(
                                color: Color(0xff0d9f67), fontSize: 32),
                          ),
                        ],
                      ),
                    )),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        'Place The Order',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      color: Color(0xff0d9f67),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
