import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/conts/my_icon.dart';
import 'package:online_shop/provider/dark_theme.dart';
import 'package:online_shop/screen/cart.dart';
import 'package:online_shop/screen/wishlist.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  double top = 0.0;
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final changeTheme = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;
                    return Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: top <= 110 ? 1.0 : 0,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      height: kToolbarHeight / 1.8,
                                      width: kToolbarHeight / 1.8,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorsConsts.white,
                                            blurRadius: 1,
                                          ),
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Guest',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: ColorsConsts.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        background: Image(
                          image: NetworkImage(
                              'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: userTitle('User Bag'),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    userListTile(context, 'WishList', () {
                      NavigateTo(Wishlist.routeName, context);
                    }, '', 5),
                    userListTile(context, 'Cart', () {
                      NavigateTo(Cart.routeName, context);
                    }, 'subPhone', 6),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: userTitle('User Info'),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    userListTile(context, 'Email', () {}, 'subEmail', 0),
                    userListTile(context, 'Phone', () {}, 'subPhone', 1),
                    userListTile(context, 'shipping address', () {}, '', 2),
                    userListTile(context, 'joined data', () {}, 'data', 3),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: userTitle('User Settings'),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    ListTileSwitch(
                      value: changeTheme.darkTheme,
                      leading: Icon(Ionicons.md_moon),
                      onChanged: (value) {
                        setState(() {
                          changeTheme.darkTheme = value;
                        });
                      },
                      visualDensity: VisualDensity.comfortable,
                      switchType: SwitchType.cupertino,
                      switchActiveColor: Colors.indigo,
                      title: Text('Dark Theme'),
                    ),
                    userListTile(
                      context,
                      'Logout',
                      () {},
                      '',
                      4,
                    ),
                  ],
                ),
              )
            ],
          ),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    final double defaultTopMargin = 200.0 - 4.0;
    final double scaleStart = 160.0;
    final double scaleEnd = scaleStart / 2;
    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        scale = 0.0;
      }
    }
    return Positioned(
      top: top,
      right: 16,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          heroTag: 'btn1',
          backgroundColor: Colors.purple,
          onPressed: () {},
          child: Icon(Icons.camera_alt_rounded),
        ),
      ),
    );
  }

  Widget userTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    );
  }

  List<IconData> _userIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app,
    MyAppIcons.wishlist,
    MyAppIcons.bag,
  ];

  void NavigateTo(String routeName, BuildContext context) {
    Navigator.pushNamed(context, routeName);
  }

  Widget userListTile(BuildContext context, String title, Function fac,
      String subTitle, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          title: Text(title),
          subtitle: Text(subTitle),
          onTap: fac,
          leading: Icon(_userIcons[index]),
        ),
      ),
    );
  }
}
