import 'package:flutter/material.dart';

class ScreenHelper extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenHelper({Key? key, this.desktop, this.mobile, this.tablet})
      : super(key: key);

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800.0;
  }

  static bool isTablet(BuildContext context) {
    // print("Tablet" + MediaQuery.of(context).size.width.toString());
    return MediaQuery.of(context).size.width >= 800.0 &&
        MediaQuery.of(context).size.width < 1200.0;
  }

  static bool isDesktop(BuildContext context) {
    // print("Desktop" + MediaQuery.of(context).size.width.toString());
    return MediaQuery.of(context).size.width >= 1200.0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 800.0) {
          return mobile!;
        }
        if (constraints.maxWidth >= 800 && constraints.maxWidth < 1200.0) {
          return tablet!;
        }
        return desktop!;
      },
    );
  }
}
