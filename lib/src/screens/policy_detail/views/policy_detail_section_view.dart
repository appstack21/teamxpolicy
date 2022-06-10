import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:teamxpolicy/src/common/extension.dart';
import 'package:teamxpolicy/src/constants/style.dart';
import 'package:teamxservice/teamxservice.dart';

import '../../../common/components/view_components.dart';

class TXPPolicyDetailSectionView extends StatelessWidget {
  final TXSPolicyDetail? detail;
  const TXPPolicyDetailSectionView(
      {Key? key, this.detail, this.downloadCallback})
      : super(key: key);
  final Function? downloadCallback;
  void didTapDownloadButton() {
    if (downloadCallback != null) {
      downloadCallback!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: Text(
                    "Policy details",
                    style: TXPTextStyle.getTextStyle(
                        size: 20, weight: FontWeight.bold, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          dividerView(),
          getPolicyNumberView(),
          getPremiumAmountView(),
          getBillingCycleView(),
          getStartDateView(),
          getSponsorNameView(),
          getPolicyDocumentView(true),
          getETaxDocumentView(),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget getPolicyNumberView() {
    if (detail?.policyNumber != null) {
      return getTileView("Policy number", detail?.policyNumber ?? "");
    } else {
      return Container();
    }
  }

  Widget getPremiumAmountView() {
    if (detail?.premium != null) {
      var premium = detail?.premium;
      premium = premium?.roundTo(2);
      return getTileView("Premium", "\$$premium");
    } else {
      return Container();
    }
  }

  Widget getBillingCycleView() {
    if (detail?.productType == null || detail?.productType != "travel") {
      var billingCyle = "Annual";
      var frequency = detail?.paymentDetails?.frequency;
      if (frequency != null) {
        billingCyle = frequency;
      }
      return getTileView("Premium", billingCyle);
    }
    return Container();
  }

  Widget getStartDateView() {
    if (detail?.effectiveDate != null) {
      var startDate = detail?.effectiveDate;
      final f = DateFormat('dd/MM/yyyy');
      var finalDate = f.format(startDate!);
      return getTileView("Start Date", finalDate);
    }
    return Container();
  }

  Widget getSponsorNameView() {
    if (detail?.sponsorName != null) {
      return getTileView("Purchased from", detail!.sponsorName!);
    }
    return Container();
  }

  Widget getPolicyDocumentView(bool isDownloaded) {
    return getDownloadTileView("Policy Documents",
        isDownloaded ? "View" : "Download", isDownloaded, didTapDownloadButton);
  }

  Widget getETaxDocumentView() {
    // return getDownloadTileView(
    //     "E-Tax(2021-2022)", "Download", didTapDownloadButton);
    return Container();
  }
}
