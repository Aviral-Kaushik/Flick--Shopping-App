import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/models/Message.dart';

class MessageRepository {

  Future<List<Message>> fetchAllMessages() async {
    return getDummyMessages();
  }

  Future<bool> sendReplyEmail(String userEmail, String replyMessage) async {
    // TODO Implement sharing mail functionality using App Password from link
    // TODO https://syedahmedusman2.medium.com/how-to-send-email-from-flutter-application-a1937730d15c
    return true;
  }

  Future<bool> deleteMessage(Message message) async {
    List<Message> messages = getDummyMessages();
    return messages.remove(message);
  }

}