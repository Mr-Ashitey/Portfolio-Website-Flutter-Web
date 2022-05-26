import 'package:flutter/painting.dart';

class HeaderItem {
  final String? title;
  final VoidCallback? onTap;
  final bool? isButton;

  const HeaderItem(
      {required this.title, required this.onTap, this.isButton = false});
}
