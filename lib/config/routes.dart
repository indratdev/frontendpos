import 'package:flutter/material.dart';
import 'package:frontendpos/presentation/screens/login_screen/login_option_screen.dart';
import 'package:frontendpos/presentation/screens/login_screen/login_screen.dart';
import 'package:frontendpos/presentation/screens/splash_screen/splash_screen.dart';
// import 'package:kita_muslim/presentation/screens/article_screen/article_screen.dart';
// import 'package:kita_muslim/presentation/screens/calculator_screen/calculator_screen.dart';
// import 'package:kita_muslim/presentation/screens/favorite_screens/favorite_screen.dart';
// import 'package:kita_muslim/presentation/screens/hadist_screen/hadistSRscreen.dart';
// import 'package:kita_muslim/presentation/screens/hadist_screen/hadist_detail_screen.dart';

// import 'package:kita_muslim/presentation/screens/hadist_screen/hadistscreen.dart';
// import 'package:kita_muslim/presentation/screens/home_screen/home_screen_v2.dart';
// import 'package:kita_muslim/presentation/screens/prayer_schedule_screen/prayer_schedule_screen.dart';

// import 'package:kita_muslim/presentation/screens/qiblah_screen/qiblah_screen.dart';
// import 'package:kita_muslim/presentation/screens/quran_screen/quran_screen.dart';
// import 'package:kita_muslim/presentation/screens/splash_screen/splashscreen.dart';
// import 'package:kita_muslim/presentation/screens/surah_daily/surah_daily_screen.dart';
// import 'package:kita_muslim/presentation/screens/surah_detail/surahdetail_screen.dart';
// import 'package:kita_muslim/presentation/screens/surah_daily/surah_daily_detail_screen.dart';

class Routes {
  static const String splash = "/splash";
  static const String loginOption = "/loginOption";
  static const String login = "/login";

  Map<String, WidgetBuilder> getRoutes = {
    splash: (_) => const SplashScreen(),
    loginOption: (_) => const LoginOptionScreen(),
     login: (_) =>  LoginScreen(),
  };
}
