import 'package:flutter/material.dart';
import 'package:frontendpos/presentation/screens/home_screen/menu_screen.dart';
import 'package:frontendpos/presentation/screens/settings_screen/settings_screen.dart';
import 'package:frontendpos/presentation/screens/splash_screen/splash_screen.dart';
import 'package:frontendpos/shared/utils/app_colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Persistent Bottom Navigation Bar Demo',
      home: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: MenuScreen(),
            item: ItemConfig(
              activeForegroundColor: context.cream,
              icon: Icon(Icons.home),
              title: "Beranda",
            ),
          ),
          PersistentTabConfig(
            screen: SplashScreen(),
            item: ItemConfig(
              activeForegroundColor: context.orange, // Warna teks saat aktif
              inactiveForegroundColor:
                  Colors.grey, // Warna teks saat tidak aktif
              // activeBackgroundColor: context.orange, // Warna tombol tetap orange
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.white, // Warna ikon tetap putih
                size: MediaQuery.sizeOf(context).width / 12,
              ),
              title: "Pindai",
            ),
          ),
          PersistentTabConfig(
            screen: SettingsScreen(),
            item: ItemConfig(
              activeForegroundColor: context.cream,
              icon: Icon(Icons.settings),
              title: "Settings",
            ),
          ),
        ],

        navBarBuilder: (navBarConfig) => Style14BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(color: context.blueDeep),
        ),
        // navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        //   navBarConfig: navBarConfig,
        // ),
      ),
    );
  }
}
