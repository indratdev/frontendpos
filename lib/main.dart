import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontendpos/config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => SurahBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => AudiomanagementBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => HadistsBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => FavoriteBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => PrayerBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => CalculatorBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => ArticleBloc(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/splash',        
        initialRoute: Routes.splash,
        routes: Routes().getRoutes,
      ),
    );
  }
}