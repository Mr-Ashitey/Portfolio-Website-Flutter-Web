import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/list_items.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth),
      tablet: _buildUi(kTabletMaxWidth),
      mobile: _buildUi(getMobileMaxWidth(context)),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Image.asset(
                    "assets/person_small.png",
                    width: 300.0,
                  ),
                ),
                const SizedBox(width: 50.0),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "SKILLS",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "This is all the skills listed below more will be added in due time. This is all the skills listed below more will be added in due time.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Column(
                        children: ListItems.skills
                            .map(
                              (skill) => Container(
                                margin: const EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: skill.percentage!,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        alignment: Alignment.centerLeft,
                                        height: 38.0,
                                        color: Colors.white,
                                        child: Text(skill.skill!),
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      // remaining (blank part)
                                      flex: 100 - skill.percentage!,
                                      child: const Divider(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      "${skill.percentage}%",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
