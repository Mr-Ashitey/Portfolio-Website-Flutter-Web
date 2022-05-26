import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/list_items.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../utils/constants.dart';
import '../../utils/screen_helper.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: ResponsiveWrapper(
        minWidth: width,
        maxWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Wrap(
              runSpacing: 50.0,
              spacing: 50.0,
              children: ListItems.sponsorsLogo
                  .map(
                    (logo) => Container(
                      height: 20.0,
                      constraints: BoxConstraints(
                        // max of 3 per row when on mobile and 5 per row on bigger screens
                        maxWidth: ScreenHelper.isMobile(context)
                            ? constraints.maxWidth / 3.0 - 50.0
                            : constraints.maxWidth / 5.0 - 50.0,
                      ),
                      child: Image.asset(logo),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
