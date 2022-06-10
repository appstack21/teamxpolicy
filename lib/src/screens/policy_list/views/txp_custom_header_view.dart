import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teamxpolicy/src/screens/policy_list/views/txp_segment_bar.dart';
import 'package:teamxservice/teamxservice.dart';

class TXPHeaderView extends StatelessWidget {
  final List<TXSPolicy>? policies;
  final Function? segmentCallBack;
  final Function backButtonCallBack;

  const TXPHeaderView(
      {Key? key,
      this.policies,
      required this.backButtonCallBack,
      this.segmentCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff01C1D6),
            Colors.white,
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                backButtonContainer(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    centerItem(),
                  ],
                ),
                const Image(
                    width: 140,
                    height: 140,
                    image: AssetImage('assets/images/header.png',
                        package: 'teamxpolicy')),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TXPSegmentBar(
              policies: policies,
              callBack: segmentCallBack,
            )
          ]),
    );
  }

  Widget centerItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Policies",
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: const Text(
              "Submit Claim",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.blue),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget backButtonContainer() {
    return GestureDetector(
      onTap: () => {backButtonCallBack()},
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
                width: 14,
                height: 6,
                image: AssetImage('assets/images/back.png',
                    package: 'teamxpolicy')),
            SizedBox(
              width: 5,
            ),
            Text(
              "Back",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
