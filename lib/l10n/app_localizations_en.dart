// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Medora';

  @override
  String get welcome => 'Welcome to Medora App';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get profile => 'Profile';

  @override
  String get appointments => 'Appointments';

  @override
  String get chatBot => 'Bot';

  @override
  String get logout => 'Logout';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get submit => 'Submit';

  @override
  String get cancel => 'Cancel';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get loading => 'Loading...';

  @override
  String get noData => 'No data available';

  @override
  String get retry => 'Retry';

  @override
  String get fullName => 'Full Name';

  @override
  String get fullNameRequired => 'Please enter your name';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordTooShort => 'Password is too short';

  @override
  String get passwordWeakCriteria => 'Password is weak. It must meet at least 3 of the following: uppercase letter, lowercase letter, digit, special character.';

  @override
  String get passwordStrengthLabel => 'Password strength: ';

  @override
  String get passwordStrengthWeak => 'Weak';

  @override
  String get passwordMedium => 'Medium';

  @override
  String get passwordStrong => 'Strong';

  @override
  String get passwordRuleMinLength => 'At least 8 characters';

  @override
  String get passwordRuleUppercase => 'Contains uppercase letter';

  @override
  String get passwordRuleLowercase => 'Contains lowercase letter';

  @override
  String get passwordRuleDigit => 'Contains digit';

  @override
  String get passwordRuleSpecialChar => 'Contains special character';

  @override
  String get nameInvalidLength => 'Name must be at least 2 characters';

  @override
  String get nameInvalidChars => 'Name must contain only letters';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get loginError => 'Login failed. Please try again.';

  @override
  String get welcomeBack => 'Welcome back';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signInWithGoogle => 'Continue with Google account';

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get signupSuccess => 'Account created successfully';

  @override
  String get signupFailure => 'Failed to create account';

  @override
  String get signupTitle => 'Create a new account';

  @override
  String get authErrorInvalidCredentials => 'Invalid email or password';

  @override
  String get authErrorEmailTaken => 'This email is already in use';

  @override
  String get networkError => 'Check your internet connection';

  @override
  String get serverError => 'Server error. Please try again.';

  @override
  String get unexpectedError => 'Unexpected error. Please try again.';

  @override
  String get quotaExceeded => 'Usage limit exceeded. Please try again later.';

  @override
  String get configurationError => 'There is a problem with the app configuration.';

  @override
  String get emptyResponseError => 'No response received. Please try again.';

  @override
  String get testPrices => 'Lab Test Prices';

  @override
  String get uploadTest => 'Interpret Lab Test';

  @override
  String get bookAppointment => 'Book Appointment';

  @override
  String get promoSummerTitle => 'Summer Offer';

  @override
  String get promoSummerDescription => '50% off all products';

  @override
  String get promoWeekendTitle => 'Weekend Deals';

  @override
  String get promoWeekendDescription => 'Free delivery for orders over 100';

  @override
  String get promoNewProductTitle => 'New Product';

  @override
  String get promoNewProductDescription => 'Try the new product with a free gift';

  @override
  String get googleSignInSuccess => 'Signed in with Google';

  @override
  String get googleSignInFailed => 'Google Sign In failed';

  @override
  String get promotionsLoadFailed => 'Failed to load promotions';

  @override
  String get chatInputHint => 'Hi, how can I help you?';

  @override
  String get aiAssistantTitle => 'Your AI Assistant';

  @override
  String get suggestionCategoryBeforeTestTitle => 'Before the test';

  @override
  String get suggestionCategoryTestInfoTitle => 'About lab tests';

  @override
  String get suggestionCategoryInterpretResultsTitle => 'Interpreting results';

  @override
  String get suggestionBeforeTestQ1 => 'How many hours should I fast before a blood sugar test?';

  @override
  String get suggestionBeforeTestA1 => 'Usually 8–10 hours; only water is allowed.';

  @override
  String get suggestionBeforeTestQ2 => 'Does a lipid test require fasting?';

  @override
  String get suggestionBeforeTestA2 => 'Yes, 9–12 hours for accurate results.';

  @override
  String get suggestionBeforeTestQ3 => 'Can I drink water before the test?';

  @override
  String get suggestionBeforeTestA3 => 'Yes, water is allowed and may make the blood draw easier.';

  @override
  String get suggestionBeforeTestQ4 => 'Are coffee or tea allowed before the test?';

  @override
  String get suggestionBeforeTestA4 => 'No. Avoid them because they can affect the results.';

  @override
  String get suggestionBeforeTestQ5 => 'Do medications affect lab tests?';

  @override
  String get suggestionBeforeTestA5 => 'Some medications can. Ask your doctor before testing.';

  @override
  String get suggestionBeforeTestQ6 => 'Can I do tests during my period?';

  @override
  String get suggestionBeforeTestA6 => 'Some tests may be affected, but most basic blood tests are not.';

  @override
  String get suggestionBeforeTestQ7 => 'Can I eat before a thyroid test?';

  @override
  String get suggestionBeforeTestA7 => 'Usually no fasting is needed; it’s best done in the morning before medications.';

  @override
  String get suggestionTestInfoQ1 => 'What is a CBC test?';

  @override
  String get suggestionTestInfoA1 => 'A complete blood count measures red cells, white cells, hemoglobin, and platelets.';

  @override
  String get suggestionTestInfoQ2 => 'What is a fasting blood sugar test?';

  @override
  String get suggestionTestInfoA2 => 'It measures blood sugar after 8–10 hours of fasting to help diagnose diabetes.';

  @override
  String get suggestionTestInfoQ3 => 'What is a random blood sugar test?';

  @override
  String get suggestionTestInfoA3 => 'It measures blood sugar at any time without fasting.';

  @override
  String get suggestionTestInfoQ4 => 'What is a vitamin D test for?';

  @override
  String get suggestionTestInfoA4 => 'It measures vitamin D level for bone and immune health.';

  @override
  String get suggestionTestInfoQ5 => 'What does a thyroid test show?';

  @override
  String get suggestionTestInfoA5 => 'It shows thyroid activity and whether hormones are low or high.';

  @override
  String get suggestionTestInfoQ6 => 'What does a cholesterol test measure?';

  @override
  String get suggestionTestInfoA6 => 'It measures blood fats: HDL, LDL, and triglycerides.';

  @override
  String get suggestionTestInfoQ7 => 'What is an iron test?';

  @override
  String get suggestionTestInfoA7 => 'It measures iron level and helps diagnose anemia.';

  @override
  String get suggestionInterpretQ1 => 'What does high blood sugar mean?';

  @override
  String get suggestionInterpretA1 => 'It may indicate diabetes or poor blood sugar control.';

  @override
  String get suggestionInterpretQ2 => 'What does low hemoglobin mean?';

  @override
  String get suggestionInterpretA2 => 'It often indicates anemia due to low iron or vitamins.';

  @override
  String get suggestionInterpretQ3 => 'What do high white blood cells mean?';

  @override
  String get suggestionInterpretA3 => 'It often indicates inflammation or infection.';

  @override
  String get suggestionInterpretQ4 => 'What is the normal cholesterol level?';

  @override
  String get suggestionInterpretA4 => 'Total cholesterol is less than 200 mg/dL.';

  @override
  String get suggestionInterpretQ5 => 'What do high triglycerides mean?';

  @override
  String get suggestionInterpretA5 => 'It increases heart disease risk and is often related to diet or inactivity.';

  @override
  String get suggestionInterpretQ6 => 'What does low platelets mean?';

  @override
  String get suggestionInterpretA6 => 'It may increase bleeding risk and can indicate blood or bone marrow issues.';
}
