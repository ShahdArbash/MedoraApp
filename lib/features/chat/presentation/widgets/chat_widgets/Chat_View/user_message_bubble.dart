import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/build_user_message_bubble.dart';

import '../../../../data/models/message_model.dart';

class UserMessageBubble extends StatelessWidget {
  final MessageModel message;

  const UserMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return buildUserMessageBubble(
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
