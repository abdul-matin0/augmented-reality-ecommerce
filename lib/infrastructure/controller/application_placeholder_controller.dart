import 'package:get/get.dart';
import 'package:halcera/infrastructure/models/banner_placeholder.dart';
import 'package:halcera/presentation/styles/colors.dart';

class ApplicationPlaceholderController extends GetxController {
  int currentBannerCarouselIndex = 0;
  List<BannerPlaceholder> listOfBanners = const [
    BannerPlaceholder(
      imageURL: 'placeholderone.png',
      title: 'Special discount!',
      subtitle: 'Up to 70% off',
    ),
    BannerPlaceholder(
        imageURL: 'placeholdertwo.png',
        title: 'Special discount!',
        subtitle: 'Up to 70% off',
        titleColor: primaryWhiteColor,
        subtitleColor: primaryFontColor),
        BannerPlaceholder(
        imageURL: 'placeholderthree.png',
        title: 'Rewards & offers',
        subtitle: 'Win rewards',
        buttonText: 'Get Started',
        titleColor: primaryWhiteColor,
        subtitleColor: primaryFontColor)
  ];
}
