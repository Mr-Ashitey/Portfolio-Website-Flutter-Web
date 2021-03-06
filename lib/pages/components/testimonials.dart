import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:portfolio_website/utils/list_items.dart';
import 'package:portfolio_website/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Testimonials extends StatelessWidget {
  const Testimonials({Key? key}) : super(key: key);

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
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "TESTIMONIALS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 5.0),
                Container(
                  constraints: const BoxConstraints(maxWidth: 400.0),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "This is the portfolio section. There is alot of work here",
                          style: TextStyle(color: Colors.white, height: 1.8),
                        ),
                        TextSpan(
                            text: " click here to contact us",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              height: 1.8,
                            )),
                        TextSpan(
                          text: ". Please subscribe to me youtube channel :-)",
                          style: TextStyle(color: Colors.white, height: 1.8),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 45.0),
                Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  // Lets map
                  children: ListItems.testimonials.map((testimonial) {
                    return Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/quote.png",
                              width: 50.0,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              testimonial.text!,
                              style: const TextStyle(
                                color: kCaptionColor,
                                height: 1.8,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                    testimonial.profilePhoto!,
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      testimonial.personName!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      testimonial.occupation!,
                                      style: const TextStyle(
                                        color: kCaptionColor,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
