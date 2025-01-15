import 'package:flutter/material.dart';

import 'colors.dart';


class AppTextStyles {
  static TextStyle permissionTitleStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColor.titleColor,
  );

  static TextStyle permissionDescriptionStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.descriptionColor,
  );

  static TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.buttonTextColor,
  );
}