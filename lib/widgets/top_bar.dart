import 'package:flutter/material.dart';

import '../config/constants.dart';

class CustomTopBar extends StatefulWidget {
  const CustomTopBar(this.opacity, {Key? key}) : super(key: key);
  final double opacity;

  @override
  State<CustomTopBar> createState() => _CustomTopBarState();
}

class _CustomTopBarState extends State<CustomTopBar> {
  final List<bool> _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(screenWidth(context), 1000),
      child: Container(
        color: Colors.blueGrey.shade900.withOpacity(widget.opacity),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Text(
                exploreTitle,
                style: TextStyle(
                  color: Colors.blueGrey.shade100,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: screenWidth(context) / 8),
                    InkWell(
                      onTap: () {},
                      onHover: (value) {
                        setState(() {
                          _isHovering[0] = value;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            discover,
                            style: TextStyle(
                              color:
                                  _isHovering[0] ? hoveringColor1 : whiteColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // For showing an underline on hover
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[0],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth(context) / 20),
                    InkWell(
                      onTap: () {},
                      onHover: (value) {
                        setState(() {
                          _isHovering[1] = value;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            contactUs,
                            style: TextStyle(
                              color:
                                  _isHovering[1] ? hoveringColor1 : whiteColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // For showing an underline on hover
                          Visibility(
                            maintainAnimation: true,
                            maintainState: true,
                            maintainSize: true,
                            visible: _isHovering[1],
                            child: Container(
                              height: 2,
                              width: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    _isHovering[2] = value;
                  });
                },
                child: Text(
                  signUp,
                  style: TextStyle(
                    color: _isHovering[2] ? hoveringColor1 : whiteColor,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth(context) / 50,
              ),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    _isHovering[3] = value;
                  });
                },
                child: Text(
                  login,
                  style: TextStyle(
                      color: _isHovering[3] ? hoveringColor1 : whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
