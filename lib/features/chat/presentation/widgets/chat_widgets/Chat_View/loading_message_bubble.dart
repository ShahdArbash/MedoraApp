import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medoraapp/features/chat/presentation/widgets/chat_widgets/Chat_View/build_bot_message_bubble.dart';

class LoadingMessageBubble extends StatelessWidget {
  const LoadingMessageBubble({super.key});
  @override
  Widget build(BuildContext context) {
    return buildBotMessageBubble(
      context,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SpinKitThreeBounce(color: Color(0xFF3E3E3E), size: 16.0),
        ],
      ),
    );
  }
}
