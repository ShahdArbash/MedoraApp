import 'package:flutter/material.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/loading_message_bubble.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/message_bubble.dart';

import '../../../../data/models/message_model.dart';

class LoadingChatListView extends StatelessWidget {
  final List<MessageModel> messages;
  final ScrollController scrollController;

  const LoadingChatListView({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: scrollController,
      itemCount: messages.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const LoadingMessageBubble();
        }
        int newIndex = messages.length - (index + 0);
        return MessageBubble(message: messages[newIndex]);
      },
    );
  }
}
