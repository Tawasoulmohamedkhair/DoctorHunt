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
	@override late final _Translations$common$ar common = _Translations$common$ar._(_root);
	@override late final _Translations$onboarding$ar onboarding = _Translations$onboarding$ar._(_root);
	@override late final _Translations$chooserole$ar chooserole = _Translations$chooserole$ar._(_root);
	@override late final _Translations$auth$ar auth = _Translations$auth$ar._(_root);
	@override late final _Translations$home$ar home = _Translations$home$ar._(_root);
	@override late final _Translations$details$ar details = _Translations$details$ar._(_root);
	@override late final _Translations$find$ar find = _Translations$find$ar._(_root);
	@override late final _Translations$doctors$ar doctors = _Translations$doctors$ar._(_root);
	@override late final _Translations$specialties$ar specialties = _Translations$specialties$ar._(_root);
	@override late final _Translations$categories$ar categories = _Translations$categories$ar._(_root);
	@override late final _Translations$bottomNav$ar bottomNav = _Translations$bottomNav$ar._(_root);
}

// Path: common
class _Translations$common$ar implements Translations$common$en {
	_Translations$common$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get kContinue => 'متابعة';
	@override String get next => 'التالي';
	@override String get skip => 'تخطي';
	@override String get getStarted => 'ابدأ الآن';
	@override String get resencode => 'إعادة إرسال الرمز';
	@override String get live => 'مباشر';
	@override String get hours => 'ساعة';
	@override String get error => 'حدث خطأ ما';
	@override String get loading => 'جاري التحميل...';
	@override String get seeall => 'عرض الكل';
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

// Path: chooserole
class _Translations$chooserole$ar implements Translations$chooserole$en {
	_Translations$chooserole$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get chooseRole => 'اختر دورك';
	@override String get selectedRole => 'يحدد الدور الذي تختاره تجربتك والميزات المتاحة لك.';
	@override String get patient => 'مريض';
	@override String get findDoctorbook => 'ابحث عن الأطباء، واحجز المواعيد، وأدر سجلاتك الطبية.';
	@override String get admin => 'مسؤول';
	@override String get manageDoctors => 'إدارة الأطباء والمواعيد والمستخدمين والمنصة.';
}

// Path: auth
class _Translations$auth$ar implements Translations$auth$en {
	_Translations$auth$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get signUpTitle => 'انضم إلينا للعثور على الطبيب المناسب';
	@override String get createAccountDescription => 'أنشئ حسابًا للعثور على أطباء موثوقين، واستكشف تخصصاتهم، واحجز المواعيد بسهولة.';
	@override String get loginDescription => 'اعثر على أطباء موثوقين، واستكشف التخصصات، وأدر مواعيدك بسهولة.';
	@override String get passworddonotmatch => 'كلمات المرور غير متطابقة';
	@override String get confirmepassword => 'تأكيد كلمة المرور';
	@override String get creatNewPassword => 'أنشئ كلمة مرور جديدة لحسابك.';
	@override String get logIn => 'تسجيل الدخول';
	@override String get signUp => 'إنشاء حساب';
	@override String get google => 'جوجل';
	@override String get facebook => 'فيسبوك';
	@override String get name => 'الاسم';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get forgotPassword => 'نسيت كلمة المرور';
	@override String get agreeAndPrivacy => 'أوافق على شروط الخدمة وسياسة الخصوصية';
	@override String get haveAccount => 'هل لديك حساب؟';
	@override String get doNotHaveAccount => 'ليس لديك حساب؟';
	@override String get welcome => 'مرحبًا بعودتك';
	@override String get join => 'انضم إلينا';
	@override String get exampleEmail => 'itsmemamun1@gmail.com';
	@override String get emailVerification => 'أدخل بريدك الإلكتروني لعملية التحقق. سنرسل رمزًا مكونًا من 4 أرقام إلى بريدك الإلكتروني.';
	@override String get enterDigit => 'أدخل الرمز المكون من 4 أرقام';
	@override String get enterReceivedDigit => 'أدخل الرمز المكون من 4 أرقام الذي تلقيته في بريدك الإلكتروني.';
	@override String get reset => 'إعادة تعيين كلمة المرور';
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get reenterPassword => 'أعد إدخال كلمة المرور';
	@override String get entername => 'الرجاء إدخال اسمك';
	@override String get enterEmail => 'الرجاء إدخال بريدك الإلكتروني';
	@override String get enterPassword => 'الرجاء إدخال كلمة المرور';
	@override String get passwordSuccess => 'تم إعادة تعيين كلمة المرور بنجاح';
	@override String get somethingwentwrong => 'حدث خطأ ما';
}

// Path: home
class _Translations$home$ar implements Translations$home$en {
	_Translations$home$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get hihand => 'مرحبًا Handwerker!';
	@override String get findDoctor => 'ابحث عن طبيبك';
	@override String get search => 'بحث';
	@override String get liveDoctor => 'أطباء مباشر';
	@override String get popularDoctor => 'الأكثر طلبًا';
	@override String get seeAll => 'عرض الكل';
	@override String get drFill => 'د. فيلروب جراب';
	@override String get medicineSpecialist => 'أخصائي باطنة';
	@override String get drBlessing => 'د. بليسينج';
	@override String get dentist => 'أخصائي أسنان';
	@override String get featureDoctor => 'أطباء مميزين';
	@override String get drCrick => 'د. كريك';
	@override String get k25hours => '25.00\$ / ساعة';
	@override String get drstrain => 'د. سترين';
	@override String get k22hours => '22.00\$ / ساعة';
	@override String get drlachinet => 'د. لاشينيت';
	@override String get k29hours => '29.00\$ / ساعة';
}

// Path: details
class _Translations$details$ar implements Translations$details$en {
	_Translations$details$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get doctorDetails => 'تفاصيل الطبيب';
	@override String get drPediatrician => 'د. أخصائي أطفال';
	@override String get specialistsCardiologist => 'أخصائي قلب';
	@override String get k28hr => '28.00\$ / ساعة';
	@override String get bookNow => 'احجز الآن';
	@override String get running => 'جاري';
	@override String get ongoing => 'مستمر';
	@override String get patient => 'مريض';
	@override String get service => 'الخدمات';
	@override String get patientCare => 'رعاية المريض يجب أن تكون الأولوية الأولى.';
	@override String get run => 'إذا كنت تدير عيادتك فأنت تعرف مدى الإحباط.';
	@override String get appointmentReminder  => 'لهذا السبب بعض أنظمة تذكير المواعيد.';
}

// Path: find
class _Translations$find$ar implements Translations$find$en {
	_Translations$find$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get find_doctors => 'البحث عن أطباء';
	@override String get search_hint => 'طبيب أسنان';
	@override String get years_experience => ' سنوات خبرة';
	@override String get patient_stories => 'قصص مرضى';
	@override String get next_available => 'الموعد المتاح التالي';
	@override String get book_now => 'احجز الآن';
	@override String get am => 'ص';
	@override String get pm => 'م';
	@override String get tomorrow => 'غدًا';
	@override late final _Translations$find$doctors$ar doctors = _Translations$find$doctors$ar._(_root);
	@override late final _Translations$find$specialties$ar specialties = _Translations$find$specialties$ar._(_root);
}

// Path: doctors
class _Translations$doctors$ar implements Translations$doctors$en {
	_Translations$doctors$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get ahmedHassan => 'د. أحمد حسن';
	@override String get mohamedAli => 'د. محمد علي';
	@override String get khaledOmar => 'د. خالد عمر';
	@override String get fillerupGrab => 'د. فيلروب جراب';
	@override String get youssefIbrahim => 'د. يوسف إبراهيم';
	@override String get crick => 'د. كريك';
	@override String get strain => 'د. سترين';
	@override String get lachinet => 'د. لاشينيت';
}

// Path: specialties
class _Translations$specialties$ar implements Translations$specialties$en {
	_Translations$specialties$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get cardiologist => 'أخصائي قلب';
	@override String get surgeon => 'جراح';
	@override String get dentist => 'طبيب أسنان';
	@override String get medicineSpecialist => 'أخصائي باطنة';
	@override String get dentistSpecialist => 'أخصائي أسنان';
	@override String get general => 'طب عام';
	@override String get neurologist => 'أخصائي مخ وأعصاب';
}

// Path: categories
class _Translations$categories$ar implements Translations$categories$en {
	_Translations$categories$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get dental => 'أسنان';
	@override String get heart => 'قلب';
	@override String get eye => 'عيون';
	@override String get body => 'جسم';
}

// Path: bottomNav
class _Translations$bottomNav$ar implements Translations$bottomNav$en {
	_Translations$bottomNav$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get home => 'الرئيسية';
	@override String get favorite => 'المفضلة';
	@override String get book => 'الحجز';
	@override String get chat => 'المحادثة';
}

// Path: onboarding.pages.0
class _Translations$onboarding$pages$0$ar implements Translations$onboarding$pages$0$en {
	_Translations$onboarding$pages$0$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اعثر على أطباء موثوقين';
	@override String get description => 'اكتشف أطباء ومتخصصين في الرعاية الصحية موثوقين بالقرب منك، كل ذلك في مكان واحد.';
}

// Path: onboarding.pages.1
class _Translations$onboarding$pages$1$ar implements Translations$onboarding$pages$1$en {
	_Translations$onboarding$pages$1$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اختر أفضل الأطباء';
	@override String get description => 'استكشف ملفات الأطباء، وتحقق من تخصصاتهم، واختر الطبيب المناسب لاحتياجاتك.';
}

// Path: onboarding.pages.2
class _Translations$onboarding$pages$2$ar implements Translations$onboarding$pages$2$en {
	_Translations$onboarding$pages$2$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مواعيد سهلة';
	@override String get description => 'احجز موعدك بسهولة واختر التاريخ والوقت الأنسب لك.';
}

// Path: find.doctors
class _Translations$find$doctors$ar implements Translations$find$doctors$en {
	_Translations$find$doctors$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get shruti => 'د. شروتي كيديا';
	@override String get watamaniuk => 'د. واتامانيوك';
	@override String get crownover => 'د. كراون أوفر';
	@override String get balestra => 'د. باليسترا';
}

// Path: find.specialties
class _Translations$find$specialties$ar implements Translations$find$specialties$en {
	_Translations$find$specialties$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get dentist => 'طبيب أسنان';
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
			'common.kContinue' => 'متابعة',
			'common.next' => 'التالي',
			'common.skip' => 'تخطي',
			'common.getStarted' => 'ابدأ الآن',
			'common.resencode' => 'إعادة إرسال الرمز',
			'common.live' => 'مباشر',
			'common.hours' => 'ساعة',
			'common.error' => 'حدث خطأ ما',
			'common.loading' => 'جاري التحميل...',
			'common.seeall' => 'عرض الكل',
			'onboarding.pages.0.title' => 'اعثر على أطباء موثوقين',
			'onboarding.pages.0.description' => 'اكتشف أطباء ومتخصصين في الرعاية الصحية موثوقين بالقرب منك، كل ذلك في مكان واحد.',
			'onboarding.pages.1.title' => 'اختر أفضل الأطباء',
			'onboarding.pages.1.description' => 'استكشف ملفات الأطباء، وتحقق من تخصصاتهم، واختر الطبيب المناسب لاحتياجاتك.',
			'onboarding.pages.2.title' => 'مواعيد سهلة',
			'onboarding.pages.2.description' => 'احجز موعدك بسهولة واختر التاريخ والوقت الأنسب لك.',
			'chooserole.chooseRole' => 'اختر دورك',
			'chooserole.selectedRole' => 'يحدد الدور الذي تختاره تجربتك والميزات المتاحة لك.',
			'chooserole.patient' => 'مريض',
			'chooserole.findDoctorbook' => 'ابحث عن الأطباء، واحجز المواعيد، وأدر سجلاتك الطبية.',
			'chooserole.admin' => 'مسؤول',
			'chooserole.manageDoctors' => 'إدارة الأطباء والمواعيد والمستخدمين والمنصة.',
			'auth.signUpTitle' => 'انضم إلينا للعثور على الطبيب المناسب',
			'auth.createAccountDescription' => 'أنشئ حسابًا للعثور على أطباء موثوقين، واستكشف تخصصاتهم، واحجز المواعيد بسهولة.',
			'auth.loginDescription' => 'اعثر على أطباء موثوقين، واستكشف التخصصات، وأدر مواعيدك بسهولة.',
			'auth.passworddonotmatch' => 'كلمات المرور غير متطابقة',
			'auth.confirmepassword' => 'تأكيد كلمة المرور',
			'auth.creatNewPassword' => 'أنشئ كلمة مرور جديدة لحسابك.',
			'auth.logIn' => 'تسجيل الدخول',
			'auth.signUp' => 'إنشاء حساب',
			'auth.google' => 'جوجل',
			'auth.facebook' => 'فيسبوك',
			'auth.name' => 'الاسم',
			'auth.email' => 'البريد الإلكتروني',
			'auth.password' => 'كلمة المرور',
			'auth.forgotPassword' => 'نسيت كلمة المرور',
			'auth.agreeAndPrivacy' => 'أوافق على شروط الخدمة وسياسة الخصوصية',
			'auth.haveAccount' => 'هل لديك حساب؟',
			'auth.doNotHaveAccount' => 'ليس لديك حساب؟',
			'auth.welcome' => 'مرحبًا بعودتك',
			'auth.join' => 'انضم إلينا',
			'auth.exampleEmail' => 'itsmemamun1@gmail.com',
			'auth.emailVerification' => 'أدخل بريدك الإلكتروني لعملية التحقق. سنرسل رمزًا مكونًا من 4 أرقام إلى بريدك الإلكتروني.',
			'auth.enterDigit' => 'أدخل الرمز المكون من 4 أرقام',
			'auth.enterReceivedDigit' => 'أدخل الرمز المكون من 4 أرقام الذي تلقيته في بريدك الإلكتروني.',
			'auth.reset' => 'إعادة تعيين كلمة المرور',
			'auth.newPassword' => 'كلمة المرور الجديدة',
			'auth.reenterPassword' => 'أعد إدخال كلمة المرور',
			'auth.entername' => 'الرجاء إدخال اسمك',
			'auth.enterEmail' => 'الرجاء إدخال بريدك الإلكتروني',
			'auth.enterPassword' => 'الرجاء إدخال كلمة المرور',
			'auth.passwordSuccess' => 'تم إعادة تعيين كلمة المرور بنجاح',
			'auth.somethingwentwrong' => 'حدث خطأ ما',
			'home.hihand' => 'مرحبًا Handwerker!',
			'home.findDoctor' => 'ابحث عن طبيبك',
			'home.search' => 'بحث',
			'home.liveDoctor' => 'أطباء مباشر',
			'home.popularDoctor' => 'الأكثر طلبًا',
			'home.seeAll' => 'عرض الكل',
			'home.drFill' => 'د. فيلروب جراب',
			'home.medicineSpecialist' => 'أخصائي باطنة',
			'home.drBlessing' => 'د. بليسينج',
			'home.dentist' => 'أخصائي أسنان',
			'home.featureDoctor' => 'أطباء مميزين',
			'home.drCrick' => 'د. كريك',
			'home.k25hours' => '25.00\$ / ساعة',
			'home.drstrain' => 'د. سترين',
			'home.k22hours' => '22.00\$ / ساعة',
			'home.drlachinet' => 'د. لاشينيت',
			'home.k29hours' => '29.00\$ / ساعة',
			'details.doctorDetails' => 'تفاصيل الطبيب',
			'details.drPediatrician' => 'د. أخصائي أطفال',
			'details.specialistsCardiologist' => 'أخصائي قلب',
			'details.k28hr' => '28.00\$ / ساعة',
			'details.bookNow' => 'احجز الآن',
			'details.running' => 'جاري',
			'details.ongoing' => 'مستمر',
			'details.patient' => 'مريض',
			'details.service' => 'الخدمات',
			'details.patientCare' => 'رعاية المريض يجب أن تكون الأولوية الأولى.',
			'details.run' => 'إذا كنت تدير عيادتك فأنت تعرف مدى الإحباط.',
			'details.appointmentReminder ' => 'لهذا السبب بعض أنظمة تذكير المواعيد.',
			'find.find_doctors' => 'البحث عن أطباء',
			'find.search_hint' => 'طبيب أسنان',
			'find.years_experience' => ' سنوات خبرة',
			'find.patient_stories' => 'قصص مرضى',
			'find.next_available' => 'الموعد المتاح التالي',
			'find.book_now' => 'احجز الآن',
			'find.am' => 'ص',
			'find.pm' => 'م',
			'find.tomorrow' => 'غدًا',
			'find.doctors.shruti' => 'د. شروتي كيديا',
			'find.doctors.watamaniuk' => 'د. واتامانيوك',
			'find.doctors.crownover' => 'د. كراون أوفر',
			'find.doctors.balestra' => 'د. باليسترا',
			'find.specialties.dentist' => 'طبيب أسنان',
			'doctors.ahmedHassan' => 'د. أحمد حسن',
			'doctors.mohamedAli' => 'د. محمد علي',
			'doctors.khaledOmar' => 'د. خالد عمر',
			'doctors.fillerupGrab' => 'د. فيلروب جراب',
			'doctors.youssefIbrahim' => 'د. يوسف إبراهيم',
			'doctors.crick' => 'د. كريك',
			'doctors.strain' => 'د. سترين',
			'doctors.lachinet' => 'د. لاشينيت',
			'specialties.cardiologist' => 'أخصائي قلب',
			'specialties.surgeon' => 'جراح',
			'specialties.dentist' => 'طبيب أسنان',
			'specialties.medicineSpecialist' => 'أخصائي باطنة',
			'specialties.dentistSpecialist' => 'أخصائي أسنان',
			'specialties.general' => 'طب عام',
			'specialties.neurologist' => 'أخصائي مخ وأعصاب',
			'categories.dental' => 'أسنان',
			'categories.heart' => 'قلب',
			'categories.eye' => 'عيون',
			'categories.body' => 'جسم',
			'bottomNav.home' => 'الرئيسية',
			'bottomNav.favorite' => 'المفضلة',
			'bottomNav.book' => 'الحجز',
			'bottomNav.chat' => 'المحادثة',
			_ => null,
		};
	}
}
