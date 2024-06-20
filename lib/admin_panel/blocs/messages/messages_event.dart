import 'package:flick/models/Message.dart';

abstract class MessagesEvent {
  const MessagesEvent();
}

class FetchAllMessages extends MessagesEvent {
  const FetchAllMessages();
}

class SendReplyEmail extends MessagesEvent {
  final String userEmail;
  final String replyMessage;

  SendReplyEmail(this.userEmail, this.replyMessage);
}

class DeleteMessage extends MessagesEvent {
  final Message message;

  DeleteMessage(this.message);
}

