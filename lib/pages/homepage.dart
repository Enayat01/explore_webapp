import '../config/constants.dart';
import '../widgets/featured_card.dart';
import '../widgets/floating_access_card.dart';
import '../widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomTopBar(),
      body: SingleChildScrollView(
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
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: screenHeight(context) * 0.06,
                              left: screenWidth(context) / 15,
                              right: screenWidth(context) / 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ),
                        const FeaturedCard(),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
