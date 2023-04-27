import 'package:flutter/material.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/styles/font_size.dart';
import 'package:halcera/presentation/styles/fonts.dart';
import 'package:halcera/presentation/widgets/loading_widget.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final bool isLoading, isDisabled;
  final String text;
  final double height;
  final double? width;
  final double fontSize;
  final double borderRadius;
  final Color? textColor;
  final Color? buttonColor;
  final BoxBorder? boxBorder;
  final Widget? titleWidget;
  final bool isPrimaryButton;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const PrimaryButtonWidget(
      {Key? key,
      this.onPressed,
      this.text = '',
      this.borderRadius = buttonBorderRadius,
      this.height = 56,
      this.width,
      this.padding,
      this.fontSize = h4,
      this.isLoading = false,
      this.isDisabled = false,
      this.textColor,
      this.boxBorder,
      this.buttonColor,
      this.titleWidget,
      this.margin,
      this.fontWeight,
      this.isPrimaryButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // track if textColor is provided
    bool textColorProvided = textColor != null ? true : false;
    // track if buttonColor is provided
    bool buttonColorProvided = buttonColor != null ? true : false;

    Color? getColor() {
      if (isDisabled) {
        return primaryBlackColor.withOpacity(0.1);
      }
      if (buttonColorProvided) {
        return buttonColor;
      }
      if (isPrimaryButton) {
        return primaryBlackColor;
      }
      return primaryWhiteColor;
    }

    return GestureDetector(
      onTap: isLoading || isDisabled
          ? null
          : onPressed, // prevent button from being pressed when loading
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          // isPrimaryButton true : uses default gradient with primary color
          // isPrimaryButton false : uses plain white color
          color: getColor(),
          border: boxBorder,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        margin: margin ??
            const EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 8.0,
            ),
        child: Center(
          child: Stack(
            children: [
              Visibility(
                visible: isLoading ? false : true,
                child: Center(
                  child: titleWidget ??
                      Padding(
                        padding: padding ??
                            const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 8.0),
                        child: Text(
                          text,
                          style: urbanistFontStyle(
                              fontSize: fontSize,
                              fontWeight: fontWeight ?? FontWeight.w600,
                              color: textColorProvided
                                  ? textColor
                                  : isPrimaryButton
                                      ? primaryWhiteColor
                                      : primaryFontColor),
                        ),
                      ),
                ),
              ),
              // display loader after button is clicked i.e isLoading = true
              Visibility(
                visible: isLoading ? true : false,
                child: const Center(
                  child: LoadingWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
