import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Styles {
  static TextStyle styleBold32 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(fontSize: 32.81),
      color: const Color(0xff1C2121));

  static TextStyle styleRegular14 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(fontSize: 14.96),
      color: const Color(0xff1C2121));

  static TextStyle styleBold17 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(fontSize: 17),
      color: Colors.white);

  static TextStyle styleSemiBold14 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(fontSize: 14.58),
      color: const Color(0xff007AFF));

  static TextStyle styleBold26 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(fontSize: 26),
      color: const Color(0xff1C2121));

  static TextStyle styleRegular13 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(fontSize: 13),
      color: const Color(0xff3C3C43).withValues(alpha: .6));

  static TextStyle styleRegularOpacity17 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(fontSize: 17.68),
      color: const Color(0xff1C2121).withValues(alpha: .6));

  static TextStyle styleBold15 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(fontSize: 15.62),
      color: Colors.black);

  static TextStyle styleSemiBold15 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(fontSize: 15),
      color: const Color(0xff1C2121));

  static TextStyle styleLight16 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w300,
      fontSize: getResponsiveFontSize(fontSize: 16),
      color: const Color(0xff1C2121));

  static TextStyle styleSemiBold9 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(fontSize: 8.9),
      color: const Color(0xff1C2121));

  static TextStyle styleSemiBold16 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(fontSize: 16.52),
      color: const Color(0xff828282));

  static TextStyle styleRegular12 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(fontSize: 12),
      color: const Color(0xff1C2121));

  static TextStyle styleRegular17 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(fontSize: 17),
      color: const Color(0xff1C2121));

  static TextStyle styleItalic20 = TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: getResponsiveFontSize(fontSize: 20),
      fontStyle: FontStyle.italic,
      color: const Color(0xff1C2121));

  static TextStyle styleBold40 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.bold,
      fontSize: getResponsiveFontSize(fontSize: 17),
      color: const Color(0xff1C2121));

  static TextStyle styleSaveButton = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(fontSize: 14.58),
      color: Colors.white);

  static TextStyle styleRegular15 = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w400,
      fontSize: getResponsiveFontSize(fontSize: 15),
      color: const Color(0xff1C2121));
}

double getResponsiveFontSize({required double fontSize}) {
  double scallFactor = getScaleFactor();
  double responsiveFontSize = fontSize * scallFactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor() {
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var decivePixels = dispatcher.views.first.devicePixelRatio;

  var width = physicalWidth / decivePixels;
  return width / 550;
}
