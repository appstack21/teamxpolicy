import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teamxpolicy/src/common/extension.dart';
import 'package:teamxservice/teamxservice.dart';

import '../../../common/components/view_components.dart';
import '../../../constants/style.dart';

class TXPPolicyDetailInsuredView extends StatelessWidget {
  final TXSPolicyDetail? detail;
  const TXPPolicyDetailInsuredView({Key? key, this.detail}) : super(key: key);

  void didTapAllBenefits() {
    print("all benefit clicked");
  }

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
                  "Who it covers",
                  style: TXPTextStyle.getTextStyle(
                      size: 20, weight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
          dividerView(),
          getInsuredDetail(),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget getInsuredDetail() {
    if (detail?.insured == null) {
      return Container();
    }
    var insureds = detail?.insured;
    return Column(
      children: <Widget>[
        ...insureds!.map((insured) {
          var insuredName = "${insured.firstName} ${insured.lastName} ";
          if (insured.role?.toLowerCase() == "mi") {
            return getTileView("Main Insured(You)", insuredName);
          } else {
            return getTileView("Other", insuredName);
          }
        }).toList(),
      ],
    );
  }
}
