import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/list_items.dart';
import 'package:portfolio_website/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class PortfolioStats extends StatelessWidget {
  const PortfolioStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
          builder: (BuildContext _context, BoxConstraints constraints) {
        return Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          children: ListItems.stats.map(
            (stat) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                width: MediaQuery.of(context).size.width < 600
                    ? constraints.maxWidth / 2.0 - 20
                    : constraints.maxWidth / 4.0 - 20,
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      stat.count!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 32.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      stat.text!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: kCaptionColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        );
      }),
    );
  }
}
