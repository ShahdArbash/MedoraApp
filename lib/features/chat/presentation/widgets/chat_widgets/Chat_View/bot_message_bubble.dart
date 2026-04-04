import 'package:flutter/material.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/build_bot_message_bubble.dart';

import '../../../../../../constants/colors.dart';
import '../../../../data/models/message_model.dart';

class BotMessageBubble extends StatelessWidget {
  final MessageModel message;

  const BotMessageBubble({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return buildBotMessageBubble(
      context,
      child: Text(
        message.text.trim().isEmpty ? "the text is empty" : message.text,
        style: const TextStyle(
          color: AppColors.whiteColor,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
