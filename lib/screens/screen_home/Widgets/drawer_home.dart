import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/core/widgets/custom_utilities.dart';
import 'package:flight_booking/providers/auth_service_provider/auth_service_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const CustomDrawerHeader(),
          const CustomDrawerItem(
            iconData: Icons.settings,
            text: "Settings",
          ),
          const CustomDrawerItem(
            iconData: Icons.help_outline,
            text: 'Support',
          ),
          const CustomDrawerItem(
            iconData: Icons.question_answer_outlined,
            text: 'FAQ',
          ),
          const CustomDrawerItem(
            iconData: Icons.star,
            text: 'Rate this app',
          ),
          const CustomDrawerItem(
            iconData: Icons.share,
            text: 'Share',
          ),
          CustomDrawerItem(
            iconData: Icons.priority_high_outlined,
            text: 'About Us',
            onTap: () {
              Navigator.of(context).pushNamed('/privacy');
            },
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
    final authProvider = Provider.of<AuthServiceProvider>(context);
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
                        "Login Details",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      content: Text(
                        "logged in as ${authProvider.userMail}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Cancel")),
                        authProvider.userCurrentState ==
                                UserState.loggedInEmailNotVerified
                            ? ElevatedButton(
                                onPressed: () async {
                                  CustomUtilities.showBlankDialogue(context);
                                  final message = await authProvider
                                      .sendEmailVerification();
                                  if (context.mounted) Navigator.pop(context);
                                  if (message != null) {
                                    if (context.mounted) Navigator.pop(ctx);

                                    if (context.mounted) {
                                      CustomUtilities.showSnackBar(
                                          context: context, message: message);
                                      return;
                                    }
                                  }
                                  if (context.mounted) {
                                    Navigator.of(context).pushNamed('/mail');
                                  }
                                },
                                child: const Text("Verify mail"))
                            : const SizedBox(
                                height: 0,
                                width: 0,
                              ),
                        ElevatedButton(
                            onPressed: () async {
                              Navigator.of(ctx).pop();

                              final message = await authProvider.signOut();
                              if (message != null) {
                                if (context.mounted) {
                                  CustomUtilities.showSnackBar(
                                      context: context, message: message);
                                }
                                return;
                              }
                              final messageFromGoogle =
                                  await authProvider.signOutFromGoogle();
                              if (messageFromGoogle != null) {
                                if (context.mounted) {
                                  CustomUtilities.showSnackBar(
                                      context: context,
                                      message: messageFromGoogle);
                                }
                                return;
                              }
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(color: Colors.red.shade400),
                            )),
                      ],
                    );
                  });
        },
        color: Colors.white,
        child: Text(
          authProvider.userCurrentState == UserState.loggedOut
              ? "LOGIN"
              : 'LOGGED IN',
          style: TextStyle(
            color: authProvider.user == null
                ? Colors.black54
                : AppColor.customBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem(
      {super.key, required this.iconData, required this.text, this.onTap});

  final IconData iconData;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
