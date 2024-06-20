import 'package:flutter/material.dart';
import 'package:foodapp/components/my_drawer_tile.dart';
import 'package:foodapp/pages/settings_page.dart';
import 'package:foodapp/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.emoji_food_beverage,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list
          MyDrawerTile(
            text: "HOME",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          //setting list tile
          MyDrawerTile(
            text: "SETTINGS",
            icon: Icons.settings,
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              ),
            },
          ),
          const Spacer(),

          //logout list
          MyDrawerTile(
            text: "LOGOUT",
            icon: Icons.login_outlined,
            onTap: logout,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
