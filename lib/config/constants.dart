import 'package:flutter/material.dart';

Color hoveringColor1 = Colors.blue.shade200;
Color hoveringColor2 = Colors.white;
const whiteColor = Colors.white;
const blueColor = Colors.blue;
const blackColor = Colors.black;
const blueGreyColor = Colors.blueGrey;

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Text used on homepage
const exploreTitle = 'EXPLORE';
const discover = 'Discover';
const contactUs = 'Contact Us';
const signUp = 'Sign Up';
const login = 'Login';
const featuredHeading = 'Featured';
const featuredSubtitle = 'Unique wildlife tours & destinations';
const destinationHeading = 'Destinations diversity';
const about = 'ABOUT';
const aboutUs = 'About Us';
const careers = 'Careers';
const help = 'HELP';
const payment = 'Payment';
const cancellation = 'Cancellation';
const faq = 'FAQ';
const social = 'SOCIAL';
const twitter = 'Twitter';
const fb = 'Facebook';
const yt = 'YouTube';
const email = 'Email';
const emailDetail = 'contact@explore.com';
const address = 'Address';
const addressDetail = '128, Trynor Road, Delta, MN - 56124';
const copyrightInfo = 'Copyright © 2022 | EXPLORE';

List<String> floatingCardItems = [
  'Destination',
  'Dates',
  'People',
  'Experience',
];

List<IconData> floatingCardIcons = [
  Icons.location_on,
  Icons.date_range,
  Icons.people,
  Icons.wb_sunny
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

final List<String> destinationImages = [
  'assets/images/asia.jpg',
  'assets/images/africa.jpg',
  'assets/images/europe.jpg',
  'assets/images/south_america.jpg',
  'assets/images/australia.jpg',
  'assets/images/antarctica.jpg',
];

final List<String> placesList = [
  'ASIA',
  'AFRICA',
  'EUROPE',
  'SOUTH AMERICA',
  'AUSTRALIA',
  'ANTARCTICA',
];
