import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teamxservice/teamxservice.dart';

enum TXPButtons { all, active, expired }

class TXPSegmentBar extends StatefulWidget {
  const TXPSegmentBar({Key? key, this.policies, this.callBack})
      : super(key: key);
  final List<TXSPolicy>? policies;
  final Function? callBack;
  @override
  State<TXPSegmentBar> createState() => _TXPSegmentBarState();
}

class _TXPSegmentBarState extends State<TXPSegmentBar> {
  TXPButtons selectedButton = TXPButtons.all;
  void didTapAllButton() {
    setState(() {
      selectedButton = TXPButtons.all;
    });
    if (widget.callBack != null) {
      widget.callBack!(0);
    }
  }

  void didTapActiveButton() {
    setState(() {
      selectedButton = TXPButtons.active;
    });
    if (widget.callBack != null) {
      widget.callBack!(1);
    }
  }

  void didTapExpiredButton() {
    setState(() {
      selectedButton = TXPButtons.expired;
    });
    if (widget.callBack != null) {
      widget.callBack!(2);
    }
  }

  BoxDecoration selectedButtonStyle() {
    return BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)));
  }

  BoxDecoration normalButtonStyle() {
    return BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16.0)));
  }

  @override
  Widget build(BuildContext context) {
    List<TXSPolicy> activePolicies = [];
    List<TXSPolicy> expiredPolicies = [];
    if (widget.policies != null) {
      activePolicies = widget.policies!
          .where((element) => element.policyStatus == "ACTIVE")
          .toList();

      expiredPolicies = widget.policies!
          .where((element) => element.policyStatus == "EXPIRED")
          .toList();
    }

    double width = MediaQuery.of(context).size.width - 64;
    return SizedBox(
      height: 32,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: GestureDetector(
              onTap: () => didTapAllButton(),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: selectedButton == TXPButtons.all
                    ? selectedButtonStyle()
                    : normalButtonStyle(),
                child: Center(
                    child: Text("All (${widget.policies?.length ?? 0})")),
              ),
            )),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: GestureDetector(
              onTap: () => didTapActiveButton(),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: selectedButton == TXPButtons.active
                    ? selectedButtonStyle()
                    : normalButtonStyle(),
                child: Center(child: Text("Active (${activePolicies.length})")),
              ),
            )),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: GestureDetector(
              onTap: () => didTapExpiredButton(),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: selectedButton == TXPButtons.expired
                    ? selectedButtonStyle()
                    : normalButtonStyle(),
                child:
                    Center(child: Text("Expired (${expiredPolicies.length})")),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
