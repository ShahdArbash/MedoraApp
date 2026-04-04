# تطبيق ميدورا

تطبيق Flutter حديث مبني بمعمارية نظيفة، إدارة الحالة باستخدام BLoC، وركيزة قوية على تجربة المستخدم.
يتميز التطبيق بشاشة رئيسية مع شرائح ترويجية، ملفات شخصية، تدفقات المصادقة، ومكونات واجهة مستخدم قابلة لإعادة الاستخدام.

## الميزات

شريحة ترويجية: شريحة تفاعلية تعرض الترويجات مع التشغيل التلقائي والتنقل اليدوي.

شريط التطبيق المخصص: شريط تطبيق مخصص مع ملف شخصي للمستخدم، حالة عبر الإنترنت، والإشعارات.

مؤشر النقاط: نقاط متحركة لتنقل الشريحة.

المصادقة: تكامل تسجيل الدخول بـ Google ونماذج تسجيل دخول/تسجيل مخصصة.

حقول النموذج: مدخلات نموذج شاملة مع التحقق (البريد الإلكتروني، كلمة المرور، الاسم الكامل).

الأزرار المخصصة: مكونات أزرار قابلة لإعادة الاستخدام مع حالات التحميل.

مكونات النص: خط مناسب متسق للعناوين والأوصاف.

إدارة الحالة: مدعومة بـ BLoC للتعامل المتوقع مع الحالة.

التعريب: يدعم اللغات العربية والإنجليزية.

التصميم المتجاوب: محسن للأندرويد، iOS، الويب، والسطح المكتبي.

دعم RTL: دعم التخطيط من اليمين إلى اليسار للعربية.

## التقنيات المستخدمة

الإطار: Flutter

إدارة الحالة: BLoC (flutter_bloc)

مكونات واجهة المستخدم: Material Design، مكونات مخصصة

إدارة الأصول: مولد أصول Flutter

الخطوط: عائلة خطوط القاهرة

الأيقونات: أيقونات كوبرتينو، Flutter SVG

المصادقة: تسجيل الدخول بـ Google

مؤشرات التحميل: Flutter Spinkit

## التبعيات

تشمل التبعيات الرئيسية:

flutter_bloc: ^9.1.1 — إدارة الحالة

carousel_slider: ^5.1.1 — وظيفة الشريحة

google_sign_in: ^6.2.1 — المصادقة

flutter_svg: ^2.2.3 — دعم SVG

flutter_spinkit: ^5.2.2 — رسوم متحركة التحميل

equatable: ^2.0.7 — مقارنة القيم

## هيكل المشروع

```
lib/
├── constants/          # ثوابت التطبيق (الألوان، الخطوط، الأصول)
├── l10n/              # ملفات التعريب
├── presentation/
│   ├── Cubits/        # منطق BLoC
│   │   ├── Login/     # إدارة حالة تسجيل الدخول
│   │   ├── Promotions/ # إدارة حالة الترويجات
│   │   └── SignUp/    # إدارة حالة التسجيل
│   ├── Models/        # نماذج البيانات
│   ├── views/         # مكونات الشاشات
│   │   ├── home_view.dart
│   │   ├── login_view.dart
│   │   ├── signup_view.dart
│   │   └── splash_view.dart
│   └── Widgets/       # مكونات واجهة المستخدم القابلة لإعادة الاستخدام
│       ├── Buttons/   # مكونات الأزرار
│       ├── Form_Fields/ # مكونات حقول النموذج
│       ├── Home_View_Widgets/  # مكونات شاشة الرئيسية
│       ├── Login_View_Widgets/ # مكونات شاشة تسجيل الدخول
│       ├── Methods/   # طرق مساعدة
│       └── Texts/     # مكونات النص
└── main.dart          # نقطة دخول التطبيق
```

## نظرة عامة على المكونات

### مكونات شاشة الرئيسية

#### PromotionsSlider

الموقع: lib/presentation/Widgets/Home_View_Widgets/promotions_slider.dart

مكون حالة يعرض محتوى ترويجي في تنسيق شريحة.
يتكامل مع PromotionsCubit لإدارة الحالة.

الميزات الرئيسية:

تشغيل تلقائي للشريحة بفواصل 4 ثوانٍ

تنقل يدوي عبر مؤشر النقاط

عناصر نائبة للتحميل

معالجة الأخطاء

تصميم متجاوب مع تكبير الصفحة المركزية

إدارة الحالة:

PromotionsInitial: يظهر حالة التحميل

PromotionsLoading: يعرض واجهة نائبة

PromotionsSuccessful: يعرض الشريحة مع البيانات

PromotionsFailure: يظهر رسالة خطأ

#### CarouselDotsIndicator

الموقع: lib/presentation/Widgets/Home_View_Widgets/carousel_dots_indicator.dart

مكون عديم الحالة يوفر مؤشرات بصرية لتنقل الشريحة.

الميزات الرئيسية:

انتقالات نقطة متحركة

وظيفة النقر للتنقل

مظهر قابل للتخصيص

حجم نشط/غير نشط متجاوب

#### HomeAppBar

الموقع: lib/presentation/Widgets/Home_View_Widgets/home_app_bar .dart

مكون شريط تطبيق مخصص لشاشة الرئيسية.

الميزات الرئيسية:

صورة المستخدم مع حالة عبر الإنترنت

شارة الإشعارات

دعم RTL

إجراءات رد الاتصال

### مكونات الأزرار

#### GenericButton

الموقع: lib/presentation/Widgets/Buttons/generic_button.dart

مكون زر قابل للتخصيص بشكل كبير يدعم أنماط وحالات مختلفة.

الميزات الرئيسية:

ألوان وخطوط وأبعاد قابلة للتخصيص

حالة التحميل مع دوار

دعم الحدود

امتصاص المؤشر أثناء التحميل

#### LoginButtonAction

الموقع: lib/presentation/Widgets/Buttons/login_button_action.dart

زر متخصص لإجراءات تسجيل الدخول.

#### RegisterButton

الموقع: lib/presentation/Widgets/Buttons/register_button.dart

زر للوظائف التسجيل.

#### SignUpActionButton

الموقع: lib/presentation/Widgets/Buttons/signUp_action_button.dart

زر إجراء محدد لعمليات التسجيل.

#### TextButtonAction

الموقع: lib/presentation/Widgets/Buttons/text_button_action.dart

زر نصي للإجراءات الثانوية.

### مكونات حقول النموذج

#### BuildTextFormField

الموقع: lib/presentation/Widgets/Form_Fields/build_text_form_field.dart

حقل نص نموذج قابل للتخصيص مع دعم RTL والتحقق.

الميزات الرئيسية:

تحديد موقع الأيقونة حسب RTL/LTR

خط مخصص (القاهرة)

دعم التحقق

خيار أيقونة لاحقة

#### EmailField

الموقع: lib/presentation/Widgets/Form_Fields/email_field.dart

حقل نص متخصص لإدخال البريد الإلكتروني مع التحقق.

#### PasswordField

الموقع: lib/presentation/Widgets/Form_Fields/password_field.dart

حقل كلمة مرور مع تبديل الرؤية.

#### ConfirmPasswordField

الموقع: lib/presentation/Widgets/Form_Fields/confirm_password_field.dart

حقل لتأكيد كلمة المرور مع مطابقة التحقق.

#### FullNameField

الموقع: lib/presentation/Widgets/Form_Fields/full_name_field.dart

حقل نص لإدخال الاسم الكامل.

#### BasePasswordField

الموقع: lib/presentation/Widgets/Form_Fields/base_password_field.dart

تنفيذ أساسي لحقول كلمة المرور.

### مكونات شاشة تسجيل الدخول

#### GoogleSignInWidget

الموقع: lib/presentation/Widgets/Login_View_Widgets/google_sign_in_widget.dart

مكون لتكامل المصادقة بـ Google.

الميزات الرئيسية:

تكامل Google Sign-In API

دعم النص المعرب

معالجة الأخطاء مع الرسائل المنبثقة

تصميم دائري للصورة الرمزية

#### ForgotPassword

الموقع: lib/presentation/Widgets/Login_View_Widgets/forgot_password.dart

مكون لوظيفة استعادة كلمة المرور.

### مكونات النص

#### TitleText

الموقع: lib/presentation/Widgets/Texts/title_text.dart

مكون نص مصمم للعناوين باستخدام خط القاهرة.

الميزات الرئيسية:

خط مناسب

تباعد الحروف للجاذبية البصرية

#### DescriptionText

الموقع: lib/presentation/Widgets/Texts/discreption_text.dart

مكون لنص الوصف مع التصميم المناسب.

### طرق مساعدة

#### BuildFormCardDecoration

الموقع: lib/presentation/Widgets/Methods/biuld_form_card_decoration.dart

طريقة لإنشاء زخارف بطاقة متسقة للنماذج.

#### BuildBackgroundView

الموقع: lib/presentation/Widgets/Methods/build_background_view.dart

طريقة لبناء عروض الخلفية مع التصميم المتسق.

## نظرة عامة على الشاشات/العروض

### SplashView

الموقع: lib/presentation/views/splash_view.dart

الشاشة الأولية التي تعرض شعار التطبيق وتتعامل مع تهيئة التطبيق.

الميزات الرئيسية:

يعرض شعار التطبيق لمدة 3 ثوانٍ

تنقل تلقائي إلى شاشة تسجيل الدخول

تصميم نظيف ومبسط

تدفق التنقل: SplashView → LoginView

### LoginView

الموقع: lib/presentation/views/login_view.dart

شاشة المصادقة لتسجيل دخول المستخدم مع خيارات متعددة.

الميزات الرئيسية:

حقول نموذج البريد الإلكتروني وكلمة المرور

تكامل تسجيل الدخول بـ Google

وظيفة نسيت كلمة المرور

التحقق من النموذج

دعم التعريب

إدارة الحالة: LoginCubit يتعامل مع منطق المصادقة

تدفق التنقل: LoginView → HomeView (عند النجاح) | SignupView (التسجيل)

### SignupView

الموقع: lib/presentation/views/signup_view.dart

شاشة تسجيل المستخدم مع التحقق الشامل من النموذج.

الميزات الرئيسية:

حقول الاسم الكامل، البريد الإلكتروني، كلمة المرور، وتأكيد كلمة المرور

التحقق من مطابقة كلمة المرور

خيار تسجيل الدخول بـ Google

التحقق من النموذج ومعالجة الأخطاء

إدارة الحالة: SignupCubit يدير عملية التسجيل

تدفق التنقل: SignupView → HomeView (عند النجاح) | LoginView (العودة)

### HomeView

الموقع: lib/presentation/views/home_view.dart

شاشة التطبيق الرئيسية تعرض لوحة تحكم المستخدم والترويجات.

الميزات الرئيسية:

شريط تطبيق مخصص مع ملف المستخدم

شريحة محتوى ترويجي

تحميل البيانات في الوقت الفعلي

معالجة تفاعل المستخدم

إدارة الحالة: PromotionsCubit يتعامل مع جلب البيانات والحالة

تدفق التنقل: HomeView (شاشة التطبيق الرئيسية)

## تدفق تنقل التطبيق

```
إطلاق التطبيق
    ↓
SplashView (3 ثانية)
    ↓
LoginView
├── نجاح تسجيل الدخول → HomeView
├── التسجيل → SignupView
└── تسجيل الدخول بـ Google → HomeView

SignupView
├── نجاح التسجيل → HomeView
└── العودة إلى تسجيل الدخول → LoginView

HomeView
├── النقر على الملف الشخصي → شاشة الملف الشخصي (مستقبلي)
├── الإشعارات → شاشة الإشعارات (مستقبلي)
└── استخدام التطبيق
```

## نظرة عامة على البنية

يتبع التطبيق مبادئ المعمارية النظيفة مع فصل الاهتمامات:

طبقة العرض: العروض والمكونات تتعامل مع واجهة المستخدم

طبقة منطق الأعمال: Cubits تدير الحالة

طبقة البيانات: النماذج ومستودعات (تنفيذ مستقبلي)

طبقة الأساس: الثوابت، التعريب، والأدوات

نمط إدارة الحالة:

كل ميزة لها Cubit خاص بها (LoginCubit، SignupCubit، PromotionsCubit)

المكونات تستمع إلى تغييرات الحالة عبر BlocBuilder

الأحداث تثير انتقالات الحالة

واجهة المستخدم تتحدث تفاعلياً مع تغييرات الحالة

## التعريب والتدويل

يدعم التطبيق اللغات العربية والإنجليزية باستخدام i18n المدمج في Flutter.

اللغات المدعومة:

الإنجليزية (en)

العربية (ar) - مع دعم RTL

التنفيذ:

ملفات ARB: lib/l10n/app_*.arb

المحليات المولدة: lib/l10n/app_localizations_*.dart

المكونات تتكيف تلقائياً مع اتجاه النص بناءً على الإعدادات المحلية

## إدارة الأصول

تُدار الأصول من خلال ملف ثوابت مولد للسلامة النوعية.

أنواع الأصول:

الصور: الشعارات، صور الملف الشخصي، الصور الترويجية

الخطوط: عائلة خطوط القاهرة (عادي، عريض، إلخ)

الأيقونات: أيقونات SVG مخصصة

التوليد: يستخدم حزمة flutter_assets لتوليد lib/constants/assets.dart تلقائياً

## التحسينات المستقبلية

إدارة ملف المستخدم

نظام الإشعارات

دعم دون اتصال

الوضع المظلم

تكامل API الخلفي

الاختبار (اختبارات الوحدة والتكامل)

مراقبة الأداء

## البدء

### المتطلبات الأساسية

Flutter SDK ^3.10.1

Dart SDK (مضمن مع Flutter)

Android Studio / VS Code مع امتدادات Flutter

### التثبيت

استنساخ المستودع:
git clone <repository-url>
cd medoraapp

تثبيت التبعيات:
flutter pub get

تشغيل التطبيق:
flutter run

### التطوير

التحقق من الكود:
flutter analyze

الاختبار:
flutter test

توليد الأصول:
flutter pub run flutter_assets:generate

## الترخيص

هذا المشروع خاص وغير مخصص للتوزيع العام.

## المؤلفون

اسمك — التطوير الأولي

## الشكر والتقدير

فريق Flutter

مطوري مكتبة BLoC

المساهمين مفتوحي المصدر