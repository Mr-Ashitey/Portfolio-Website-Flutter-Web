import 'package:flutter/material.dart';
import 'package:portfolio_website/pages/components/footer.dart';
import 'package:portfolio_website/pages/components/skill_section.dart';
import 'package:portfolio_website/pages/components/testimonials.dart';
import 'package:portfolio_website/utils/globals.dart';
import 'package:portfolio_website/utils/list_items.dart';

import '../../utils/constants.dart';
import 'components/carousel.dart';
import 'components/cv_section.dart';
import 'components/education_section.dart';
import 'components/header.dart';
import 'components/ios_app_ad.dart';
import 'components/portfolio_stats.dart';
import 'components/sponsors.dart';
import 'components/website_aid.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListItems.headerItems[index].isButton!
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kDangerColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: TextButton(
                              onPressed: ListItems.headerItems[index].onTap,
                              child: Text(
                                ListItems.headerItems[index].title!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : ListTile(
                          title: Text(
                            ListItems.headerItems[index].title!,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10.0);
                },
                itemCount: ListItems.headerItems.length),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(),
            Carousel(),
            SizedBox(height: 20.0),
            CvSection(),
            IosAppAd(),
            SizedBox(height: 70.0),
            WebsiteAid(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 28.0),
              child: PortfolioStats(),
            ),
            EducationSection(),
            SizedBox(height: 50.0),
            SkillSection(),
            SizedBox(height: 50.0),
            Sponsors(),
            SizedBox(height: 50.0),
            Testimonials(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
