import 'package:flutter/material.dart';
import 'package:medoraapp/constants/assets.dart';
import 'package:medoraapp/constants/colors.dart';

Widget buildBotMessageBubble(BuildContext context, {required Widget child}) {
  final isRtl = Directionality.of(context) == TextDirection.rtl;

  return Padding(
    padding: const EdgeInsets.only(right: 2, left: 16),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        children: [
          if (!isRtl) _buildAvatar(),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const ShapeDecoration(
              color: AppColors.botMessageBubbleColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            child: child,
          ),
          if (isRtl) _buildAvatar(),
        ],
      ),
    ),
  );
}

Widget _buildAvatar() {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: CircleAvatar(
      radius: 10,
      backgroundColor: AppColors.fieldBackgroundColor,
      child: ClipOval(
        child: Image.asset(
          Assets.chatBotBlueRobotIcon,
          width: 11,
          height: 17,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
