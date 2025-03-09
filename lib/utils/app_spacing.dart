import 'package:flutter/material.dart';

class AppSpacing {
  static EdgeInsets bottomSpacing(BuildContext context, {double factor = 35}) {
    return EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height / factor);
  }
}
