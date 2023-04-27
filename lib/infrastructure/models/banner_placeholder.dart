import 'package:flutter/material.dart';
import 'package:halcera/presentation/styles/colors.dart';

/// Banner Model class
class BannerPlaceholder {
  final String title;
  final String subtitle;
  final String imageURL;
  final String buttonText;
  final Color titleColor;
  final Color subtitleColor;
  final void Function()? onButtonClick;

  const BannerPlaceholder(
      {required this.title,
      required this.subtitle,
      required this.imageURL,
      this.titleColor = secondaryFontColor,
      this.subtitleColor = secondaryColor,
      this.buttonText = 'Order Now',
      this.onButtonClick});
}
