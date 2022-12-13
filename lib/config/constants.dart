import 'package:flutter/material.dart';

Color hoveringColor1 = Colors.blue.shade200;
Color hoveringColor2 = Colors.white;
const whiteColor = Colors.white;
const blueColor = Colors.blue;
const blackColor = Colors.black;

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Text of navigation bar
const exploreTitle = 'EXPLORE';
const discover = 'Discover';
const contactUs = 'Contact Us';
const signUp = 'Sign Up';
const login = 'Login';
const featuredHeading = 'Featured';
const featuredSubtitle = 'Unique wildlife tours & destinations';

List<String> floatingCardItems = [
  'Destination',
  'Dates',
  'People',
  'Experience',
];

final List<String> featuredCardTitles = [
  'Trekking',
  'Animals',
  'Photography',
];

final List<String> featuredCardImages = [
  'assets/images/trekking.jpg',
  'assets/images/animals.jpg',
  'assets/images/photography.jpeg',
];
