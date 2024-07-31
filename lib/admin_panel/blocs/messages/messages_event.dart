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
  final String messageSubject;

  const SendReplyEmail(this.userEmail, this.replyMessage, this.messageSubject);
}

class DeleteMessage extends MessagesEvent {
  final Message message;

  const DeleteMessage(this.message);
}

class FilterMessages extends MessagesEvent {
  final String query;

  const FilterMessages(this.query);
}

class CreateNewMessage extends MessagesEvent {
  final Message message;

  const CreateNewMessage(this.message);
}

