abstract class TXPPolicyDetailViewModelInterface {
  void getPolicyDetail(String product,
      {required Function onSuccess, required Function onError});

  void getDownloadPolicyDocument(
      {required Function onSuccess, required Function onError});
}
