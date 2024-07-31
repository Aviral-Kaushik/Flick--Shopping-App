import 'package:flick/admin_panel/blocs/messages/messages_event.dart';
import 'package:flick/admin_panel/blocs/messages/messages_state.dart';
import 'package:flick/admin_panel/repositories/messages_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {

  final MessageRepository messageRepository;

  MessagesBloc(this.messageRepository) : super(MessageInitial()) {
    on<FetchAllMessages>((event, emit) async {

      emit(const MessageLoading("Fetching messages! Please wait"));

      final messages = await messageRepository.fetchAllMessages();

      emit(MessageFetched(messages));

    });

    on<SendReplyEmail>((event, emit) async {

      emit(const MessageLoading("Sending Reply! Please wait"));

      final isReplySentSuccessfully = await messageRepository.sendReplyEmail(
        event.userEmail,
        event.replyMessage,
        event.messageSubject
      );

      if (isReplySentSuccessfully) {
        emit(ReplyEmailSentSuccessfully());
      } else {
        emit(const MessageError("Failure sending reply email", false));
      }

    });

    on<FilterMessages>((event, emit) async {
      emit(const MessageLoading("Searching...."));

      final filteredMessages =
          await messageRepository.filterMessages(event.query);

      emit(MessageFetched(filteredMessages));
    });

    on<DeleteMessage>((event, emit) async {
      emit(const MessageLoading("Deleting Message! Please Wait"));

      final messageDeletedResponse =
            await messageRepository.deleteMessage(event.message);

      if (messageDeletedResponse.item1) {
        emit(MessageError(messageDeletedResponse.item2, false));
      } else {
        emit(MessageDeletedSuccessfully());
      }
    });

    on<CreateNewMessage>((event, emit) async {
      emit(const MessageLoading("Please Wait! Sending Message"));

      messageRepository.createNewMessage(event.message);

      emit(MessageCreatedSuccessfully());
    });
  }

}