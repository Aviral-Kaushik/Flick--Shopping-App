import 'package:flick/models/Message.dart';

abstract class MessagesState {
  const MessagesState();
}

class MessageInitial extends MessagesState {

}

class MessageLoading extends MessagesState {
    final String progressDisplayMessage;

    const MessageLoading(this.progressDisplayMessage);
}

class MessageFetched extends MessagesState {
  final List<Message> messages;

  const MessageFetched(this.messages);
}

class MessageError extends MessagesState {
  final String errorMessage;
  // bool variable used for signifying does error occurred while fetching
  // messages or sending reply mail.
  final bool isErrorOccurredDuringFetchingMessages;

  const MessageError(
      this.errorMessage, this.isErrorOccurredDuringFetchingMessages);
}

class ReplyEmailSentSuccessfully extends MessagesState {

}

class MessageDeletedSuccessfully extends MessagesState {

}

class MessageCreatedSuccessfully extends MessagesState {

}

