import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/build_user_message_bubble.dart';

import '../../../../../../constants/colors.dart';
import '../../../../logic/cubit/chat_cubit.dart';
import '../../../../data/models/message_model.dart';

class FailureMessageBubble extends StatelessWidget {
  final MessageModel message;
  final List<MessageModel> messages;

  const FailureMessageBubble({
    super.key,
    required this.message,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            messages.removeLast();

            messages.add(
              MessageModel(
                role: 'user',
                parts: [MessagePart(text: message.text)],
              ),
            );
            context.read<ChatCubit>().sendMessage(messages);
          },
          icon: const Icon(Icons.refresh, color: Colors.white, size: 18),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          style: IconButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),

        buildUserMessageBubble(
          color: AppColors.botMessageBubbleColor,
          child: Text(
            message.text,
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
