import 'package:flutter/material.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/failure_message_bubble.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/message_bubble.dart';

import '../../../../data/models/message_model.dart';

class FailureChatListView extends StatelessWidget {
  final List<MessageModel> messages;
  final ScrollController scrollController;

  const FailureChatListView({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        int newIndex = messages.length - (index + 1);
        if (index == 0) {
          return FailureMessageBubble(
            message: messages[newIndex],
            messages: messages,
          );
        } else {
          return MessageBubble(message: messages[newIndex]);
        }
      },
    );
  }
}
