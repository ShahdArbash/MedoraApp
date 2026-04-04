import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medoraapp/features/chat/logic/cubit/chat_cubit.dart';
import 'package:medoraapp/features/chat/data/Services/chat_service.dart';
import 'package:medoraapp/features/chat/presentation/views/chat_viwe.dart';

class ScopeBotView extends StatelessWidget {
  const ScopeBotView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => ChatService(),
      child: BlocProvider(
        create: (context) =>
            ChatCubit(chatService: context.read<ChatService>()),
        child: const ChatView(),
      ),
    );
  }
}
