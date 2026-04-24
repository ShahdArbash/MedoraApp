import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/l10n/app_localizations.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/fonts.dart';
import '../../../../logic/cubit/chat_cubit.dart';
import '../../../../logic/cubit/chat_state.dart';
import '../../../../data/models/message_model.dart';
import '../../../../data/models/suggestion_category_model.dart';
import '../suggestion_list.dart';

class ChatInputField extends StatefulWidget {
  final List<MessageModel> messages;

  const ChatInputField({super.key, required this.messages});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void send() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      if (context.read<ChatCubit>().state is ChatFailureState) {
        widget.messages.removeLast();
      }
      widget.messages.add(
        MessageModel(
          role: 'user',
          parts: [MessagePart(text: text)],
        ),
      );

      context.read<ChatCubit>().sendMessage(widget.messages);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 22),
        decoration: BoxDecoration(
          color: AppColors.backgroundtextfildeChatColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color(0x21000000),
              blurRadius: 20,
              offset: Offset(5, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // مربع النص
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.chatInputHint,
                  hintStyle: CairoFonts.bold(
                    color: AppColors.primaryColorChat,
                    fontSize: AppFont.chatInputHint,
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => send(),
              ),
            ),

            IconButton(
              onPressed: () {
                _focusNode.unfocus();
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (sheetContext) {
                    final categories = getSuggestionCategories(
                      AppLocalizations.of(sheetContext)!,
                    );
                    return BlocProvider.value(
                      value: context.read<ChatCubit>(),
                      child: SafeArea(
                        child: SizedBox(
                          height: MediaQuery.of(sheetContext).size.height * 0.7,
                          child: ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return SuggestionList(
                                suggestionCategoryModel: categories[index],
                                messages: widget.messages,
                                closeOnSelect: true,
                                cubit: context.read<ChatCubit>(),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.lightbulb_outline,
                color: AppColors.primaryColorChat,
                size: 24,
              ),
            ),

            // زر الإرسال
            IconButton(
              onPressed: () {
                _focusNode.unfocus();
                send();
              },
              icon: Icon(
                Icons.send,
                color: AppColors.primaryColorChat,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
