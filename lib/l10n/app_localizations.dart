import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Medora'**
  String get appTitle;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Medora App'**
  String get welcome;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @appointments.
  ///
  /// In en, this message translates to:
  /// **'Appointments'**
  String get appointments;

  /// No description provided for @chatBot.
  ///
  /// In en, this message translates to:
  /// **'Bot'**
  String get chatBot;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noData;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get fullNameRequired;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password is too short'**
  String get passwordTooShort;

  /// No description provided for @passwordWeakCriteria.
  ///
  /// In en, this message translates to:
  /// **'Password is weak. It must meet at least 3 of the following: uppercase letter, lowercase letter, digit, special character.'**
  String get passwordWeakCriteria;

  /// No description provided for @passwordStrengthLabel.
  ///
  /// In en, this message translates to:
  /// **'Password strength: '**
  String get passwordStrengthLabel;

  /// No description provided for @passwordStrengthWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get passwordStrengthWeak;

  /// No description provided for @passwordMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get passwordMedium;

  /// No description provided for @passwordStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get passwordStrong;

  /// No description provided for @passwordRuleMinLength.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get passwordRuleMinLength;

  /// No description provided for @passwordRuleUppercase.
  ///
  /// In en, this message translates to:
  /// **'Contains uppercase letter'**
  String get passwordRuleUppercase;

  /// No description provided for @passwordRuleLowercase.
  ///
  /// In en, this message translates to:
  /// **'Contains lowercase letter'**
  String get passwordRuleLowercase;

  /// No description provided for @passwordRuleDigit.
  ///
  /// In en, this message translates to:
  /// **'Contains digit'**
  String get passwordRuleDigit;

  /// No description provided for @passwordRuleSpecialChar.
  ///
  /// In en, this message translates to:
  /// **'Contains special character'**
  String get passwordRuleSpecialChar;

  /// No description provided for @nameInvalidLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters'**
  String get nameInvalidLength;

  /// No description provided for @nameInvalidChars.
  ///
  /// In en, this message translates to:
  /// **'Name must contain only letters'**
  String get nameInvalidChars;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginError;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcomeBack;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google account'**
  String get signInWithGoogle;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @signupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get signupSuccess;

  /// No description provided for @signupFailure.
  ///
  /// In en, this message translates to:
  /// **'Failed to create account'**
  String get signupFailure;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get signupTitle;

  /// No description provided for @authErrorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get authErrorInvalidCredentials;

  /// No description provided for @authErrorEmailTaken.
  ///
  /// In en, this message translates to:
  /// **'This email is already in use'**
  String get authErrorEmailTaken;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection'**
  String get networkError;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again.'**
  String get serverError;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error. Please try again.'**
  String get unexpectedError;

  /// No description provided for @quotaExceeded.
  ///
  /// In en, this message translates to:
  /// **'Usage limit exceeded. Please try again later.'**
  String get quotaExceeded;

  /// No description provided for @configurationError.
  ///
  /// In en, this message translates to:
  /// **'There is a problem with the app configuration.'**
  String get configurationError;

  /// No description provided for @emptyResponseError.
  ///
  /// In en, this message translates to:
  /// **'No response received. Please try again.'**
  String get emptyResponseError;

  /// No description provided for @testPrices.
  ///
  /// In en, this message translates to:
  /// **'Lab Test Prices'**
  String get testPrices;

  /// No description provided for @uploadTest.
  ///
  /// In en, this message translates to:
  /// **'Interpret Lab Test'**
  String get uploadTest;

  /// No description provided for @bookAppointment.
  ///
  /// In en, this message translates to:
  /// **'Book Appointment'**
  String get bookAppointment;

  /// No description provided for @promoSummerTitle.
  ///
  /// In en, this message translates to:
  /// **'Summer Offer'**
  String get promoSummerTitle;

  /// No description provided for @promoSummerDescription.
  ///
  /// In en, this message translates to:
  /// **'50% off all products'**
  String get promoSummerDescription;

  /// No description provided for @promoWeekendTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekend Deals'**
  String get promoWeekendTitle;

  /// No description provided for @promoWeekendDescription.
  ///
  /// In en, this message translates to:
  /// **'Free delivery for orders over 100'**
  String get promoWeekendDescription;

  /// No description provided for @promoNewProductTitle.
  ///
  /// In en, this message translates to:
  /// **'New Product'**
  String get promoNewProductTitle;

  /// No description provided for @promoNewProductDescription.
  ///
  /// In en, this message translates to:
  /// **'Try the new product with a free gift'**
  String get promoNewProductDescription;

  /// No description provided for @googleSignInSuccess.
  ///
  /// In en, this message translates to:
  /// **'Signed in with Google'**
  String get googleSignInSuccess;

  /// No description provided for @googleSignInFailed.
  ///
  /// In en, this message translates to:
  /// **'Google Sign In failed'**
  String get googleSignInFailed;

  /// No description provided for @promotionsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load promotions'**
  String get promotionsLoadFailed;

  /// No description provided for @chatInputHint.
  ///
  /// In en, this message translates to:
  /// **'Hi, how can I help you?'**
  String get chatInputHint;

  /// No description provided for @aiAssistantTitle.
  ///
  /// In en, this message translates to:
  /// **'Your AI Assistant'**
  String get aiAssistantTitle;

  /// No description provided for @suggestionCategoryBeforeTestTitle.
  ///
  /// In en, this message translates to:
  /// **'Before the test'**
  String get suggestionCategoryBeforeTestTitle;

  /// No description provided for @suggestionCategoryTestInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'About lab tests'**
  String get suggestionCategoryTestInfoTitle;

  /// No description provided for @suggestionCategoryInterpretResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'Interpreting results'**
  String get suggestionCategoryInterpretResultsTitle;

  /// No description provided for @suggestionBeforeTestQ1.
  ///
  /// In en, this message translates to:
  /// **'How many hours should I fast before a blood sugar test?'**
  String get suggestionBeforeTestQ1;

  /// No description provided for @suggestionBeforeTestA1.
  ///
  /// In en, this message translates to:
  /// **'Usually 8–10 hours; only water is allowed.'**
  String get suggestionBeforeTestA1;

  /// No description provided for @suggestionBeforeTestQ2.
  ///
  /// In en, this message translates to:
  /// **'Does a lipid test require fasting?'**
  String get suggestionBeforeTestQ2;

  /// No description provided for @suggestionBeforeTestA2.
  ///
  /// In en, this message translates to:
  /// **'Yes, 9–12 hours for accurate results.'**
  String get suggestionBeforeTestA2;

  /// No description provided for @suggestionBeforeTestQ3.
  ///
  /// In en, this message translates to:
  /// **'Can I drink water before the test?'**
  String get suggestionBeforeTestQ3;

  /// No description provided for @suggestionBeforeTestA3.
  ///
  /// In en, this message translates to:
  /// **'Yes, water is allowed and may make the blood draw easier.'**
  String get suggestionBeforeTestA3;

  /// No description provided for @suggestionBeforeTestQ4.
  ///
  /// In en, this message translates to:
  /// **'Are coffee or tea allowed before the test?'**
  String get suggestionBeforeTestQ4;

  /// No description provided for @suggestionBeforeTestA4.
  ///
  /// In en, this message translates to:
  /// **'No. Avoid them because they can affect the results.'**
  String get suggestionBeforeTestA4;

  /// No description provided for @suggestionBeforeTestQ5.
  ///
  /// In en, this message translates to:
  /// **'Do medications affect lab tests?'**
  String get suggestionBeforeTestQ5;

  /// No description provided for @suggestionBeforeTestA5.
  ///
  /// In en, this message translates to:
  /// **'Some medications can. Ask your doctor before testing.'**
  String get suggestionBeforeTestA5;

  /// No description provided for @suggestionBeforeTestQ6.
  ///
  /// In en, this message translates to:
  /// **'Can I do tests during my period?'**
  String get suggestionBeforeTestQ6;

  /// No description provided for @suggestionBeforeTestA6.
  ///
  /// In en, this message translates to:
  /// **'Some tests may be affected, but most basic blood tests are not.'**
  String get suggestionBeforeTestA6;

  /// No description provided for @suggestionBeforeTestQ7.
  ///
  /// In en, this message translates to:
  /// **'Can I eat before a thyroid test?'**
  String get suggestionBeforeTestQ7;

  /// No description provided for @suggestionBeforeTestA7.
  ///
  /// In en, this message translates to:
  /// **'Usually no fasting is needed; it’s best done in the morning before medications.'**
  String get suggestionBeforeTestA7;

  /// No description provided for @suggestionTestInfoQ1.
  ///
  /// In en, this message translates to:
  /// **'What is a CBC test?'**
  String get suggestionTestInfoQ1;

  /// No description provided for @suggestionTestInfoA1.
  ///
  /// In en, this message translates to:
  /// **'A complete blood count measures red cells, white cells, hemoglobin, and platelets.'**
  String get suggestionTestInfoA1;

  /// No description provided for @suggestionTestInfoQ2.
  ///
  /// In en, this message translates to:
  /// **'What is a fasting blood sugar test?'**
  String get suggestionTestInfoQ2;

  /// No description provided for @suggestionTestInfoA2.
  ///
  /// In en, this message translates to:
  /// **'It measures blood sugar after 8–10 hours of fasting to help diagnose diabetes.'**
  String get suggestionTestInfoA2;

  /// No description provided for @suggestionTestInfoQ3.
  ///
  /// In en, this message translates to:
  /// **'What is a random blood sugar test?'**
  String get suggestionTestInfoQ3;

  /// No description provided for @suggestionTestInfoA3.
  ///
  /// In en, this message translates to:
  /// **'It measures blood sugar at any time without fasting.'**
  String get suggestionTestInfoA3;

  /// No description provided for @suggestionTestInfoQ4.
  ///
  /// In en, this message translates to:
  /// **'What is a vitamin D test for?'**
  String get suggestionTestInfoQ4;

  /// No description provided for @suggestionTestInfoA4.
  ///
  /// In en, this message translates to:
  /// **'It measures vitamin D level for bone and immune health.'**
  String get suggestionTestInfoA4;

  /// No description provided for @suggestionTestInfoQ5.
  ///
  /// In en, this message translates to:
  /// **'What does a thyroid test show?'**
  String get suggestionTestInfoQ5;

  /// No description provided for @suggestionTestInfoA5.
  ///
  /// In en, this message translates to:
  /// **'It shows thyroid activity and whether hormones are low or high.'**
  String get suggestionTestInfoA5;

  /// No description provided for @suggestionTestInfoQ6.
  ///
  /// In en, this message translates to:
  /// **'What does a cholesterol test measure?'**
  String get suggestionTestInfoQ6;

  /// No description provided for @suggestionTestInfoA6.
  ///
  /// In en, this message translates to:
  /// **'It measures blood fats: HDL, LDL, and triglycerides.'**
  String get suggestionTestInfoA6;

  /// No description provided for @suggestionTestInfoQ7.
  ///
  /// In en, this message translates to:
  /// **'What is an iron test?'**
  String get suggestionTestInfoQ7;

  /// No description provided for @suggestionTestInfoA7.
  ///
  /// In en, this message translates to:
  /// **'It measures iron level and helps diagnose anemia.'**
  String get suggestionTestInfoA7;

  /// No description provided for @suggestionInterpretQ1.
  ///
  /// In en, this message translates to:
  /// **'What does high blood sugar mean?'**
  String get suggestionInterpretQ1;

  /// No description provided for @suggestionInterpretA1.
  ///
  /// In en, this message translates to:
  /// **'It may indicate diabetes or poor blood sugar control.'**
  String get suggestionInterpretA1;

  /// No description provided for @suggestionInterpretQ2.
  ///
  /// In en, this message translates to:
  /// **'What does low hemoglobin mean?'**
  String get suggestionInterpretQ2;

  /// No description provided for @suggestionInterpretA2.
  ///
  /// In en, this message translates to:
  /// **'It often indicates anemia due to low iron or vitamins.'**
  String get suggestionInterpretA2;

  /// No description provided for @suggestionInterpretQ3.
  ///
  /// In en, this message translates to:
  /// **'What do high white blood cells mean?'**
  String get suggestionInterpretQ3;

  /// No description provided for @suggestionInterpretA3.
  ///
  /// In en, this message translates to:
  /// **'It often indicates inflammation or infection.'**
  String get suggestionInterpretA3;

  /// No description provided for @suggestionInterpretQ4.
  ///
  /// In en, this message translates to:
  /// **'What is the normal cholesterol level?'**
  String get suggestionInterpretQ4;

  /// No description provided for @suggestionInterpretA4.
  ///
  /// In en, this message translates to:
  /// **'Total cholesterol is less than 200 mg/dL.'**
  String get suggestionInterpretA4;

  /// No description provided for @suggestionInterpretQ5.
  ///
  /// In en, this message translates to:
  /// **'What do high triglycerides mean?'**
  String get suggestionInterpretQ5;

  /// No description provided for @suggestionInterpretA5.
  ///
  /// In en, this message translates to:
  /// **'It increases heart disease risk and is often related to diet or inactivity.'**
  String get suggestionInterpretA5;

  /// No description provided for @suggestionInterpretQ6.
  ///
  /// In en, this message translates to:
  /// **'What does low platelets mean?'**
  String get suggestionInterpretQ6;

  /// No description provided for @suggestionInterpretA6.
  ///
  /// In en, this message translates to:
  /// **'It may increase bleeding risk and can indicate blood or bone marrow issues.'**
  String get suggestionInterpretA6;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
