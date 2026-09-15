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
	@override String get appName => 'دكتور هنت';
	@override late final _Translations$common$ar common = _Translations$common$ar._(_root);
	@override late final _Translations$onboarding$ar onboarding = _Translations$onboarding$ar._(_root);
	@override late final _Translations$auth$ar auth = _Translations$auth$ar._(_root);
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

// Path: auth
class _Translations$auth$ar implements Translations$auth$en {
	_Translations$auth$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get signUpTitle => 'انضم إلينا للعثور على الطبيب المناسب';
	@override String get createAccountDescription => 'أنشئ حسابًا للعثور على أطباء موثوقين، واستكشاف تخصصاتهم، وحجز المواعيد بسهولة.';
	@override String get loginDescription => 'اعثر على أطباء موثوقين، واستكشف تخصصاتهم، وأدر مواعيدك بسهولة.';
	@override String get passworddonotmatch => 'كلمتا المرور غير متطابقتين';
	@override String get confirmepassword => 'تأكيد كلمة المرور';
	@override String get creatNewPassword => 'أنشئ كلمة مرور جديدة لحسابك.';
	@override String get logIn => 'تسجيل الدخول';
	@override String get signUp => 'إنشاء حساب';
	@override String get google => 'قوقل';
	@override String get facebook => 'فيسبوك';
	@override String get name => 'الاسم';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get forgotPassword => 'هل نسيت كلمة المرور؟';
	@override String get agreeAndPrivacy => 'أوافق على شروط الخدمة وسياسة الخصوصية';
	@override String get haveAccount => 'لديك حساب بالفعل؟';
	@override String get doNotHaveAccount => 'ليس لديك حساب؟';
	@override String get welcome => 'مرحبًا بعودتك';
	@override String get join => 'انضم إلينا';
	@override String get exampleEmail => 'itsmemamun1@gmail.com';
	@override String get emailVerification => 'أدخل بريدك الإلكتروني لإتمام عملية التحقق. سنرسل رمزًا مكونًا من 4 أرقام إلى بريدك الإلكتروني.';
	@override String get enterDigit => 'أدخل رمز التحقق المكون من 4 أرقام';
	@override String get enterReceivedDigit => 'أدخل رمز التحقق المكون من 4 أرقام الذي أرسلناه إلى بريدك الإلكتروني.';
	@override String get reset => 'إعادة تعيين كلمة المرور';
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get reenterPassword => 'أعد إدخال كلمة المرور';
	@override String get entername => 'يرجى إدخال اسمك';
	@override String get enterEmail => 'يرجى إدخال بريدك الإلكتروني';
	@override String get enterPassword => 'يرجى إدخال كلمة المرور';
	@override String get passwordSuccess => 'تمت إعادة تعيين كلمة المرور بنجاح';
	@override String get somethingwentwrong => 'حدث خطأ ما';
}

// Path: onboarding.pages.0
class _Translations$onboarding$pages$0$ar implements Translations$onboarding$pages$0$en {
	_Translations$onboarding$pages$0$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اعثر على أطباء موثوقين';
	@override String get description => 'اكتشف الأطباء الموثوقين والمتخصصين في الرعاية الصحية بالقرب منك، كل ذلك في مكان واحد.';
}

// Path: onboarding.pages.1
class _Translations$onboarding$pages$1$ar implements Translations$onboarding$pages$1$en {
	_Translations$onboarding$pages$1$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اختر أفضل الأطباء';
	@override String get description => 'استعرض ملفات الأطباء وتخصصاتهم واختر الطبيب المناسب لاحتياجاتك.';
}

// Path: onboarding.pages.2
class _Translations$onboarding$pages$2$ar implements Translations$onboarding$pages$2$en {
	_Translations$onboarding$pages$2$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'مواعيد بسهولة';
	@override String get description => 'احجز موعدك بسهولة واختر التاريخ والوقت الذي يناسبك.';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'دكتور هنت',
			'common.kContinue' => 'متابعة',
			'common.next' => 'التالي',
			'common.skip' => 'تخطي',
			'common.getStarted' => 'ابدأ الآن',
			'common.resencode' => 'إعادة إرسال الرمز',
			'onboarding.pages.0.title' => 'اعثر على أطباء موثوقين',
			'onboarding.pages.0.description' => 'اكتشف الأطباء الموثوقين والمتخصصين في الرعاية الصحية بالقرب منك، كل ذلك في مكان واحد.',
			'onboarding.pages.1.title' => 'اختر أفضل الأطباء',
			'onboarding.pages.1.description' => 'استعرض ملفات الأطباء وتخصصاتهم واختر الطبيب المناسب لاحتياجاتك.',
			'onboarding.pages.2.title' => 'مواعيد بسهولة',
			'onboarding.pages.2.description' => 'احجز موعدك بسهولة واختر التاريخ والوقت الذي يناسبك.',
			'auth.signUpTitle' => 'انضم إلينا للعثور على الطبيب المناسب',
			'auth.createAccountDescription' => 'أنشئ حسابًا للعثور على أطباء موثوقين، واستكشاف تخصصاتهم، وحجز المواعيد بسهولة.',
			'auth.loginDescription' => 'اعثر على أطباء موثوقين، واستكشف تخصصاتهم، وأدر مواعيدك بسهولة.',
			'auth.passworddonotmatch' => 'كلمتا المرور غير متطابقتين',
			'auth.confirmepassword' => 'تأكيد كلمة المرور',
			'auth.creatNewPassword' => 'أنشئ كلمة مرور جديدة لحسابك.',
			'auth.logIn' => 'تسجيل الدخول',
			'auth.signUp' => 'إنشاء حساب',
			'auth.google' => 'قوقل',
			'auth.facebook' => 'فيسبوك',
			'auth.name' => 'الاسم',
			'auth.email' => 'البريد الإلكتروني',
			'auth.password' => 'كلمة المرور',
			'auth.forgotPassword' => 'هل نسيت كلمة المرور؟',
			'auth.agreeAndPrivacy' => 'أوافق على شروط الخدمة وسياسة الخصوصية',
			'auth.haveAccount' => 'لديك حساب بالفعل؟',
			'auth.doNotHaveAccount' => 'ليس لديك حساب؟',
			'auth.welcome' => 'مرحبًا بعودتك',
			'auth.join' => 'انضم إلينا',
			'auth.exampleEmail' => 'itsmemamun1@gmail.com',
			'auth.emailVerification' => 'أدخل بريدك الإلكتروني لإتمام عملية التحقق. سنرسل رمزًا مكونًا من 4 أرقام إلى بريدك الإلكتروني.',
			'auth.enterDigit' => 'أدخل رمز التحقق المكون من 4 أرقام',
			'auth.enterReceivedDigit' => 'أدخل رمز التحقق المكون من 4 أرقام الذي أرسلناه إلى بريدك الإلكتروني.',
			'auth.reset' => 'إعادة تعيين كلمة المرور',
			'auth.newPassword' => 'كلمة المرور الجديدة',
			'auth.reenterPassword' => 'أعد إدخال كلمة المرور',
			'auth.entername' => 'يرجى إدخال اسمك',
			'auth.enterEmail' => 'يرجى إدخال بريدك الإلكتروني',
			'auth.enterPassword' => 'يرجى إدخال كلمة المرور',
			'auth.passwordSuccess' => 'تمت إعادة تعيين كلمة المرور بنجاح',
			'auth.somethingwentwrong' => 'حدث خطأ ما',
			_ => null,
		};
	}
}
