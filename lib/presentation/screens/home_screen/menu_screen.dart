import 'package:flutter/material.dart';
import 'package:frontendpos/config/routes.dart';
import 'package:frontendpos/presentation/screens/dashboard_screen/dashboard_screen.dart';
import 'package:frontendpos/presentation/screens/master_screen/master_screen.dart';
import 'package:frontendpos/shared/utils/app_textSizes.dart';
import 'package:frontendpos/shared/utils/constants.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  final List<MenuItemWidget> menus = [
    MenuItemWidget(
      title: "Transaksi",
      imageName: Constants.transactionIcon,
      screenName: DashboardScreen(),
    ),
    MenuItemWidget(
      title: "Dashboard",
      imageName: Constants.transactionIcon,
      screenName: DashboardScreen(),
    ),
    MenuItemWidget(
      title: "Laporan",
      imageName: Constants.transactionIcon,
      screenName: DashboardScreen(),
    ),
    MenuItemWidget(
      title: "Master",
      imageName: Constants.transactionIcon,
      screenName: MasterScreen(),
    ),
    MenuItemWidget(
      title: "Pelanggan",
      imageName: Constants.transactionIcon,
      screenName: DashboardScreen(),
    ),
    MenuItemWidget(
      title: "Pengaturan",
      imageName: Constants.transactionIcon,
      screenName: DashboardScreen(),
    ),
    MenuItemWidget(
      title: "Manajemen Pengguna",
      imageName: Constants.transactionIcon,
      screenName: DashboardScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Menu")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 3 / 3,
          ),
          itemCount: menus.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: menus[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final String title;
  final String imageName;
  final Widget screenName;

  const MenuItemWidget({
    super.key,
    required this.title,
    required this.imageName,
    required this.screenName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.pushNamed(context, routeName),
      onTap: () {
        pushScreenWithoutNavBar(context, screenName);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageName,
            height: MediaQuery.of(context).size.width / 5,
            fit: BoxFit.contain,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 70),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppTextSizes.large(context),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
