import 'package:flutter/material.dart';
import 'package:teamxpolicy/src/constants/style.dart';
import 'package:teamxpolicy/src/screens/policy_benefits/policy_benefits_card.dart';
import 'package:teamxservice/teamxservice.dart';

class TXPPolicyBenefitsView extends StatefulWidget {
  const TXPPolicyBenefitsView({Key? key, required this.benefits})
      : super(key: key);
  final List<TXSBenefit> benefits;
  @override
  State<TXPPolicyBenefitsView> createState() => _TXPPolicyBenefitsViewState();
}

class _TXPPolicyBenefitsViewState extends State<TXPPolicyBenefitsView> {
  void didTapBackButton() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          actions: const [],
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          margin:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "   ",
                    style: TXPTextStyle.getTextStyle(
                        size: 22, weight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    "Benefits & Coverage",
                    style: TXPTextStyle.getTextStyle(
                        size: 22, weight: FontWeight.bold, color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () => {Navigator.pop(context)},
                      icon: const Icon(
                        Icons.close,
                        size: 36,
                      ))
                ],
              ),
              ...widget.benefits.map((benefit) {
                return TXPPolicyBenefitsCard(benefit: benefit);
              }).toList(),
            ],
          )),
        ));
  }
}
