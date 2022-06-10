import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teamxpolicy/src/constants/style.dart';
import 'package:teamxservice/teamxservice.dart';

class TXPPolicyCardView extends StatelessWidget {
  final TXSPolicy policy;
  final Function viewPolicyCallBack;
  const TXPPolicyCardView(
      {Key? key, required this.policy, required this.viewPolicyCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusText = "ACTIVE";
    Color statusColor = const Color(0xff7ACB00);
    if (policy.policyStatus != "ACTIVE") {
      statusText = "EXPIRED";
      statusColor = const Color(0xffAFAFAF);
    }
    var image = "assets/images/travel.png";

    if (policy.policyType?.toLowerCase() != "travel") {
      image = "assets/images/accident.png";
    }
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,

              blurRadius: 2,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(4.0))),
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 24, right: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Status
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 80,
                height: 30,
                color: statusColor,
                child: Center(child: Text(statusText)),
              )
            ],
          ),
          //name
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                    width: 32,
                    height: 32,
                    image: AssetImage(image, package: 'teamxpolicy')),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  policy.policyName ?? "",
                  style: TXPTextStyle.getTextStyle(
                      size: 20, weight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //policy number
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Policy number",
                    style: TXPTextStyle.getTextStyle(
                        size: 12,
                        weight: FontWeight.normal,
                        color: Colors.black)),
                Text(policy.policyNumber ?? "",
                    style: TXPTextStyle.getTextStyle(
                        size: 16, weight: FontWeight.bold, color: Colors.black))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Expiry Date
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Policy Expiring on",
                    style: TXPTextStyle.getTextStyle(
                        size: 12,
                        weight: FontWeight.normal,
                        color: Colors.black)),
                Text(policy.expiryDate ?? "",
                    style: TXPTextStyle.getTextStyle(
                        size: 16, weight: FontWeight.bold, color: Colors.black))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () => {viewPolicyCallBack(policy)},
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  height: 48,
                  child: Center(
                    child: Text(
                      "View Policy",
                      style: TXPTextStyle.getTextStyle(
                          size: 16,
                          weight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
