import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyteller/core/models/home_model.dart';
import 'package:storyteller/data.dart';
import 'package:storyteller/ui/shared/card_scroll_widget.dart';

///Home Page View
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ///Current page index
  double currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    final HomeModel _homeModel = Provider.of<HomeModel>(context);

    final PageController controller =
        PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(right: 30),
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            )
          ],
          leading: Builder(
            builder: (BuildContext context) => IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
          ),
        ),
        drawer: Theme(
          data:
              Theme.of(context).copyWith(primaryColor: const Color(0xFF2d3447)),
          child: Drawer(
            key: _scaffoldKey,
            child: ListView(
              children: const <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('Bahaa Ibrahim'),
                  accountEmail: Text('ibahaaibarhim@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color(0xffe91e63),
                    child: Text(
                      'B',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.trending_up),
                  title: Text('Trending'),
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favorite'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.arrow_back),
                  title: Text('Sign out'),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 30, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text('Trending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontFamily: 'Calibre-Semibold',
                          letterSpacing: 1,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFff6e6e),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                          child: Text('Animated',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text('25+ Stories',
                        style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
              InkWell(
                  child: Stack(
                    children: <Widget>[
                      CardScrollWidget(currentPage),
                      Positioned.fill(
                        child: PageView.builder(
                            itemCount: images.length,
                            controller: controller,
                            reverse: true,
                            itemBuilder: (BuildContext context, int index) {
                              Container();
                            }),
                      ),
                    ],
                  ),
                  onTap: () {
                    print('Tapped');
                    _homeModel
                      ..index = currentPage.floor().toInt()
                      ..navigateToPage(context);
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text('Favorite',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontFamily: 'Calibre-Semibold',
                          letterSpacing: 1,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 22, vertical: 6),
                          child: Text('Latest',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text('9+ Stories',
                        style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/image_02.jpg',
                          width: 296, height: 222),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
