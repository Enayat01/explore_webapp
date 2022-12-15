import '../config/constants.dart';
import '../config/responsive.dart';
import 'package:flutter/material.dart';

class FeaturedCard extends StatefulWidget {
  const FeaturedCard({Key? key}) : super(key: key);

  @override
  State<FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(
              top: screenHeight(context) * 0.02,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenWidth(context) / 15),
                  ...Iterable<int>.generate(featuredCardImages.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenWidth(context) / 2.5,
                              width: screenWidth(context) / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  featuredCardImages[pageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenHeight(context) / 70,
                              ),
                              child: Text(
                                featuredCardTitles[pageIndex],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenWidth(context) / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenHeight(context) * 0.06,
              left: screenWidth(context) / 15,
              right: screenWidth(context) / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(featuredCardImages.length).map(
                  (int pageIndex) => Column(
                    children: [
                      SizedBox(
                        height: screenWidth(context) * 0.15,
                        width: screenWidth(context) * 0.25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            featuredCardImages[pageIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: screenHeight(context) / 40,
                        ),
                        child: Text(
                          featuredCardTitles[pageIndex],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .subtitle1!
                                .color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
