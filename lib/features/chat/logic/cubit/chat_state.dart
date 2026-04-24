import 'package:medoraapp/features/chat/data/models/message_model.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccessState extends ChatState {
  final MessageModel message;
  ChatSuccessState({required this.message});
}

class ChatFailureState extends ChatState {
  final String message;
  ChatFailureState(this.message);
}
