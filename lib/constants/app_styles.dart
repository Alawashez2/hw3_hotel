import 'package:flutter/material.dart';

Color primaryColor = Colors.blue.shade200;
Color darkPrimaryColor = Colors.blue.shade400;
const whiteColor = Colors.white;
Color greyColor = Colors.grey.shade600;
Color lightGrayColor = Colors.grey.shade400;
Color blackColor = Colors.black;
var myGradient = LinearGradient(
  colors: [primaryColor, darkPrimaryColor],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

// gradient: LinearGradient(
//                   colors: [primaryColor, darkPrimaryColor])