import '../widgets/drawer.dart';
import '../widgets/footer.dart';
import '../widgets/image_carousel.dart';
import '../config/constants.dart';
import '../config/responsive.dart';
import '../widgets/featured_card.dart';
import '../widgets/floating_access_card.dart';
import '../widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _opacity = _scrollPosition < screenHeight(context) * 0.40
        ? _scrollPosition / (screenHeight(context) * 0.40)
        : 1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? mobileAppBar(_opacity)
          : PreferredSize(
              preferredSize: Size(screenWidth(context), 1000),
              child: WebAppBar(_opacity),
            ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                /// image below the top bar (cover image)
                SizedBox(
                  height: screenHeight(context) * 0.45,
                  width: screenWidth(context),
                  child: Image.asset(
                    'assets/images/cover.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    const FloatingAccessCard(),
                    Column(
                      children: [
                        ///Featured heading text row
                        Padding(
                          padding: EdgeInsets.only(
                            top: screenHeight(context) * 0.06,
                            left: screenWidth(context) / 15,
                            right: screenWidth(context) / 15,
                          ),
                          child: ResponsiveWidget.isSmallScreen(context)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(),
                                    const Text(
                                      featuredHeading,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      featuredSubtitle,
                                      textAlign: TextAlign.end,
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      featuredHeading,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 40,
                                      ),
                                    ),
                                    Text(
                                      featuredSubtitle,
                                    ),
                                  ],
                                ),
                        ),
                        const FeaturedCard(),
                      ],
                    ),
                  ],
                )
              ],
            ),

            /// Destinations heading text
            ResponsiveWidget.isSmallScreen(context)
                ? Container(
                    padding: EdgeInsets.only(
                      top: screenHeight(context) / 20,
                      bottom: screenHeight(context) / 20,
                    ),
                    width: screenWidth(context),
                    child: const Text(
                      destinationHeading,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight(context) * .10,
                      bottom: screenHeight(context) * .05,
                    ),
                    child: const Text(
                      destinationHeading,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            const ImageCarousel(),
            SizedBox(height: screenHeight(context) * 0.10),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
