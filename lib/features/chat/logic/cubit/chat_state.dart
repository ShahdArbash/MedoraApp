import 'package:medoraapp/features/chat/data/models/message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {
  ChatLoading();
}

class ChatSuccess extends ChatState {
  final MessageModel message;

  ChatSuccess({required this.message});
}

enum ChatFailureReason {
  configuration,
  network,
  quotaExceeded,
  emptyResponse,
  unknown,
}

class ChatFailure extends ChatState {
  final ChatFailureReason reason;

  ChatFailure({required this.reason});
}
