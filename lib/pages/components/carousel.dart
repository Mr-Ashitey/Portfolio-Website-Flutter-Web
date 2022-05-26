import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'carousel_items.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();

    double _carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? 0.7 : 0.85);
    return SizedBox(
      height: _carouselContainerHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                height: _carouselContainerHeight,
              ),
              items: List.generate(
                  5,
                  (index) => Builder(
                        builder: (BuildContext context) {
                          return Container(
                            constraints: BoxConstraints(
                                minHeight: _carouselContainerHeight),
                            child: ScreenHelper(
                              desktop: _buildDesktop(
                                  context,
                                  carouselItems[index].text!,
                                  carouselItems[index].image!),
                              tablet: _buildTablet(
                                context,
                                carouselItems[index].text!,
                                carouselItems[index].image!,
                              ),
                              mobile: _buildMobile(
                                context,
                                carouselItems[index].text!,
                                carouselItems[index].image!,
                              ),
                            ),
                          );
                        },
                      )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Big screens
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
        minWidth: 1000.0,
        maxWidth: 1000.0,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(child: text),
            Expanded(child: image),
          ],
        )),
  );
}

// Mid screens
Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
        minWidth: 760.0,
        maxWidth: 760.0,
        defaultScale: false,
        child: Row(
          children: [
            Expanded(child: text),
            Expanded(child: image),
          ],
        )),
  );
}

// Small screens
Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    width: double.infinity,
    constraints:
        BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
    child: text,
  );
}
