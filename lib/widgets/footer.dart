import '../config/constants.dart';
import 'package:flutter/material.dart';

import '../config/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.blueGrey[900],
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    footerColumnSection(
                      about,
                      contactUs,
                      aboutUs,
                      careers,
                    ),
                    footerColumnSection(
                      help,
                      payment,
                      cancellation,
                      faq,
                    ),
                    footerColumnSection(
                      social,
                      twitter,
                      fb,
                      yt,
                    ),
                  ],
                ),
                const Divider(color: blueGreyColor),
                const SizedBox(height: 20),
                footerRowSection(email, emailDetail),
                const SizedBox(height: 5),
                footerRowSection(address, addressDetail),
                const SizedBox(height: 20),
                const Divider(color: blueGreyColor),
                const SizedBox(height: 20),
                Text(
                  copyrightInfo,
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    footerColumnSection(
                      about,
                      contactUs,
                      aboutUs,
                      careers,
                    ),
                    footerColumnSection(
                      help,
                      payment,
                      cancellation,
                      faq,
                    ),
                    footerColumnSection(
                      social,
                      twitter,
                      fb,
                      yt,
                    ),

                    /// Using this container as a vertical divider
                    Container(
                      color: Colors.blueGrey,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        footerRowSection(email, emailDetail),
                        const SizedBox(height: 5),
                        footerRowSection(address, addressDetail),
                      ],
                    ),
                  ],
                ),
                const Divider(color: Colors.blueGrey),
                const SizedBox(height: 20),
                Text(
                  copyrightInfo,
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}

Widget footerColumnSection(
  String heading,
  String subText1,
  String subText2,
  String subText3,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(
            color: Colors.blueGrey[300],
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subText2,
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subText1,
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subText3,
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

Widget footerRowSection(String title, String detail) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$title: ',
        style: TextStyle(
          color: Colors.blueGrey.shade300,
          fontSize: 16,
        ),
      ),
      Flexible(
        child: FittedBox(
          child: Text(
            detail,
            style: TextStyle(
              color: Colors.blueGrey.shade100,
              fontSize: 16,
            ),
          ),
        ),
      )
    ],
  );
}
