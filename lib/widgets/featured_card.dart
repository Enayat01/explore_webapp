import 'package:explore_webapp/config/constants.dart';
import 'package:flutter/material.dart';

class FeaturedCard extends StatefulWidget {
  const FeaturedCard({Key? key}) : super(key: key);

  @override
  State<FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  height: screenWidth(context) / 6,
                  width: screenWidth(context) / 3.8,
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
                    top: screenHeight(context) / 70,
                  ),
                  child: Text(
                    featuredCardTitles[pageIndex],
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(context).primaryTextTheme.subtitle1!.color,
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
