import 'package:flutter/material.dart';
import 'package:teamxpolicy/src/screens/policy_detail/policy_detail_view.dart';
import 'package:teamxpolicy/src/screens/policy_detail/policy_detail_view_interface.dart';
import 'package:teamxpolicy/src/screens/policy_detail/policy_detail_view_model.dart';
import 'package:teamxpolicy/src/screens/policy_list/txp_policy_list_viewmodel.dart';
import 'package:teamxpolicy/teamxpolicy.dart';
import 'package:teamxservice/teamxservice.dart';

class TXPConfigurator {
  static Widget getPolicyListScreen(String token) {
    TXPPolicyListViewModel viewModel = TXPPolicyListViewModel(token: token);
    var listScreen = TXPPolicyListScreen(viewModel: viewModel);
    return listScreen;
  }

  static Widget getPolicyDetailScreen(TXSPolicy policy, String token) {
    TXPPolicyDetailViewModelInterface viewModel =
        TXPPolicyDetailViewModel(token: token, policy: policy);
    var detailScreen = TXPPolicyDetailView(viewModel: viewModel);
    return detailScreen;
  }
}
