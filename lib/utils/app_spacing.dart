import 'package:flutter/material.dart';

class AppSpacing {
  static EdgeInsets bottomSpacing(BuildContext context, {double factor = 40}) {
    return EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height / factor);
  }

   static EdgeInsets topSpacing(BuildContext context, {double factor = 40}) {
    return EdgeInsets.only(top: MediaQuery.sizeOf(context).height / factor);
  }

}
