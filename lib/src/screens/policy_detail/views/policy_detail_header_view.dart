import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teamxpolicy/src/constants/style.dart';
import 'package:teamxservice/teamxservice.dart';

class TXPPolicyDetailHeaderView extends StatelessWidget {
  final TXSPolicyDetail? detail;
  const TXPPolicyDetailHeaderView(
      {Key? key, this.detail, required this.backButtonCallBack})
      : super(key: key);

  final Function backButtonCallBack;

  @override
  Widget build(BuildContext context) {
    var image = "assets/images/travel.png";

    if (detail?.productType?.toLowerCase() != "travel") {
      image = "assets/images/accident.png";
    }
    return Container(
      // height: 180,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff01C1D6),
            Colors.white,
          ],
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 50, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(detail?.productName ?? "",
                        style: TXPTextStyle.getTextStyle(
                            size: 32,
                            weight: FontWeight.normal,
                            color: Colors.black)),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Image(
                      width: 60,
                      height: 60,
                      image: AssetImage(image, package: 'teamxpolicy')),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
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
