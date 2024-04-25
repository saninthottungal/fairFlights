import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/auth_provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          CustomDrawerHeader(),
          CustomDrawerItem(
            iconData: Icons.settings,
            text: "Settings",
          ),
          CustomDrawerItem(
            iconData: Icons.help_outline,
            text: 'Support',
          ),
          CustomDrawerItem(
            iconData: Icons.question_answer_outlined,
            text: 'FAQ',
          ),
          CustomDrawerItem(
            iconData: Icons.star,
            text: 'Rate this app',
          ),
          CustomDrawerItem(
            iconData: Icons.share,
            text: 'Share',
          ),
          CustomDrawerItem(
            iconData: Icons.priority_high_outlined,
            text: 'About Us',
          ),
        ],
      ),
    );
  }
}

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/images/bluebg.jpg",
        ),
        fit: BoxFit.fill,
      )),
      padding: const EdgeInsets.only(top: 105, bottom: 10, left: 30, right: 30),
      child: CupertinoButton(
        pressedOpacity: 0.9,
        onPressed: () async {
          authProvider.userCurrentState == UserState.loggedOut
              ? Navigator.of(context).pushNamed('/auth')
              : await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: const Text(
                        "Logout",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      content: const Text("Do you really want to logout?"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Cancel")),
                        ElevatedButton(
                            onPressed: () async {
                              Navigator.of(ctx).pop();
                              await authProvider.signOut();
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(color: Colors.red.shade400),
                            ))
                      ],
                    );
                  });
        },
        color: Colors.white,
        child: Text(
          authProvider.userCurrentState == UserState.loggedOut
              ? "LOGIN"
              : 'LOGOUT',
          style: TextStyle(
            color: authProvider.user == null
                ? Colors.black54
                : Colors.red.shade500,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem(
      {super.key, required this.iconData, required this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 28,
            color: const Color.fromARGB(255, 109, 109, 109),
          ),
          const SizedBox(width: 30),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 109, 109, 109),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
