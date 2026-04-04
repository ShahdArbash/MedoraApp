import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/chat/logic/cubit/chat_state.dart';
import 'package:medoraapp/features/chat/data/Services/chat_service.dart';
import 'package:medoraapp/features/chat/data/models/message_model.dart';

import '../../../../core/error/server_exception.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatService chatService;

  ChatCubit({required this.chatService}) : super(ChatInitial());

  void addLocalMessage(MessageModel message) {
    emit(ChatSuccess(message: message));
  }

  Future<void> sendMessage(List<MessageModel> allMessages) async {
    emit(ChatLoading());
    try {
      final message = await chatService.sendMessage(allMessages);
      emit(ChatSuccess(message: message));
    } on ServerException catch (e) {
      emit(ChatFailure(reason: _mapFailureReason(e.type)));
    } catch (e) {
      emit(ChatFailure(reason: ChatFailureReason.unknown));
    }
  }
}

ChatFailureReason _mapFailureReason(ServerExceptionType type) {
  switch (type) {
    case ServerExceptionType.configuration:
      return ChatFailureReason.configuration;
    case ServerExceptionType.network:
      return ChatFailureReason.network;
    case ServerExceptionType.quotaExceeded:
      return ChatFailureReason.quotaExceeded;
    case ServerExceptionType.emptyResponse:
      return ChatFailureReason.emptyResponse;
    case ServerExceptionType.unknown:
      return ChatFailureReason.unknown;
  }
}
