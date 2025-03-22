import 'package:flutter/material.dart';
import 'package:frontendpos/shared/utils/constants.dart';

class AppTextSizes {
  static double small(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.03;
  static double medium(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04;
  static double large(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.05;
  static double extraLarge(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.06;

  static TextStyle mediumTitle(BuildContext context) => TextStyle(
        fontSize: AppTextSizes.medium(context),
        fontWeight: FontWeight.w500,
      );

  static TextStyle smallDescription(BuildContext context) => TextStyle(
        fontSize: AppTextSizes.small(context),
        color: Colors.grey
      );
}
