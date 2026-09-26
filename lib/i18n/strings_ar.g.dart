///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	@override dynamic operator[](String key) => _meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'دكتور هانت';
	@override String get kContinue => 'متابعة';
	@override String get next => 'التالي';
	@override String get skip => 'تخطي';
	@override String get getStarted => 'ابدأ الآن';
	@override String get resencode => 'إعادة إرسال الرمز';
	@override String get live => 'مباشر';
	@override String get hours => 'ساعة';
	@override String get error => 'حدث خطأ ما';
	@override String get loading => 'جارٍ التحميل...';
	@override String get seeall => 'عرض الكل';
	@override late final _Translations$onboarding$ar onboarding = _Translations$onboarding$ar._(_root);
	@override String get chooseRole => 'اختر دورك';
	@override String get selectedRole => 'يحدد الدور الذي تختاره تجربتك والميزات المتاحة لك.';
	@override String get patient => 'مريض';
	@override String get findDoctorbook => 'ابحث عن الأطباء، واحجز المواعيد، وأدر سجلاتك الطبية.';
	@override String get admin => 'مسؤول';
	@override String get manageDoctors => 'إدارة الأطباء والمواعيد والمستخدمين والمنصة.';
	@override String get signUpTitle => 'انضم إلينا للعثور على الطبيب المناسب';
	@override String get createAccountDescription => 'أنشئ حسابًا للعثور على أطباء موثوقين، واستكشاف تخصصاتهم، وحجز المواعيد بسهولة.';
	@override String get loginDescription => 'اعثر على أطباء موثوقين، واستكشف التخصصات، وأدر مواعيدك بسهولة.';
	@override String get passworddonotmatch => 'كلمتا المرور غير متطابقتين';
	@override String get confirmepassword => 'تأكيد كلمة المرور';
	@override String get creatNewPassword => 'أنشئ كلمة مرور جديدة لحسابك.';
	@override String get logIn => 'تسجيل الدخول';
	@override String get signUp => 'إنشاء حساب';
	@override String get google => 'Google';
	@override String get facebook => 'Facebook';
	@override String get name => 'الاسم';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get forgotPassword => 'نسيت كلمة المرور';
	@override String get agreeAndPrivacy => 'أوافق على شروط الخدمة وسياسة الخصوصية';
	@override String get haveAccount => 'لديك حساب بالفعل؟';
	@override String get doNotHaveAccount => 'ليس لديك حساب؟';
	@override String get welcome => 'مرحبًا بعودتك';
	@override String get join => 'انضم إلينا';
	@override String get exampleEmail => 'itsmemamun1@gmail.com';
	@override String get emailVerification => 'أدخل بريدك الإلكتروني لإتمام عملية التحقق. سنرسل رمزًا مكونًا من 4 أرقام إلى بريدك الإلكتروني.';
	@override String get enterDigit => 'أدخل الرمز المكون من 4 أرقام';
	@override String get enterReceivedDigit => 'أدخل الرمز المكون من 4 أرقام الذي وصلك عبر بريدك الإلكتروني.';
	@override String get reset => 'إعادة تعيين كلمة المرور';
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get reenterPassword => 'أعد إدخال كلمة المرور';
	@override String get entername => 'يرجى إدخال اسمك';
	@override String get enterEmail => 'يرجى إدخال بريدك الإلكتروني';
	@override String get enterPassword => 'يرجى إدخال كلمة المرور';
	@override String get passwordSuccess => 'تمت إعادة تعيين كلمة المرور بنجاح';
	@override String get somethingwentwrong => 'حدث خطأ ما';
	@override String get hihand => 'مرحبًا Handwerker! ';
	@override String get findDoctor => 'اعثر على طبيبك';
	@override String get search => 'بحث';
	@override String get liveDoctor => 'أطباء مباشرون';
	@override String get popularDoctor => 'الأطباء الأكثر شعبية';
	@override String get seeAll => 'عرض الكل';
	@override String get drFill => 'د. Fillerup Grab';
	@override String get medicineSpecialist => 'اختصاصي طب';
	@override String get drBlessing => 'د. Blessing';
	@override String get dentistspecialist => 'اختصاصي طب الأسنان';
	@override String get featureDoctor => 'أطباء مميزون';
	@override String get drCrick => 'د. Crick';
	@override String get k25hours => '\$ 25.00/ساعة';
	@override String get drstrain => 'د. Strain';
	@override String get k22hours => '\$ 22.00/ساعة';
	@override String get drlachinet => 'د. Lachinet';
	@override String get k29hours => '\$ 29.00/ساعة';
	@override String get doctorDetails => 'تفاصيل الطبيب';
	@override String get drPediatrician => 'د. Pediatrician';
	@override String get specialistsCardiologist => 'اختصاصي قلب';
	@override String get k28hr => '\$ 28.00/ساعة';
	@override String get bookNow => 'احجز الآن';
	@override String get running => 'قيد التشغيل';
	@override String get ongoing => 'مستمر';
	@override String get service => 'الخدمات';
	@override String get patientCare => 'يجب أن تكون رعاية المريض هي الأولوية الأولى.';
	@override String get run => 'إذا كنت تدير عيادتك، فأنت تعرف مدى الإحباط.';
	@override String get appointmentReminder  => 'لهذا السبب تحتاج إلى نظام لتذكير المواعيد.';
	@override String get find_doctors => 'البحث عن الأطباء';
	@override String get search_hint => 'طبيب أسنان';
	@override String get years_experience => ' سنوات من الخبرة';
	@override String get patient_stories => ' قصص المرضى';
	@override String get next_available => 'الموعد التالي المتاح';
	@override String get book_now => 'احجز الآن';
	@override String get am => 'صباحًا';
	@override String get pm => 'مساءً';
	@override String get tomorrow => 'غدًا';
	@override String get shruti => 'د. Shruti Kedia';
	@override String get watamaniuk => 'د. Watamaniuk';
	@override String get crownover => 'د. Crownover';
	@override String get balestra => 'د. Balestra';
	@override String get dentists => 'طبيب أسنان';
	@override String get ahmedHassan => 'د. أحمد حسن';
	@override String get mohamedAli => 'د. محمد علي';
	@override String get khaledOmar => 'د. خالد عمر';
	@override String get fillerupGrab => 'د. Fillerup Grab';
	@override String get youssefIbrahim => 'د. يوسف إبراهيم';
	@override String get crick => 'د. Crick';
	@override String get strain => 'د. Strain';
	@override String get lachinet => 'د. Lachinet';
	@override String get cardiologist => 'طبيب قلب';
	@override String get surgeon => 'جرّاح';
	@override String get dentist => 'طبيب أسنان';
	@override String get medicinesSpecialist => 'اختصاصي طب';
	@override String get dentistSpecialist => 'اختصاصي طب الأسنان';
	@override String get general => 'عام';
	@override String get neurologist => 'طبيب أعصاب';
	@override String get dental => 'الأسنان';
	@override String get heart => 'القلب';
	@override String get eye => 'العين';
	@override String get body => 'الجسم';
	@override String get home => 'الرئيسية';
	@override String get favorite => 'المفضلة';
	@override String get book => 'الحجوزات';
	@override String get chat => 'المحادثة';
	@override String get selecttime => 'اختر الوقت';
	@override String get dentalclinic => 'عيادة Upasana للأسنان، سولت ليك';
	@override String get today => 'اليوم';
	@override String get noslots => 'لا توجد مواعيد متاحة';
	@override String get nextavailabilityon => 'التوفر التالي يوم الأربعاء، 24 فبراير';
	@override String get oR => 'أو';
	@override String get contactclinic => 'تواصل مع العيادة';
	@override String get afternoon => 'بعد الظهر';
	@override String get slots => 'مواعيد متاحة';
	@override String get evening => 'المساء';
	@override String get enterValidEmail => 'أدخل بريد إلكتروني صحيح';
	@override String get passwordMinLength => 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
	@override String get passwordLowerCase => 'يجب أن تحتوي على حرف صغير';
	@override String get passwordUpperCase => 'يجب أن تحتوي على حرف كبير';
	@override String get passwordNumber => 'يجب أن تحتوي على رقم';
	@override String get passwordSpecialChar => 'يجب أن تحتوي على رمز خاص';
	@override String get signUpSuccess => 'تم إنشاء الحساب بنجاح';
}

// Path: onboarding
class _Translations$onboarding$ar implements Translations$onboarding$en {
	_Translations$onboarding$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override List<dynamic> get pages => [
		_Translations$onboarding$pages$0$ar._(_root),
		_Translations$onboarding$pages$1$ar._(_root),
		_Translations$onboarding$pages$2$ar._(_root),
	];
}

// Path: onboarding.pages.0
class _Translations$onboarding$pages$0$ar implements Translations$onboarding$pages$0$en {
	_Translations$onboarding$pages$0$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اعثر على أطباء موثوقين';
	@override String get description => 'اكتشف الأطباء والمتخصصين في الرعاية الصحية الموثوقين بالقرب منك، كل ذلك في مكان واحد.';
}

// Path: onboarding.pages.1
class _Translations$onboarding$pages$1$ar implements Translations$onboarding$pages$1$en {
	_Translations$onboarding$pages$1$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اختر أفضل الأطباء';
	@override String get description => 'استكشف ملفات الأطباء، وتعرف على تخصصاتهم، واختر الطبيب المناسب لاحتياجاتك.';
}

// Path: onboarding.pages.2
class _Translations$onboarding$pages$2$ar implements Translations$onboarding$pages$2$en {
	_Translations$onboarding$pages$2$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مواعيد بسهولة';
	@override String get description => 'احجز موعدك بسهولة واختر التاريخ والوقت المناسبين لك.';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'دكتور هانت',
			'kContinue' => 'متابعة',
			'next' => 'التالي',
			'skip' => 'تخطي',
			'getStarted' => 'ابدأ الآن',
			'resencode' => 'إعادة إرسال الرمز',
			'live' => 'مباشر',
			'hours' => 'ساعة',
			'error' => 'حدث خطأ ما',
			'loading' => 'جارٍ التحميل...',
			'seeall' => 'عرض الكل',
			'onboarding.pages.0.title' => 'اعثر على أطباء موثوقين',
			'onboarding.pages.0.description' => 'اكتشف الأطباء والمتخصصين في الرعاية الصحية الموثوقين بالقرب منك، كل ذلك في مكان واحد.',
			'onboarding.pages.1.title' => 'اختر أفضل الأطباء',
			'onboarding.pages.1.description' => 'استكشف ملفات الأطباء، وتعرف على تخصصاتهم، واختر الطبيب المناسب لاحتياجاتك.',
			'onboarding.pages.2.title' => 'مواعيد بسهولة',
			'onboarding.pages.2.description' => 'احجز موعدك بسهولة واختر التاريخ والوقت المناسبين لك.',
			'chooseRole' => 'اختر دورك',
			'selectedRole' => 'يحدد الدور الذي تختاره تجربتك والميزات المتاحة لك.',
			'patient' => 'مريض',
			'findDoctorbook' => 'ابحث عن الأطباء، واحجز المواعيد، وأدر سجلاتك الطبية.',
			'admin' => 'مسؤول',
			'manageDoctors' => 'إدارة الأطباء والمواعيد والمستخدمين والمنصة.',
			'signUpTitle' => 'انضم إلينا للعثور على الطبيب المناسب',
			'createAccountDescription' => 'أنشئ حسابًا للعثور على أطباء موثوقين، واستكشاف تخصصاتهم، وحجز المواعيد بسهولة.',
			'loginDescription' => 'اعثر على أطباء موثوقين، واستكشف التخصصات، وأدر مواعيدك بسهولة.',
			'passworddonotmatch' => 'كلمتا المرور غير متطابقتين',
			'confirmepassword' => 'تأكيد كلمة المرور',
			'creatNewPassword' => 'أنشئ كلمة مرور جديدة لحسابك.',
			'logIn' => 'تسجيل الدخول',
			'signUp' => 'إنشاء حساب',
			'google' => 'Google',
			'facebook' => 'Facebook',
			'name' => 'الاسم',
			'email' => 'البريد الإلكتروني',
			'password' => 'كلمة المرور',
			'forgotPassword' => 'نسيت كلمة المرور',
			'agreeAndPrivacy' => 'أوافق على شروط الخدمة وسياسة الخصوصية',
			'haveAccount' => 'لديك حساب بالفعل؟',
			'doNotHaveAccount' => 'ليس لديك حساب؟',
			'welcome' => 'مرحبًا بعودتك',
			'join' => 'انضم إلينا',
			'exampleEmail' => 'itsmemamun1@gmail.com',
			'emailVerification' => 'أدخل بريدك الإلكتروني لإتمام عملية التحقق. سنرسل رمزًا مكونًا من 4 أرقام إلى بريدك الإلكتروني.',
			'enterDigit' => 'أدخل الرمز المكون من 4 أرقام',
			'enterReceivedDigit' => 'أدخل الرمز المكون من 4 أرقام الذي وصلك عبر بريدك الإلكتروني.',
			'reset' => 'إعادة تعيين كلمة المرور',
			'newPassword' => 'كلمة المرور الجديدة',
			'reenterPassword' => 'أعد إدخال كلمة المرور',
			'entername' => 'يرجى إدخال اسمك',
			'enterEmail' => 'يرجى إدخال بريدك الإلكتروني',
			'enterPassword' => 'يرجى إدخال كلمة المرور',
			'passwordSuccess' => 'تمت إعادة تعيين كلمة المرور بنجاح',
			'somethingwentwrong' => 'حدث خطأ ما',
			'hihand' => 'مرحبًا Handwerker! ',
			'findDoctor' => 'اعثر على طبيبك',
			'search' => 'بحث',
			'liveDoctor' => 'أطباء مباشرون',
			'popularDoctor' => 'الأطباء الأكثر شعبية',
			'seeAll' => 'عرض الكل',
			'drFill' => 'د. Fillerup Grab',
			'medicineSpecialist' => 'اختصاصي طب',
			'drBlessing' => 'د. Blessing',
			'dentistspecialist' => 'اختصاصي طب الأسنان',
			'featureDoctor' => 'أطباء مميزون',
			'drCrick' => 'د. Crick',
			'k25hours' => '\$ 25.00/ساعة',
			'drstrain' => 'د. Strain',
			'k22hours' => '\$ 22.00/ساعة',
			'drlachinet' => 'د. Lachinet',
			'k29hours' => '\$ 29.00/ساعة',
			'doctorDetails' => 'تفاصيل الطبيب',
			'drPediatrician' => 'د. Pediatrician',
			'specialistsCardiologist' => 'اختصاصي قلب',
			'k28hr' => '\$ 28.00/ساعة',
			'bookNow' => 'احجز الآن',
			'running' => 'قيد التشغيل',
			'ongoing' => 'مستمر',
			'service' => 'الخدمات',
			'patientCare' => 'يجب أن تكون رعاية المريض هي الأولوية الأولى.',
			'run' => 'إذا كنت تدير عيادتك، فأنت تعرف مدى الإحباط.',
			'appointmentReminder ' => 'لهذا السبب تحتاج إلى نظام لتذكير المواعيد.',
			'find_doctors' => 'البحث عن الأطباء',
			'search_hint' => 'طبيب أسنان',
			'years_experience' => ' سنوات من الخبرة',
			'patient_stories' => ' قصص المرضى',
			'next_available' => 'الموعد التالي المتاح',
			'book_now' => 'احجز الآن',
			'am' => 'صباحًا',
			'pm' => 'مساءً',
			'tomorrow' => 'غدًا',
			'shruti' => 'د. Shruti Kedia',
			'watamaniuk' => 'د. Watamaniuk',
			'crownover' => 'د. Crownover',
			'balestra' => 'د. Balestra',
			'dentists' => 'طبيب أسنان',
			'ahmedHassan' => 'د. أحمد حسن',
			'mohamedAli' => 'د. محمد علي',
			'khaledOmar' => 'د. خالد عمر',
			'fillerupGrab' => 'د. Fillerup Grab',
			'youssefIbrahim' => 'د. يوسف إبراهيم',
			'crick' => 'د. Crick',
			'strain' => 'د. Strain',
			'lachinet' => 'د. Lachinet',
			'cardiologist' => 'طبيب قلب',
			'surgeon' => 'جرّاح',
			'dentist' => 'طبيب أسنان',
			'medicinesSpecialist' => 'اختصاصي طب',
			'dentistSpecialist' => 'اختصاصي طب الأسنان',
			'general' => 'عام',
			'neurologist' => 'طبيب أعصاب',
			'dental' => 'الأسنان',
			'heart' => 'القلب',
			'eye' => 'العين',
			'body' => 'الجسم',
			'home' => 'الرئيسية',
			'favorite' => 'المفضلة',
			'book' => 'الحجوزات',
			'chat' => 'المحادثة',
			'selecttime' => 'اختر الوقت',
			'dentalclinic' => 'عيادة Upasana للأسنان، سولت ليك',
			'today' => 'اليوم',
			'noslots' => 'لا توجد مواعيد متاحة',
			'nextavailabilityon' => 'التوفر التالي يوم الأربعاء، 24 فبراير',
			'oR' => 'أو',
			'contactclinic' => 'تواصل مع العيادة',
			'afternoon' => 'بعد الظهر',
			'slots' => 'مواعيد متاحة',
			'evening' => 'المساء',
			'enterValidEmail' => 'أدخل بريد إلكتروني صحيح',
			'passwordMinLength' => 'كلمة المرور يجب أن تكون 8 أحرف على الأقل',
			'passwordLowerCase' => 'يجب أن تحتوي على حرف صغير',
			'passwordUpperCase' => 'يجب أن تحتوي على حرف كبير',
			'passwordNumber' => 'يجب أن تحتوي على رقم',
			'passwordSpecialChar' => 'يجب أن تحتوي على رمز خاص',
			'signUpSuccess' => 'تم إنشاء الحساب بنجاح',
			_ => null,
		};
	}
}
