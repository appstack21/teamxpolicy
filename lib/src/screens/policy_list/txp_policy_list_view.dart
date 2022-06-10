import 'package:flutter/material.dart';
import 'package:teamxpolicy/src/screens/policy_list/txp_policy_list_viewmodel.dart';
import 'package:teamxpolicy/src/screens/policy_list/views/txp_custom_header_view.dart';
import 'package:teamxpolicy/src/screens/policy_list/views/txp_policy_card.dart';
import 'package:teamxpolicy/src/screens/policy_list/views/txp_segment_bar.dart';
import 'package:teamxservice/teamxservice.dart';

import '../../../teamxpolicy.dart';

class TXPPolicyListScreen extends StatefulWidget {
  const TXPPolicyListScreen({Key? key, required this.viewModel})
      : super(key: key);
  final TXPPolicyListViewModel viewModel;

  @override
  State<TXPPolicyListScreen> createState() => _TXPPolicyListScreenState();
}

class _TXPPolicyListScreenState extends State<TXPPolicyListScreen> {
  List<TXSPolicy> policies = [];
  List<TXSPolicy> currentPolicy = [];
  List<TXSPolicy> activePolicies = [];
  List<TXSPolicy> expiredPolicies = [];
  @override
  void initState() {
    super.initState();
    widget.viewModel.getUserPolicies(
        onSuccess: onFetchPolicySuccess, onError: onFetchPolicyFailure);
  }

  void onFetchPolicySuccess(List<TXSPolicy> policies) {
    var activePolicies =
        policies.where((element) => element.policyStatus == "ACTIVE").toList();
    var expiredPolicies =
        policies.where((element) => element.policyStatus == "EXPIRED").toList();

    setState(() {
      this.policies = policies;
      this.activePolicies = activePolicies;
      this.expiredPolicies = expiredPolicies;
      currentPolicy = policies;
    });
  }

  void onFetchPolicyFailure(TXSErrorType errorType) {}

  void didTapSegment(int index) {
    switch (index) {
      case 0:
        setState(() {
          currentPolicy = policies;
        });
        break;
      case 1:
        setState(() {
          currentPolicy = activePolicies;
        });
        break;
      case 2:
        setState(() {
          currentPolicy = expiredPolicies;
        });
        break;
    }
  }

  void didTapBackButton() {
    Navigator.pop(context);
  }

  void didTapViewPolicy(TXSPolicy policy) {
    var detailScreen =
        TXPConfigurator.getPolicyDetailScreen(policy, widget.viewModel.token);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => detailScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: [],
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: currentPolicy.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return TXPHeaderView(
              policies: policies,
              backButtonCallBack: didTapBackButton,
              segmentCallBack: didTapSegment,
            );
          } else {
            var policy = currentPolicy[index - 1];
            return TXPPolicyCardView(
              policy: policy,
              viewPolicyCallBack: didTapViewPolicy,
            );
          }
        },
      ),
    );
  }
}
