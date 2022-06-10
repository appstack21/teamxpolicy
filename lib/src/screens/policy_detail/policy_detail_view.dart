import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teamxpolicy/src/screens/policy_benefits/policy_benefits_view.dart';
import 'package:teamxpolicy/src/screens/policy_detail/policy_detail_view_interface.dart';
import 'package:teamxpolicy/src/screens/policy_detail/views/policy_detail_coverage_view.dart';
import 'package:teamxpolicy/src/screens/policy_detail/views/policy_detail_header_view.dart';
import 'package:teamxpolicy/src/screens/policy_detail/views/policy_detail_insured_view.dart';
import 'package:teamxpolicy/src/screens/policy_detail/views/policy_detail_section_view.dart';
import 'package:teamxpolicy/src/screens/policy_detail/views/policy_detail_submit_claim_button.dart';
import 'package:teamxpolicy/src/screens/policy_document_viewer/policy_document_viewer.dart';
import 'package:teamxservice/teamxservice.dart';

class TXPPolicyDetailView extends StatefulWidget {
  final TXPPolicyDetailViewModelInterface viewModel;
  const TXPPolicyDetailView({Key? key, required this.viewModel})
      : super(key: key);

  @override
  State<TXPPolicyDetailView> createState() => _TXPPolicyDetailViewState();
}

class _TXPPolicyDetailViewState extends State<TXPPolicyDetailView> {
  TXSPolicyDetail? detail;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    widget.viewModel.getPolicyDetail("travel",
        onSuccess: onSuccessPolicyDetail, onError: onFailurePolicyDetail);
  }

  void onSuccessPolicyDetail(TXSPolicyDetail detail) {
    print("Reponse AAYA ${detail.policyNumber}");
    setState(() {
      isLoading = false;
      this.detail = detail;
    });
  }

  void onFailurePolicyDetail(TXSErrorType error) {
    setState(() {
      isLoading = false;
    });
  }

  void didTapBackButton() {
    Navigator.pop(context);
  }

  void onDocumentDownloadSuccess(String? path) {
    var policyDetail = this.detail;
    policyDetail?.isDocumentDownloaded = true;
    setState(() {
      detail = policyDetail;
    });
    if (path != null) {
      Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return TXPPolicyDocumentView(
              documentPath: path,
            );
          }));
    }
  }

  void onDocumentDownloadFailure(TXSErrorType errorType) {}

  void didTapDownload() {
    widget.viewModel.getDownloadPolicyDocument(
        onSuccess: onDocumentDownloadSuccess,
        onError: onDocumentDownloadFailure);
  }

  void didTapAllBenefits() {
    if (detail?.benefits != null) {
      Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return TXPPolicyBenefitsView(benefits: detail!.benefits!);
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: const [],
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: isLoading == false
          ? SingleChildScrollView(
              child: Stack(children: [
              Column(
                children: <Widget>[
                  TXPPolicyDetailHeaderView(
                    detail: detail,
                    backButtonCallBack: didTapBackButton,
                  ),
                  TXPPolicyDetailSectionView(
                    detail: detail,
                    downloadCallback: didTapDownload,
                  ),
                  const TXPSubmitButton(),
                  TXPPolicyDetailCoverageView(
                    detail: detail,
                    benefitCallback: didTapAllBenefits,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TXPPolicyDetailInsuredView(
                    detail: detail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ]))
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  TXPPolicyDetailHeaderView(
                    detail: detail,
                    backButtonCallBack: didTapBackButton,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  )
                ]),
    );
  }
}
