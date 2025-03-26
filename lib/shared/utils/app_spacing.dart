import 'package:flutter/material.dart';

class AppSpacing {
  static EdgeInsets bottomSpacing(BuildContext context, {double factor = 40}) {
    return EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height / factor);
  }

  static EdgeInsets topSpacing(BuildContext context, {double factor = 40}) {
    return EdgeInsets.only(top: MediaQuery.sizeOf(context).height / factor);
  }

  static double spacingBetweenContainer(BuildContext context) {
    return MediaQuery.sizeOf(context).height / 70;
  }

  static double spacingBetweenMenu(BuildContext context) {
    return MediaQuery.sizeOf(context).height / 30;
  }
}
