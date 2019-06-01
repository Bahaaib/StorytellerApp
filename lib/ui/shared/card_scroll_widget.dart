import 'dart:math';

import 'package:flutter/material.dart';
import 'package:storyteller/data.dart';

///Card Scroll Widget class
@immutable
class CardScrollWidget extends StatelessWidget {
  ///Public constructor
  const CardScrollWidget(this.currentPage);

  ///Current Page index
  final double currentPage;

  @override
  Widget build(BuildContext context) {
    ///Card Aspect Ratio
    const double cardAspectRatio = 12.0 / 16.0;

    ///Widget Aspect Ratio
    const double widgetAspectRatio = cardAspectRatio * 1.2;

    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double width = constraints.maxWidth;
            final double height = constraints.maxHeight;

            const int padding = 20;
            final double safeWidth = width - 2 * padding;
            final double safeHeight = height - 2 * padding;

            final double heightOfPrimaryCard = safeHeight;
            final double widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

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
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Text('Read Later',
                                        style: TextStyle(color: Colors.white)),
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
}
