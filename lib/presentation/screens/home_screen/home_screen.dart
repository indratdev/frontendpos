import 'package:flutter/material.dart';
import 'package:frontendpos/presentation/screens/home_screen/menu_screen.dart';
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
      title: 'Persistent Bottom Navigation Bar Demo',
      home: PersistentTabView(
        // backgroundColor: Colors.red,
        // hideNavigationBar: true,
        tabs: [
          PersistentTabConfig(
            screen: MenuScreen(),
            item: ItemConfig(
              icon: Icon(Icons.home),
              title: "Beranda",
            ),
          ),
          PersistentTabConfig(
            screen: SplashScreen(),
            item: ItemConfig(
              // activeForegroundColor: AppColors.blue,
              // activeColorSecondary: Colors.green,
              // iconSize: 30,

              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: MediaQuery.sizeOf(context).width / 12,
              ),
              title: "Pindai",
            ),
          ),
          PersistentTabConfig(
            screen: SplashScreen(),
            item: ItemConfig(
              icon: Icon(Icons.settings),
              title: "Settings",
            ),
          ),
        ],

        navBarBuilder: (navBarConfig) =>
            Style14BottomNavBar(navBarConfig: navBarConfig),
        // navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        //   navBarConfig: navBarConfig,
        // ),
      ),
    );
  }
}
