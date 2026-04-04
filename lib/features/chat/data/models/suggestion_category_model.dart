import 'package:medoraapp/l10n/app_localizations.dart';
import 'package:medoraapp/constants/assets.dart';

class SuggestionItem {
  final String question;
  final String answer;

  const SuggestionItem({required this.question, required this.answer});
}

class SuggestionCategoryModel {
  final String title;
  final String icon;
  final List<SuggestionItem> suggestions;

  const SuggestionCategoryModel({
    required this.title,
    required this.icon,
    this.suggestions = const [],
  });
}

List<SuggestionCategoryModel> getSuggestionCategories(AppLocalizations l10n) {
  return [
    SuggestionCategoryModel(
      title: l10n.suggestionCategoryBeforeTestTitle,
      icon: Assets.chatBotExplain,
      suggestions: [
        SuggestionItem(
          question: l10n.suggestionBeforeTestQ1,
          answer: l10n.suggestionBeforeTestA1,
        ),
        SuggestionItem(
          question: l10n.suggestionBeforeTestQ2,
          answer: l10n.suggestionBeforeTestA2,
        ),
        SuggestionItem(
          question: l10n.suggestionBeforeTestQ3,
          answer: l10n.suggestionBeforeTestA3,
        ),
        SuggestionItem(
          question: l10n.suggestionBeforeTestQ4,
          answer: l10n.suggestionBeforeTestA4,
        ),
        SuggestionItem(
          question: l10n.suggestionBeforeTestQ5,
          answer: l10n.suggestionBeforeTestA5,
        ),
        SuggestionItem(
          question: l10n.suggestionBeforeTestQ6,
          answer: l10n.suggestionBeforeTestA6,
        ),
        SuggestionItem(
          question: l10n.suggestionBeforeTestQ7,
          answer: l10n.suggestionBeforeTestA7,
        ),
      ],
    ),
    SuggestionCategoryModel(
      title: l10n.suggestionCategoryTestInfoTitle,
      icon: Assets.chatBotEdit2,
      suggestions: [
        SuggestionItem(
          question: l10n.suggestionTestInfoQ1,
          answer: l10n.suggestionTestInfoA1,
        ),
        SuggestionItem(
          question: l10n.suggestionTestInfoQ2,
          answer: l10n.suggestionTestInfoA2,
        ),
        SuggestionItem(
          question: l10n.suggestionTestInfoQ3,
          answer: l10n.suggestionTestInfoA3,
        ),
        SuggestionItem(
          question: l10n.suggestionTestInfoQ4,
          answer: l10n.suggestionTestInfoA4,
        ),
        SuggestionItem(
          question: l10n.suggestionTestInfoQ5,
          answer: l10n.suggestionTestInfoA5,
        ),
        SuggestionItem(
          question: l10n.suggestionTestInfoQ6,
          answer: l10n.suggestionTestInfoA6,
        ),
        SuggestionItem(
          question: l10n.suggestionTestInfoQ7,
          answer: l10n.suggestionTestInfoA7,
        ),
      ],
    ),
    SuggestionCategoryModel(
      title: l10n.suggestionCategoryInterpretResultsTitle,
      icon: Assets.chatBotTranslate,
      suggestions: [
        SuggestionItem(
          question: l10n.suggestionInterpretQ1,
          answer: l10n.suggestionInterpretA1,
        ),
        SuggestionItem(
          question: l10n.suggestionInterpretQ2,
          answer: l10n.suggestionInterpretA2,
        ),
        SuggestionItem(
          question: l10n.suggestionInterpretQ3,
          answer: l10n.suggestionInterpretA3,
        ),
        SuggestionItem(
          question: l10n.suggestionInterpretQ4,
          answer: l10n.suggestionInterpretA4,
        ),
        SuggestionItem(
          question: l10n.suggestionInterpretQ5,
          answer: l10n.suggestionInterpretA5,
        ),
        SuggestionItem(
          question: l10n.suggestionInterpretQ6,
          answer: l10n.suggestionInterpretA6,
        ),
      ],
    ),
  ];
}
