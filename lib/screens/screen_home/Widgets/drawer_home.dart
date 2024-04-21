import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          "assets/bluebg.jpg",
        ),
        fit: BoxFit.fill,
      )),
      padding: const EdgeInsets.only(top: 105, bottom: 10, left: 30, right: 30),
      //  margin: EdgeInsets.all(0),
      child: CupertinoButton(
        pressedOpacity: 0.9,
        //alignment: Alignment.bottomCenter,
        onPressed: () {},
        color: Colors.white,

        child: const Text(
          "LOGIN",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
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
