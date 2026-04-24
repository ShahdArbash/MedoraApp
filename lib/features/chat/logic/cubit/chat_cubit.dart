import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/core/error/api_exception.dart';
import 'package:medoraapp/features/chat/data/Services/chat_service.dart';
import 'package:medoraapp/features/chat/data/models/message_model.dart';
import 'package:medoraapp/features/chat/logic/cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatService chatService;

  ChatCubit({required this.chatService}) : super(ChatInitialState());

  void addLocalMessage(MessageModel message) {
    emit(ChatSuccessState(message: message));
  }

  Future<void> sendMessage(List<MessageModel> messages) async {
    emit(ChatLoading());

    try {
      final response = await chatService.sendMessage(messages);
      emit(ChatSuccessState(message: response));
    } on ApiException catch (e) {
      emit(ChatFailureState(e.userMessage));
    } catch (_) {
      emit(ChatFailureState("Unexpected error"));
    }
  }
}
