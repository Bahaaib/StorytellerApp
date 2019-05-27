import 'dart:math';

import 'package:flutter/material.dart';
import 'package:storyteller/HomePage/home_page_viewmodel.dart';
import 'package:storyteller/data.dart';

///HomePage View
class HomePageView extends HomePageViewModel {
  ///Current page index
  double currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 30, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Trending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontFamily: 'Calibre-Semibold',
                          letterSpacing: 1,
                        )),
                    IconButton(
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 6),
                          child: Text('Animated',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text('25+ Stories',
                        style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Favourite',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                          fontFamily: 'Calibre-Semibold',
                          letterSpacing: 1,
                        )),
                    IconButton(
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 6),
                          child: Text('Latest',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text('9+ Stories',
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

///Card Aspect Ratio
const double cardAspectRatio = 12.0 / 16.0;

///Widget Aspect Ratio
const double widgetAspectRatio = cardAspectRatio * 1.2;

///Card Scroll Widget class
@immutable
class CardScrollWidget extends StatelessWidget {
  ///Public constructor
  const CardScrollWidget(this.currentPage);

  ///Current Page index
  final double currentPage;

  @override
  Widget build(BuildContext context) =>
      AspectRatio(
        aspectRatio: widgetAspectRatio,
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double width = constraints.maxWidth;
              final double height = constraints.maxHeight;

              const int padding = 20;
              final double safeWidth = width - 2 * padding;
              final double safeHeight = height - 2 * padding;

              final double heightOfPrimaryCard = safeHeight;
              final double widthOfPrimaryCard =
                  heightOfPrimaryCard * cardAspectRatio;

              final double primaryCardLeft = safeWidth - widthOfPrimaryCard;
              final double horizontalInset = primaryCardLeft / 2;

              final List<Widget> cardList = <Widget>[];

              for (int i = 0; i < images.length; i++) {
                final double delta = i - currentPage;
                final bool isOnRight = delta > 0;

                final double start = padding +
                    max(
                        primaryCardLeft -
                            horizontalInset * -delta * (isOnRight ? 15 : 1),
                        0.0);

                const int verticalInset = 20;

                final Widget cardItem = Positioned.directional(
                  top: padding + verticalInset * max(-delta, 0.0),
                  bottom: padding + verticalInset * max(-delta, 0.0),
                  start: start,
                  textDirection: TextDirection.rtl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(3, 6),
                                blurRadius: 10)
                          ]),
                      child: AspectRatio(
                        aspectRatio: cardAspectRatio,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.asset(images[i], fit: BoxFit.cover),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    child: Text(title[i],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontFamily: 'SF-Pro-Text-Regular')),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 12, bottom: 12),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 22, vertical: 6),
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      child: Text('Read Later',
                                          style: TextStyle(
                                              color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                cardList.add(cardItem);
              }
              return Stack(
                children: cardList,
              );
            }),
      );
}
