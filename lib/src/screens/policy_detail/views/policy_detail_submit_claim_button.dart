import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../constants/style.dart';

class TXPSubmitButton extends StatelessWidget {
  const TXPSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 110,
      child: GestureDetector(
          onTap: () => {},
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(4.0))),
              margin: const EdgeInsets.only(left: 32, right: 32),
              height: 48,
              child: Center(
                child: Text(
                  "Submit a claim",
                  style: TXPTextStyle.getTextStyle(
                      size: 16, weight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          )),
    );
  }
}
