import 'package:flick/services/firebase_services.dart';
import 'package:flick/helper/MailHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Message.dart';
import 'package:tuple/tuple.dart';

class MessageRepository {

  late List<Message> messages;

  FirebaseServices firebaseServices;

  MessageRepository(this.firebaseServices);

  Future<List<Message>> fetchAllMessages() async {

    messages = await firebaseServices.getAllMessagesFromFirebase();
    return messages;
    // messages = getDummyMessages();
    // firebaseServices.storeAllMessagesInFirebase(messages);
  }

  Future<bool> sendReplyEmail(String userEmail, String replyMessage, String subject) async {
    MailHelper mailHelper = locator.get<MailHelper>();
    mailHelper.createSmtpServer();

    final mailResponse = await mailHelper.sendMessageReplyEmail(
        userEmail, replyMessage, subject);

    if (mailResponse.isMailSentSuccessfully) {
      return true;
    } else {
      return false;
    }
  }

  Future<Tuple2<bool, String>> deleteMessage(Message message) async {
    Tuple2<bool, String> messageDeleteResponse =
            await firebaseServices.deleteMessageInFirebase(message);

    if (messageDeleteResponse.item1) {
      return messageDeleteResponse;
    } else {
      messages.remove(message);
      return messageDeleteResponse;
    }
  }

  Future<List<Message>> filterMessages(String query) async {
    if (query == "" || query.isEmpty) {
      return messages;
    }

    RegExp regex = RegExp(
      query,
      caseSensitive: false,
    );

    List<Message> filteredMessages = messages
        .where((message) =>
            regex.hasMatch(message.name) ||
            regex.hasMatch(message.contactEmail) ||
            regex.hasMatch(message.subject) ||
            regex.hasMatch(message.message))
        .toSet()
        .toList();

    return filteredMessages;
  }

  void createNewMessage(Message message) async =>
      firebaseServices.createNewMessage(message);

}