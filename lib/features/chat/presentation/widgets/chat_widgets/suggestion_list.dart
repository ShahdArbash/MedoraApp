import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/suggestion_bubble.dart';

import '../../../logic/cubit/chat_cubit.dart';
import '../../../data/models/message_model.dart';
import '../../../data/models/suggestion_category_model.dart';

class SuggestionList extends StatelessWidget {
  final SuggestionCategoryModel suggestionCategoryModel;
  final List<MessageModel> messages;
  final ChatCubit cubit;
  final bool closeOnSelect;

  const SuggestionList({
    super.key,
    required this.suggestionCategoryModel,
    required this.messages,
    required this.cubit,
    this.closeOnSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    final chatCubit = context.read<ChatCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(suggestionCategoryModel.icon),
          Text(suggestionCategoryModel.title),
          const SizedBox(height: 18),
          for (var suggestion in suggestionCategoryModel.suggestions)
            SuggestionBubble(
              question: suggestion.question,
              answer: suggestion.answer,
              messages: messages,
              closeOnSelect: closeOnSelect,
              cubit: chatCubit,
            ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}
