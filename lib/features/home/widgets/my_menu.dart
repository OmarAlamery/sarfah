import 'package:flutter/material.dart';
import '../../../core/networking/firebase_helper.dart';
import '../../../core/theming/fonts.dart';

class MyMenu extends StatelessWidget {
  const MyMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 41, 39, 78),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 31, 29, 68),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    FirebaseHelper().getCurrentUser()?.email ?? 'User',
                    style: FontHelper.font18BoldWhite,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            title: Text(
              'Profile',
              style: FontHelper.font18BoldWhite,
            ),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to profile screen
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Settings',
              style: FontHelper.font18BoldWhite,
            ),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to settings screen
            },
          ),
          const Spacer(),
          Divider(
            color: Colors.white24,
          ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: FontHelper.font18BoldWhite,
            ),
            onTap: () async {
              Navigator.pop(context);
              await FirebaseHelper().logOut();
              // TODO: Navigate to login screen
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
