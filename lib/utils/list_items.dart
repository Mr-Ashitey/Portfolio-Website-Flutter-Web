import '../model/design_process.dart';
import '../model/education.dart';
import '../model/footer_item.dart';
import '../model/header_item.dart';
import '../model/skill.dart';
import '../model/stat.dart';
import '../model/testimonial.dart';

class ListItems {
  static final List<DesignProcess> designProcess = [
    DesignProcess(
      title: "DESIGN",
      imagePath: "assets/design.png",
      subtitle:
          "A full stack allround designer thay may or may not include a guide for specific creative",
    ),
    DesignProcess(
      title: "DEVELOP",
      imagePath: "assets/develop.png",
      subtitle:
          "A full stack allround developer thay may or may not include a guide for specific creative",
    ),
    DesignProcess(
      title: "WRITE",
      imagePath: "assets/write.png",
      subtitle:
          "A full stack allround writer thay may or may not include a guide for specific creative",
    ),
    DesignProcess(
      title: "PROMOTE",
      imagePath: "assets/promote.png",
      subtitle:
          "A full stack allround promoter thay may or may not include a guide for specific creative",
    ),
  ];

  static final List<Education> educationList = [
    Education(
      description:
          "This is a sample education and details about it is stated below. This is a sample education and details about it is stated below",
      linkName: "www.flutterpanda.com",
      period: "2019 - PRESENT",
    ),
    Education(
      description:
          "This is a sample education and details about it is stated below.This is a sample education and details about it is stated below",
      linkName: "www.flutterpanda.com",
      period: "2018 - 2019",
    ),
    Education(
      description:
          "This is a sample education and details about it is stated below. This is a sample education and details about it is stated below",
      linkName: "www.flutterpanda.com",
      period: "2017 - 2018",
    ),
    Education(
      description:
          "This is a sample education and details about it is stated below. This is a sample education and details about it is stated below",
      linkName: "www.flutterpanda.com",
      period: "2016 - 2017",
    ),
  ];

  static final List<FooterItem> footerItems = [
    FooterItem(
      iconPath: "assets/mappin.png",
      title: "ADDRESS",
      text1: "999 Carter Street",
      text2: "Sailor Springs, IL 64234",
    ),
    FooterItem(
      iconPath: "assets/phone.png",
      title: "PHONE",
      text1: "+1 618-689-9604",
      text2: "+1 781-689-9632",
    ),
    FooterItem(
      iconPath: "assets/email.png",
      title: "EMAIL",
      text1: "hello@example.com",
      text2: "info@flutterpanda.com",
    ),
    FooterItem(
      iconPath: "assets/whatsapp.png",
      title: "WHATSAPP",
      text1: "+234 901-134-0095",
      text2: "+234 901-134-0095",
    )
  ];
  static List<HeaderItem> headerItems = [
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
  static final List<Stat> stats = [
    Stat(count: "43", text: "Clients"),
    Stat(count: "68+", text: "Projects"),
    Stat(count: "17", text: "Awards"),
    Stat(count: "10", text: "Years\nExperience"),
  ];

  static List<Skill> skills = [
    Skill(
      skill: "Dart",
      percentage: 62,
    ),
    Skill(
      skill: "Javascript",
      percentage: 80,
    ),
    Skill(
      skill: "PHP",
      percentage: 78,
    ),
    Skill(
      skill: "Python",
      percentage: 90,
    ),
    Skill(
      skill: "GoLang",
      percentage: 40,
    ),
  ];
  static final List<String> sponsorsLogo = [
    "assets/brand1.png",
    "assets/brand2.png",
    "assets/brand3.png",
    "assets/brand4.png",
    "assets/brand5.png",
  ];
  static final List<Testimonial> testimonials = [
    Testimonial(
      text:
          "This is a testimonial text from Janny Stone. Michele is a professional at what he does and never ceases to amaze me with his beautiful works. I will like to work with him in the future again.",
      occupation: "Product Designer",
      personName: "JANNY STONE",
      profilePhoto: "assets/female.png",
    ),
    Testimonial(
      text:
          "This is a testimonial text from Ken Williams. Michele is a professional at what he does and never ceases to amaze me with his beautiful works. I will like to work with him in the future again.",
      occupation: "Art Director",
      personName: "KEN WILLIAMS",
      profilePhoto: "assets/male.png",
    )
  ];
}
