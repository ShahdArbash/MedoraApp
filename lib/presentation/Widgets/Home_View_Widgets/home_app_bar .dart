import 'package:flutter/material.dart';
import 'package:medoraapp/constants/fonts.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.userName,
    required this.profileImage,
    this.isOnline = false,
    this.notificationsCount = 0,
    this.onProfileTap,
    this.onNotificationsTap,
  });

  final String userName;
  final String profileImage;
  final bool isOnline; // ✅ Online Status
  final int notificationsCount; // 🔔 Badge count
  final VoidCallback? onProfileTap;
  final VoidCallback? onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    final theme = Theme.of(context);

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.5,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 16,
      title: Row(
        children: [
          // 👤 Profile Section with Online Indicator
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: onProfileTap,
            child: Row(
              textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        profileImage,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Online Indicator
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: isOnline ? Colors.green : Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.scaffoldBackgroundColor,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: isRTL
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      userName,
                      style: CairoFonts.semiBold(
                        fontSize: 14,
                        color:
                            theme.textTheme.bodyMedium?.color ?? Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),

          // 🔔 Notifications with Red Badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined),
                onPressed: onNotificationsTap,
              ),
              if (notificationsCount > 0)
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
