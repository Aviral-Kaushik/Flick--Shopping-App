import 'package:flick/utils/CredentialConfig.dart';
import 'package:flick/utils/MailResponse.dart';
import 'package:flick/utils/MailTemplates.dart';
import 'package:flutter/cupertino.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class MailHelper {

  late SmtpServer smtpServer;

  void createSmtpServer() {
    smtpServer = gmail(username, password);
  }

  Future<MailResponse> sendEmail(Message message) async {
    MailResponse mailResponse = MailResponse(false);

    try {
      final sendReport = await send(message, smtpServer);
      debugPrint("Message Sent: ${sendReport.toString()}");
      mailResponse.isMailSentSuccessfully = true;
    } on MailerException catch (e) {
      debugPrint("Cannot sent mail: ${e.message}");
      mailResponse.isMailSentSuccessfully = false;
      mailResponse.errorMessage = e.message;
      for (var p in e.problems) {
        debugPrint('Problem: ${p.code}: ${p.msg}');
        mailResponse.problems?.add(p.msg);
      }
    }

    return mailResponse;
  }

  Future<MailResponse> sendMessageReplyEmail(String userEmail, String replyMessage,
      String messageSubject) async {

    final message = Message()
        ..from = Address(username, "Aviral Kaushik")
        ..recipients.add(userEmail)
        ..subject = "Re: $messageSubject"
        ..html = MailTemplates().getReplyMessageEmailTemplate(replyMessage);

    final mailResponse = await sendEmail(message);
    return mailResponse;
  }

  Future<MailResponse> sendAdminAccessEmail(String userEmail) async {

    final message = Message()
        ..from = Address(username, "Aviral Kaushik")
        ..recipients.add(userEmail)
        ..subject = "Admin Access Privileges"
        ..html = MailTemplates().getAdminAccessMailHtmlContent();

    final mailResponse = await sendEmail(message);
    return mailResponse;
  }

}