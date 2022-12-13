import 'package:flutter/material.dart';

import '../config/constants.dart';

class FloatingAccessCard extends StatefulWidget {
  const FloatingAccessCard({Key? key}) : super(key: key);

  @override
  State<FloatingAccessCard> createState() => _FloatingAccessCardState();
}

class _FloatingAccessCardState extends State<FloatingAccessCard> {
  List<Widget> rowElements = [];
  final List _isHovering = [false, false, false, false];

  List<Widget> generateRowElements() {
    rowElements.clear();
    for (int i = 0; i < floatingCardItems.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Text(
          floatingCardItems[i],
          style: TextStyle(
            color: _isHovering[i]
                ? Theme.of(context).primaryTextTheme.button!.decorationColor
                : Theme.of(context).primaryTextTheme.button!.color,
          ),
        ),
      );
      Widget spacer = SizedBox(
        height: screenHeight(context) / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );
      rowElements.add(elementTile);
      if (i < floatingCardItems.length - 1) {
        rowElements.add(spacer);
      }
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      /// floating quick access bar at the bottom of cover image
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight(context) * 0.40,
          left: screenWidth(context) / 5,
          right: screenWidth(context) / 5,
        ),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight(context) / 50,
              bottom: screenHeight(context) / 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: generateRowElements(),
            ),
          ),
        ),
      ),
    );
  }
}
