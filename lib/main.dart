import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio Website",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        canvasColor: kBackgroundColor,
        // textTheme: GoogleFonts.latoTextTheme(),
      ),
      builder: (context, widget) {
        return ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.resize(2460, name: "4K"),
          ],
          background: Container(
            color: kBackgroundColor,
          ),
        );
      },
      home: const Home(),
    );
  }
}
