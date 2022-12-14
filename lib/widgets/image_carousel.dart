import 'package:carousel_slider/carousel_slider.dart';

import '../config/constants.dart';
import 'package:flutter/material.dart';

import '../config/responsive.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final CarouselController _controller = CarouselController();
  final List _isHovering = [false, false, false, false, false, false, false];
  final List _isSelected = [true, false, false, false, false, false, false];
  int _currentIndex = 0;

  List<Widget> generateImageTiles() {
    return destinationImages
        .map(
          (element) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              element,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final imageItems = generateImageTiles();
    return Stack(
      children: [
        CarouselSlider(
          items: imageItems,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 18 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
                for (int itemIndex = 0;
                    itemIndex < imageItems.length;
                    itemIndex++) {
                  if (itemIndex == index) {
                    _isSelected[itemIndex] = true;
                  } else {
                    _isSelected[itemIndex] = false;
                  }
                }
              });
            },
          ),
          carouselController: _controller,
        ),

        /// Text in the image
        AspectRatio(
          aspectRatio: 18 / 9,
          child: Center(
            child: Text(
              placesList[_currentIndex],
              style: TextStyle(
                fontSize: screenWidth(context) * .04,
                fontFamily: 'Electrolize',
                letterSpacing: 8,
              ),
            ),
          ),
        ),

        /// Bottom floating card
        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : AspectRatio(
                aspectRatio: 17 / 9,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context) / 7,
                    ),
                    child: FittedBox(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight(context) * .02,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int item = 0;
                                  item < placesList.length;
                                  item++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[item] = true
                                              : _isHovering[item] = false;
                                        });
                                      },
                                      onTap: () {
                                        _controller.animateToPage(item);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight(context) / 80,
                                            bottom: screenHeight(context) / 90,
                                            right: 10,
                                            left: 10),
                                        child: Text(
                                          placesList[item],
                                          style: TextStyle(
                                            color: _isHovering[item]
                                                ? Colors.blueGrey[900]
                                                : Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ),

                                    ///  Underline to highlight the option that is selected
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[item],
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        opacity: _isSelected[item] ? 1 : 0,
                                        child: Container(
                                          height: 5,
                                          decoration: const BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          width: screenWidth(context) * 0.10,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
