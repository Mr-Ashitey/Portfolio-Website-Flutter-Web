import 'package:flutter/material.dart';
import 'package:portfolio_website/model/header_item.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/globals.dart';

List<HeaderItem> headerItems = [
  HeaderItem(
    title: "Home",
    onTap: () {},
  ),
  HeaderItem(
    title: "About",
    onTap: () {},
  ),
  HeaderItem(
    title: "Projects",
    onTap: () {},
  ),
  HeaderItem(
    title: "Contact",
    onTap: () {},
  ),
  HeaderItem(
    title: "Hire Me",
    onTap: () {},
    isButton: true,
  ),
];

Widget _buildHeaderLogo() {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        debugPrint("Logo pressed");
      },
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: "M",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: ".",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildHeaderRow() {
  return ResponsiveVisibility(
    visible: false,
    visibleWhen: [Condition.largerThan(name: MOBILE)],
    child: Row(
      children: headerItems
          .map((item) => item.isButton!
              ? MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kDangerColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: TextButton(
                      onPressed: item.onTap,
                      child: Text(
                        item.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ))
              : MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    margin: const EdgeInsets.only(right: 30.0),
                    child: GestureDetector(
                      onTap: item.onTap,
                      child: Text(
                        item.title!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )))
          .toList(),
    ),
  );
}

Container _buildHeader() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildHeaderLogo(),
        _buildHeaderRow(),
      ],
    ),
  );
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: _buildHeader(),
      ),
      mobile: _buildHeaderMobile(),
      tablet: _buildHeader(),
    );
  }
}

Widget _buildHeaderMobile() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderLogo(),

          // Lets make a scaffold key and create a drawer
          GestureDetector(
            onTap: () => Globals.scaffoldKey.currentState?.openEndDrawer(),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 28.0,
            ),
          ),
        ],
      ),
    ),
  );
}
