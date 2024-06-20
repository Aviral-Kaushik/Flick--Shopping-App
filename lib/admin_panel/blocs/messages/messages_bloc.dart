import 'package:flick/admin_panel/blocs/messages/messages_event.dart';
import 'package:flick/admin_panel/blocs/messages/messages_state.dart';
import 'package:flick/admin_panel/repositories/messages_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {

  final MessageRepository messageRepository;

  MessagesBloc(this.messageRepository) : super(MessageInitial()) {
    on<FetchAllMessages>((event, emit) async {
      emit(MessageLoading("Fetching messages! Please wait"));
      final messages = await messageRepository.fetchAllMessages();
      emit(MessageFetched(messages));
    });
    on<SendReplyEmail>((event, emit) async {
      emit(MessageLoading("Sending Reply! Please wait"));
      final isReplySentSuccessfully = await messageRepository.sendReplyEmail(
        event.userEmail,
        event.replyMessage
      );
      if (isReplySentSuccessfully) {
        emit(ReplyEmailSentSuccessfully());
      } else {
        emit(MessageError("Failure sending reply email", false));
      }
    });
  }

}