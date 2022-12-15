import 'package:explore_webapp/widgets/sign_in_dialog.dart';
import 'package:flutter/material.dart';

import '../config/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.blueGrey.shade900,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const SignInDialog(),
                      );
                    },
                    child: const Text(
                      signIn,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: Colors.blueGrey.shade400,
                    thickness: 2,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    discover,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: Colors.blueGrey.shade400,
                    thickness: 2,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    contactUs,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: Colors.blueGrey.shade400,
                    thickness: 2,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      copyrightInfo,
                      style: TextStyle(
                        color: Colors.blueGrey.shade300,
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
