import 'package:flutter/material.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/bot_message_bubble.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/user_message_bubble.dart';

import '../../../../data/models/message_model.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return message.role == "user"
        ? UserMessageBubble(message: message)
        : BotMessageBubble(message: message);
  }
}
