import 'package:flutter/material.dart';

class TXPTextStyle {
  static TextStyle? getTextStyle(
      {required double size,
      required FontWeight weight,
      required Color color}) {
    return TextStyle(
        height: 1.3,
        fontFamily: 'Lato',
        fontSize: size,
        fontWeight: weight,
        color: color,
        package: 'teamxsdk');
  }

  static TextStyle? getTextStyleWithLineHeight(
      {required double size,
      required FontWeight weight,
      required Color color,
      required double lineHeigh}) {
    return TextStyle(
        height: lineHeigh,
        fontFamily: 'Lato',
        fontSize: size,
        fontWeight: weight,
        color: color,
        package: 'teamxsdk');
  }
}

class TXPFonts {
  static String latoRegular = "Lato-Regular";
  static String latoBold = "Lato-DemiBold";
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color? fromHex(String? hexString) {
    if (hexString == null) {
      return null;
    }
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class TXPColor {
  static const primaryBackgroundColor = Colors.white;

  static const cardBorderColor = Color(0xff848a91);

  static const cardInformationColor = Color(0xff171822);

  static const primaryColor = Color(0xfffe9c26);

  static const secondaryBackgroundColor = Color(0xffedf0f4);
}
