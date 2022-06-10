import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teamxpolicy/src/common/extension.dart';
import 'package:teamxservice/teamxservice.dart';

import '../../../common/components/view_components.dart';
import '../../../constants/style.dart';

class TXPPolicyDetailCoverageView extends StatelessWidget {
  final TXSPolicyDetail? detail;

  final Function? benefitCallback;
  const TXPPolicyDetailCoverageView(
      {Key? key, this.detail, required this.benefitCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "What it covers",
                  style: TXPTextStyle.getTextStyle(
                      size: 20, weight: FontWeight.bold, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () => {
                    if (benefitCallback != null) {benefitCallback!()}
                  },
                  child: const Text("See all benefits",
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.normal,
                          color: Color(0XFF1D009D))),
                )
              ],
            ),
          ),
          dividerView(),
          getCoverageDetail(),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget getCoverageDetail() {
    if (detail?.coverages == null) {
      return Container();
    }
    var coverages = detail?.coverages;

    if ((coverages?.length ?? 0) > 5) {
      return Column(
        children: [
          ...[0, 1, 2, 3, 4, 5].map((i) {
            if (i == 5) {
              return getTileView(
                  "& other ${(coverages?.length ?? 0) - 5} coverages", "");
            }
            var coverage = coverages?[i];
            var insuredValue =
                "\$${coverage?.amounts?.mainInsured}".withCommas();
            if (detail?.productType == null ||
                detail?.productType?.toLowerCase() != "travel") {
              return getTileView(coverage?.name ?? "", insuredValue);
            } else {
              return getTileView(coverage?.geniusCoverText ?? "", insuredValue);
            }
          }).toList(),
        ],
      );
    }

    return Column(
      children: <Widget>[
        ...coverages!.map((coverage) {
          var insuredValue = "\$${coverage.amounts?.mainInsured}".withCommas();
          if (detail?.productType == null ||
              detail?.productType?.toLowerCase() != "travel") {
            return getTileView(coverage.name ?? "", insuredValue);
          } else {
            return getTileView(coverage.geniusCoverText ?? "", insuredValue);
          }
        }).toList(),
      ],
    );
  }
}
