import 'package:flutter/material.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/message_bubble.dart';

import '../../../../data/models/message_model.dart';

class ChatListView extends StatelessWidget {
  final List<MessageModel> messages;
  final ScrollController scrollController;

  const ChatListView({
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
        return MessageBubble(message: messages[newIndex]);
      },
    );
  }
}
