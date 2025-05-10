import 'package:flutter/material.dart';
import 'package:frontendpos/config/routes.dart';
import 'package:frontendpos/presentation/screens/settings_screen/about_screen/about_screen.dart';
import 'package:frontendpos/presentation/screens/settings_screen/account_screen/account_screen.dart';
import 'package:frontendpos/presentation/screens/settings_screen/help_support_screen/helpsupport_screen.dart';
import 'package:frontendpos/presentation/screens/settings_screen/notification_screen/notification_screen.dart';
import 'package:frontendpos/presentation/screens/settings_screen/privacy_security_screen/privacy_security_screen.dart';
import 'package:frontendpos/presentation/screens/settings_screen/theme_screen/theme_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuListTileWidget> menuSettings = [
      MenuListTileWidget(
        iconName: Icons.person_outline_sharp,
        title: "Akun",
        routes: AccountScreen(),
      ),
      MenuListTileWidget(
        iconName: Icons.notifications_none,
        title: "Notifikasi",
        routes: NotificationScreen(),
      ),
      MenuListTileWidget(
        iconName: Icons.remove_red_eye_outlined,
        title: "Tema",
        routes: ThemeScreen(),
      ),
       MenuListTileWidget(
        iconName: Icons.lock_outline_rounded,
        title: "Privasi & Keamanan",
        routes: PrivacySecurityScreen(),
      ),
        MenuListTileWidget(
        iconName: Icons.supervised_user_circle_outlined,
        title: "Bantuan dan Layanan",
        routes: HelpAndSupportScreen(),
      ),
        MenuListTileWidget(
        iconName: Icons.help_outline_rounded,
        title: "Tentang",
        routes: AboutScreen(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan"),
        centerTitle: true,
        toolbarHeight: 100.0, // Atur tinggi AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 12, 12, 12),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey.shade300,
            thickness: 0.5, 
          ),
          itemCount: menuSettings.length,
          itemBuilder: (context, index) {
            MenuListTileWidget data = menuSettings[index];
            return MenuListTileWidget(
              iconName: data.iconName,
              title: data.title,
              routes: data.routes,
            );
          },
        ),
      ),
    );
  }
}

class MenuListTileWidget extends StatelessWidget {
  final IconData iconName;
  final String title;
  final Widget routes;

  const MenuListTileWidget({
    super.key,
    required this.iconName,
    required this.title,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: () => Navigator.pushNamed(context, routes),
       onTap: () {
        pushScreenWithoutNavBar(context, routes);
      },
      leading: Icon(iconName),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
