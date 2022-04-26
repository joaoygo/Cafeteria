import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyleTheme {
  static const double thirtysixSize = 36;
  static const double thirtySize = 30;
  static const double twentythreeSize = 23;
  static const double twentySize = 20.0;
  static const double eighteenSize = 18.0;
  static const double seventeenSize = 17.0;
  static const double sixteenSize = 16.0;
  static const double fourteenSize = 14.0;
  static const double thirteenSize = 13.0;
  static const double twelveSize = 12.0;
  static const double tenSize = 10.0;
  static const double eightSize = 8.0;

  static const String fontFamily = 'Inter';

  static final TextStyle homeScreenTitleBlackTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: thirtysixSize,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.neutral.shade700,
  );
  static final TextStyle homeScreenTitleAntiqueTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: thirtysixSize,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.antique.shade700,
  );
  static final TextStyle detailsSelectionTitleAntiqueTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: twentythreeSize,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.neutral.shade700,
  );
  static final TextStyle detailsSelectionSubtitleItemsBlackTextStyle =
      TextStyle(
    fontFamily: fontFamily,
    fontSize: twentySize,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.neutral.shade700,
  );
  static final TextStyle detailsSelectionSubtitleItemsSpanBlackTextStyle =
      TextStyle(
    fontFamily: fontFamily,
    fontSize: twentySize,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.neutral.shade400,
  );
  static final TextStyle detailsSelectionPriceItemTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: thirtySize,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.antique.shade700,
  );
  static final TextStyle detailsSelectionPriceItemSpanTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: seventeenSize,
    fontWeight: FontWeight.bold,
    color: ColorsTheme.antique.shade700,
  );
}
