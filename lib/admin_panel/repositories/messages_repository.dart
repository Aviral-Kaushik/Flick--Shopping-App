import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/helper/MailHelper.dart';
import 'package:flick/models/Message.dart';

class MessageRepository {

  late List<Message> messages;

  Future<List<Message>> fetchAllMessages() async {
    messages = getDummyMessages();
    return messages;
  }

  Future<bool> sendReplyEmail(String userEmail, String replyMessage, String subject) async {
    // TODO Implement sharing mail functionality using App Password from link
    // TODO https://syedahmedusman2.medium.com/how-to-send-email-from-flutter-application-a1937730d15c

    MailHelper mailHelper = MailHelper();
    mailHelper.createSmtpServer();

    final mailResponse = await mailHelper.sendMessageReplyEmail(
        userEmail, replyMessage, subject);

    if (mailResponse.isMailSentSuccessfully) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteMessage(Message message) async {
    return messages.remove(message);
  }

  Future<List<Message>> filterMessages(String query) async {
    if (query == "" || query.isEmpty) {
      return messages;
    }

    RegExp regex = RegExp(
      query,
      caseSensitive: false,
    );

    List<Message> queriedMessages = messages.where((message) =>
        regex.hasMatch(message.name) ||
        regex.hasMatch(message.contactEmail) ||
        regex.hasMatch(message.subject) ||
        regex.hasMatch(message.message)).toList();

    List<Message> filteredMessages = queriedMessages.toSet().toList();

    return filteredMessages;
  }

}