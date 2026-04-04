import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/presentation/Widgets/Home_View_Widgets/home_app_bar%20.dart';
import '../../../../constants/assets.dart';
import '../../logic/cubit/chat_cubit.dart';
import '../../logic/cubit/chat_state.dart';
import '../../data/models/message_model.dart';
import '../../data/models/suggestion_category_model.dart';
import '../widgets/chat_widgets/Chat_View/chat_input_field.dart';
import '../widgets/chat_widgets/Chat_View/chat_list_view.dart';
import '../widgets/chat_widgets/Chat_View/failuer_chat_list_view.dart';
import '../widgets/chat_widgets/Chat_View/loading_chat_list_view.dart';
import '../widgets/chat_widgets/suggestion_list.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final ScrollController scrollController = ScrollController();
  final List<MessageModel> messages = [];

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(
              userName: 'شهد عربش',
              profileImage: Assets.profile,
              isOnline: true,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocConsumer<ChatCubit, ChatState>(
                listener: (context, state) {
                  if (state is ChatSuccess) {
                    messages.add(state.message);
                    scrollToBottom();
                  }
                  if (state is ChatFailure) {
                    final l10n = AppLocalizations.of(context)!;
                    final text = switch (state.reason) {
                      ChatFailureReason.configuration =>
                        l10n.configurationError,
                      ChatFailureReason.network => l10n.networkError,
                      ChatFailureReason.quotaExceeded => l10n.quotaExceeded,
                      ChatFailureReason.emptyResponse =>
                        l10n.emptyResponseError,
                      ChatFailureReason.unknown => l10n.unexpectedError,
                    };
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(text),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ChatLoading) {
                    return LoadingChatListView(
                      messages: messages,
                      scrollController: scrollController,
                    );
                  } else if (state is ChatSuccess) {
                    return ChatListView(
                      messages: messages,
                      scrollController: scrollController,
                    );
                  } else if (state is ChatFailure) {
                    return FailureChatListView(
                      messages: messages,
                      scrollController: scrollController,
                    );
                  } else {
                    // الاقتراحات
                    final categories = getSuggestionCategories(
                      AppLocalizations.of(context)!,
                    );
                    final chatCubit = context.read<ChatCubit>();

                    return ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return SuggestionList(
                          suggestionCategoryModel: categories[index],
                          messages: messages,
                          cubit: chatCubit,
                        );
                      },
                    );
                  }
                },
              ),
            ),
            ChatInputField(messages: messages),
          ],
        ),
      ),
    );
  }
}
