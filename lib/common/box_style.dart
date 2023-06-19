import 'package:flutter/material.dart';

import 'app_style.dart';

class BoxStyles {
  static BoxDecoration navBarDecoration(
          BuildContext context, bool checkColor) =>
      BoxDecoration(
        color: checkColor ? AppStyle.amberColor : AppStyle.transparentColor,
        borderRadius: BorderRadius.circular(12),
      );
}
