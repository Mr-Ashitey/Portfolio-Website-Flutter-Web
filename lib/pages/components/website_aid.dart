import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class WebsiteAid extends StatelessWidget {
  const WebsiteAid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(context, kDesktopMaxWidth),
      tablet: _buildUi(context, kTabletMaxWidth),
      mobile: _buildUi(context, getMobileMaxWidth(context)),
    );
  }
}

Widget _buildUi(BuildContext context, double width) {
  print(MediaQuery.of(context).size.width * .8);
  return Center(
    child: LayoutBuilder(
      builder: (context, constraints) {
        return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Flex(
            direction:
                constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
            children: [
              // Disable expanded on smaller screen to avoid Render errors by setting flex to 0

              Expanded(
                flex: constraints.maxWidth > 720.0 ? 1 : 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "WEBSITE",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      "EVOLVING NAGA\nRESORT WEBSITE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        height: 1.3,
                        fontSize: 35.0,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "This is a random text about the project, I should have used the regular lorem ipsum text, but I am too lazy to search for that. This should be long enough",
                      style: TextStyle(
                        color: kCaptionColor,
                        height: 1.5,
                        fontSize: 15.0,
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            height: 48.0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28.0,
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: const Center(
                                child: Text(
                                  "EXPLORE MORE",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: kPrimaryColor),
                            ),
                            height: 48.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: TextButton(
                              onPressed: () {},
                              child: const Center(
                                child: Text(
                                  "NEXT APP",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 70.0),
                  ],
                ),
              ),
              const SizedBox(width: 25.0),
              Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: Image.asset(
                    "assets/laptop.png",
                    // Set width for image on smaller screen
                    width: constraints.maxWidth > 720.0 ? null : 350.0,
                  )),
            ],
          ),
        );
      },
    ),
  );
}
