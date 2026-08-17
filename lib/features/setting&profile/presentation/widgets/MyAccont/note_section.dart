import 'package:flutter/material.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/MyAccont/header_title.dart';
import 'package:medoraapp/features/setting&profile/presentation/widgets/MyAccont/note_card.dart';

class NoteSection extends StatelessWidget {
  final String note;
  const NoteSection({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        HeaderTitle(
          title: "الملاحظات الطبية",
          icon: Icons.edit_calendar_rounded,
        ),
        NoteCard(text: note),
      ],
    );
  }
}
