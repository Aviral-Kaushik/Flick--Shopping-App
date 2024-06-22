class MailResponse {

  bool isMailSentSuccessfully;
  String? errorMessage;
  List<String>? problems;

  MailResponse(
      this.isMailSentSuccessfully,
      {this.errorMessage, this.problems}
  );
}
