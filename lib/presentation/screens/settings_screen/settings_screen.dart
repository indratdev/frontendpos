import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuListTileWidget> menuSettings = [
      MenuListTileWidget(
        iconName: Icons.person_outline_sharp,
        title: "Akun",
        routes: "",
      ),
      MenuListTileWidget(
        iconName: Icons.notifications_none,
        title: "Notifikasi",
        routes: "",
      ),
      MenuListTileWidget(
        iconName: Icons.remove_red_eye_outlined,
        title: "Tema",
        routes: "",
      ),
       MenuListTileWidget(
        iconName: Icons.lock_outline_rounded,
        title: "Privasi & Keamanan",
        routes: "",
      ),
        MenuListTileWidget(
        iconName: Icons.supervised_user_circle_outlined,
        title: "Bantuan dan Layanan",
        routes: "",
      ),
        MenuListTileWidget(
        iconName: Icons.help_outline_rounded,
        title: "Tentang",
        routes: "",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan"),
        centerTitle: true,
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
  final String routes;

  const MenuListTileWidget({
    super.key,
    required this.iconName,
    required this.title,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, routes),
      leading: Icon(iconName),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
