import 'package:teamxpolicy/src/screens/policy_detail/policy_detail_view_interface.dart';
import 'package:teamxpolicy/src/screens/policy_list/txp_policy_list_interface.dart';
import 'package:teamxservice/teamxservice.dart';

class TXPPolicyDetailViewModel implements TXPPolicyDetailViewModelInterface {
  final String token;
  final TXSPolicy policy;
  TXPPolicyDetailViewModel({
    required this.token,
    required this.policy,
  });

  TXSPolicyDetail? policyDetail;
  TXSPolicyServiceWorker service = TXSPolicyServiceWorker();

  @override
  void getPolicyDetail(String product,
      {required Function onSuccess, required Function onError}) {
    var product = "travel";
    if (policy.policyType?.toLowerCase() != "travel") {
      product = "other";
    }

    service
        .getPolicyDetail(token, policy.policyNumber!, product)
        .then((response) {
      if (response is SuccessState) {
        if (response.value is TXSPolicyDetail) {
          var policyResponse = response.value as TXSPolicyDetail;
          policyDetail = policyResponse;
          onSuccess(policyResponse);
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

  @override
  void getDownloadPolicyDocument(
      {required Function onSuccess, required Function onError}) {
    if (policyDetail?.productType != "travel") {
      service.getPolicyDocument(token, policy.policyNumber!).then((response) {
        if (response is SuccessState) {
          if (response.value is TXSDocumentResponse) {
            var documentResponse = response.value as TXSDocumentResponse;
            print(documentResponse.documentPath);
            onSuccess(documentResponse.documentPath);
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
    } else {
      var documentUrl = policyDetail?.additionalProps?.documentUrl;
      if (documentUrl != null) {
        service
            .getPolicyDocumentFromUrl(documentUrl, policy.policyNumber!)
            .then((response) {
          if (response is SuccessState) {
            if (response.value is TXSDocumentResponse) {
              var documentResponse = response.value as TXSDocumentResponse;
              print(documentResponse.documentPath);
              onSuccess(documentResponse.documentPath);
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
  }
}
