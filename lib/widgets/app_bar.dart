import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:explore_webapp/widgets/sign_in_dialog.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';

AppBar mobileAppBar(double opacity) {
  return AppBar(
    backgroundColor: Colors.blueGrey.shade900.withOpacity(opacity),
    elevation: 0,
    centerTitle: true,
    title: Text(
      'EXPLORE',
      style: TextStyle(
        color: Colors.blueGrey.shade100,
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 3,
      ),
    ),
    actions: [
      EasyDynamicThemeBtn(),
    ],
  );
}

class WebAppBar extends StatefulWidget {
  const WebAppBar(this.opacity, {Key? key}) : super(key: key);
  final double opacity;

  @override
  State<WebAppBar> createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  final List<bool> _isHovering = [false, false, false];

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
              EasyDynamicThemeBtn(),
              SizedBox(
                width: screenWidth(context) / 50,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const SignInDialog(),
                  );
                },
                onHover: (value) {
                  setState(() {
                    _isHovering[2] = value;
                  });
                },
                child: Text(
                  signIn,
                  style: TextStyle(
                      color: _isHovering[2] ? hoveringColor1 : whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
