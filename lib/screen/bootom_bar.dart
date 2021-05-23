import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:online_shop/conts/my_icon.dart';
import 'package:online_shop/screen/search.dart';
import 'package:online_shop/screen/user_info.dart';

import 'cart.dart';
import '../widgets/cart_empty.dart';
import 'feeds.dart';
import 'home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Map<String, Object>> _pages;
  int _selectPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': Home(),
      },
      {
        'page': Feeds(),
      },
      {
        'page': Search(),
      },
      {
        'page': Cart(),
      },

      {
        'page': UserInfo(),
      },
    ];
    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.03,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              // ignore: deprecated_member_use
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.pink,
              currentIndex: _selectPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  // ignore: deprecated_member_use
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.rss),
                  // ignore: deprecated_member_use
                  title: Text('Feeds'),
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  // ignore: deprecated_member_use
                  title: Text('Search'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.bag),
                  // ignore: deprecated_member_use
                  title: Text('Cart'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.user),
                  // ignore: deprecated_member_use
                  title: Text('User'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(9),
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          hoverElevation: 10,
          elevation: 4,
          tooltip: "Search",
          splashColor: Colors.grey,
          child: Icon(MyAppIcons.search),
          onPressed: () {
            setState(() {
              _selectPageIndex = 2;
            });
          },
        ),
      ),
    );
  }
}
