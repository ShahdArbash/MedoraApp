import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/chat_cubit.dart';
import '../../../data/models/message_model.dart';

class SuggestionBubble extends StatelessWidget {
  final String question;
  final String answer;
  final List<MessageModel> messages;
  final ChatCubit cubit; // 👈 نمرر الكيوبت
  final bool closeOnSelect;

  const SuggestionBubble({
    super.key,
    required this.question,
    required this.answer,
    required this.messages,
    required this.cubit,
    this.closeOnSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            messages.add(
              MessageModel(
                role: "user",
                parts: [MessagePart(text: question)],
              ),
            );

            cubit.addLocalMessage(
              MessageModel(
                role: "model",
                parts: [MessagePart(text: answer)],
              ),
            );

            if (closeOnSelect && Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Center(
              child: Text(
                question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF3D3D3D),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
