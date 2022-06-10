import 'dart:math';

extension TXPDouble on double {
  double roundTo(int places) {
    var divisor = pow(10.0, places);
    return (this * divisor).round() / divisor;
  }
}

RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
String Function(Match) mathFunc = (Match match) => '${match[1]},';

extension TXPString on String {
  String withCommas() {
    return replaceAllMapped(reg, mathFunc);
  }
}
