import 'package:flutter/material.dart';
import 'package:teamxpolicy/src/common/components/view_components.dart';
import 'package:teamxpolicy/src/common/extension.dart';
import 'package:teamxpolicy/src/constants/style.dart';
import 'package:teamxservice/teamxservice.dart';

class TXPPolicyBenefitsCard extends StatelessWidget {
  const TXPPolicyBenefitsCard({Key? key, required this.benefit})
      : super(key: key);
  final TXSBenefit benefit;
  @override
  Widget build(BuildContext context) {
    var mainInsuredAmount = "0";
    if (benefit.amounts?.mainInsured != null) {
      mainInsuredAmount = "${benefit.amounts?.mainInsured}".withCommas();
    } else {
      mainInsuredAmount = "${benefit.amounts?.adult}".withCommas();
    }

    var partnerAmount = "0";
    if (benefit.amounts?.partner != null) {
      partnerAmount = "${benefit.amounts?.partner}".withCommas();
    } else {
      partnerAmount = "0";
    }

    var dependentAmount = "0";
    if (benefit.amounts?.dependent != null) {
      dependentAmount = "${benefit.amounts?.dependent}".withCommas();
    } else {
      dependentAmount = "0";
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                    child: Text(
                  benefit.description ?? "",
                  style: TXPTextStyle.getTextStyle(
                      size: 16, weight: FontWeight.bold, color: Colors.black),
                )),
              ],
            ),
          ),
          getTileView("Main Insured", "\$$mainInsuredAmount"),
          getTileView("Partner", "\$$partnerAmount"),
          getTileView("Dependent", "\$$dependentAmount"),
          const SizedBox(
            height: 10,
          ),
          dividerView()
        ],
      ),
    );
  }
}
