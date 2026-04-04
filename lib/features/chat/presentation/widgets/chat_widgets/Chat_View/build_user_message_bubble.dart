import 'package:flutter/material.dart';
import 'package:medoraapp/constants/colors.dart';

class buildUserMessageBubble extends StatelessWidget {
  final Widget child;
  final Color color;
  const buildUserMessageBubble({
    super.key,
    required this.child,
    this.color = AppColors.primaryColorChat,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 2),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(2),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
