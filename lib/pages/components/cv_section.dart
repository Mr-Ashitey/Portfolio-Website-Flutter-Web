import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/all_items.dart';
import 'package:portfolio_website/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/constants.dart';

class CvSection extends StatelessWidget {
  const CvSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "BETTER DESIGN,\nBETTER EXPERIENCES",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 18.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "DOWNLOAD CV",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            LayoutBuilder(
              builder: (_context, constraints) {
                return ResponsiveGridView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                              ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 2.0
                          : 250.0,
                      // Hack to adjust child height
                      childAspectRatio: ScreenHelper.isDesktop(context)
                          ? 1
                          : MediaQuery.of(context).size.aspectRatio * 1.5),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              ListItems.designProcess[index].imagePath!,
                              width: 40.0,
                            ),
                            const SizedBox(width: 15.0),
                            Text(
                              ListItems.designProcess[index].title!,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Text(
                          ListItems.designProcess[index].subtitle!,
                          style: const TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 14.0,
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: ListItems.designProcess.length,
                );
              },
            ),
          ],
        ));
  }
}
