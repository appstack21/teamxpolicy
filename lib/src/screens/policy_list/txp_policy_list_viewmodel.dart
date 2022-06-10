import 'package:teamxpolicy/src/screens/policy_list/txp_policy_list_interface.dart';
import 'package:teamxservice/teamxservice.dart';

class TXPPolicyListViewModel implements TXPPolicyListViewModelInterface {
  final String token;
  TXPPolicyListViewModel({required this.token});
  List<TXSPolicy>? policies;

  TXSPolicyServiceWorker service = TXSPolicyServiceWorker();
  void setPolicies(List<TXSPolicy> policies) {
    this.policies = policies;
  }

  List<TXSPolicy>? get getPolicies {
    return policies;
  }

  @override
  void getUserPolicies(
      {required Function onSuccess, required Function onError}) {
    service.getPolicies(token).then((response) {
      if (response is SuccessState) {
        if (response.value is TXSPolicyResponse) {
          var policyResponse = response.value as TXSPolicyResponse;
          if (policyResponse.policies != null) {
            onSuccess(policyResponse.policies!);
          } else {
            onSuccess([]);
          }
        } else {
          onSuccess([]);
        }
      } else if (response is ErrorState) {
        if (response.error is TXSErrorType) {
          var error = response.error as TXSErrorType;
          onError(error);
        }
      } else {
        var error = TXSErrorType.unknown;
        onError(error);
      }
    });
  }
}
