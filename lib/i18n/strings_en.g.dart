///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Doctor Hunt'
	String get appName => 'Doctor Hunt';

	late final Translations$common$en common = Translations$common$en._(_root);
	late final Translations$onboarding$en onboarding = Translations$onboarding$en._(_root);
	late final Translations$auth$en auth = Translations$auth$en._(_root);
}

// Path: common
class Translations$common$en {
	Translations$common$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Get Started'
	String get getStarted => 'Get Started';

	/// en: 'Resend Code'
	String get resencode => 'Resend Code';
}

// Path: onboarding
class Translations$onboarding$en {
	Translations$onboarding$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	List<dynamic> get pages => [
		Translations$onboarding$pages$0$en._(_root),
		Translations$onboarding$pages$1$en._(_root),
		Translations$onboarding$pages$2$en._(_root),
	];
}

// Path: auth
class Translations$auth$en {
	Translations$auth$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Join us to find the right doctor'
	String get signUpTitle => 'Join us to find the right doctor';

	/// en: 'Create an account to find trusted doctors, explore their specialties, and book appointments with ease.'
	String get createAccountDescription => 'Create an account to find trusted doctors, explore their specialties, and book appointments with ease.';

	/// en: 'Find trusted doctors, explore specialties, and manage your appointments with ease.'
	String get loginDescription => 'Find trusted doctors, explore specialties, and manage your appointments with ease.';

	/// en: 'Passwords do not match'
	String get passworddonotmatch => 'Passwords do not match';

	/// en: 'Confirm Password'
	String get confirmepassword => 'Confirm Password';

	/// en: 'Create a new password for your account.'
	String get creatNewPassword => 'Create a new password for your account.';

	/// en: 'Login'
	String get logIn => 'Login';

	/// en: 'Sign up'
	String get signUp => 'Sign up';

	/// en: 'Google'
	String get google => 'Google';

	/// en: 'Facebook'
	String get facebook => 'Facebook';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Forgot Password'
	String get forgotPassword => 'Forgot Password';

	/// en: 'I agree with the Terms of Service & Privacy Policy'
	String get agreeAndPrivacy => 'I agree with the Terms of Service & Privacy Policy';

	/// en: 'Have an account?'
	String get haveAccount => 'Have an account?';

	/// en: 'Don’t have an account?'
	String get doNotHaveAccount => 'Don’t have an account?';

	/// en: 'Welcome back'
	String get welcome => 'Welcome back';

	/// en: 'Join us'
	String get join => 'Join us';

	/// en: 'itsmemamun1@gmail.com'
	String get exampleEmail => 'itsmemamun1@gmail.com';

	/// en: 'Enter your email for the verification process. We will send a 4-digit code to your email.'
	String get emailVerification => 'Enter your email for the verification process. We will send a 4-digit code to your email.';

	/// en: 'Enter 4-Digit Code'
	String get enterDigit => 'Enter 4-Digit Code';

	/// en: 'Enter the 4-digit code that you received in your email.'
	String get enterReceivedDigit => 'Enter the 4-digit code that you received in your email.';

	/// en: 'Reset Password'
	String get reset => 'Reset Password';

	/// en: 'New Password'
	String get newPassword => 'New Password';

	/// en: 'Re-enter Password'
	String get reenterPassword => 'Re-enter Password';

	/// en: 'Please enter your Name'
	String get entername => 'Please enter your Name';

	/// en: 'Please enter your email'
	String get enterEmail => 'Please enter your email';

	/// en: 'Please enter your password'
	String get enterPassword => 'Please enter your password';

	/// en: 'Password reset successfully'
	String get passwordSuccess => 'Password reset successfully';

	/// en: 'Something went wrong'
	String get somethingwentwrong => 'Something went wrong';
}

// Path: onboarding.pages.0
class Translations$onboarding$pages$0$en {
	Translations$onboarding$pages$0$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Find Trusted Doctors'
	String get title => 'Find Trusted Doctors';

	/// en: 'Discover trusted doctors and healthcare specialists near you, all in one place.'
	String get description => 'Discover trusted doctors and healthcare specialists near you, all in one place.';
}

// Path: onboarding.pages.1
class Translations$onboarding$pages$1$en {
	Translations$onboarding$pages$1$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose Best Doctors'
	String get title => 'Choose Best Doctors';

	/// en: 'Explore doctor profiles, check their specialties, and choose the right doctor for your needs.'
	String get description => 'Explore doctor profiles, check their specialties, and choose the right doctor for your needs.';
}

// Path: onboarding.pages.2
class Translations$onboarding$pages$2$en {
	Translations$onboarding$pages$2$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Easy Appointments'
	String get title => 'Easy Appointments';

	/// en: 'Book your appointment easily and choose a date and time that works best for you.'
	String get description => 'Book your appointment easily and choose a date and time that works best for you.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'Doctor Hunt',
			'common.kContinue' => 'Continue',
			'common.next' => 'Next',
			'common.skip' => 'Skip',
			'common.getStarted' => 'Get Started',
			'common.resencode' => 'Resend Code',
			'onboarding.pages.0.title' => 'Find Trusted Doctors',
			'onboarding.pages.0.description' => 'Discover trusted doctors and healthcare specialists near you, all in one place.',
			'onboarding.pages.1.title' => 'Choose Best Doctors',
			'onboarding.pages.1.description' => 'Explore doctor profiles, check their specialties, and choose the right doctor for your needs.',
			'onboarding.pages.2.title' => 'Easy Appointments',
			'onboarding.pages.2.description' => 'Book your appointment easily and choose a date and time that works best for you.',
			'auth.signUpTitle' => 'Join us to find the right doctor',
			'auth.createAccountDescription' => 'Create an account to find trusted doctors, explore their specialties, and book appointments with ease.',
			'auth.loginDescription' => 'Find trusted doctors, explore specialties, and manage your appointments with ease.',
			'auth.passworddonotmatch' => 'Passwords do not match',
			'auth.confirmepassword' => 'Confirm Password',
			'auth.creatNewPassword' => 'Create a new password for your account.',
			'auth.logIn' => 'Login',
			'auth.signUp' => 'Sign up',
			'auth.google' => 'Google',
			'auth.facebook' => 'Facebook',
			'auth.name' => 'Name',
			'auth.email' => 'Email',
			'auth.password' => 'Password',
			'auth.forgotPassword' => 'Forgot Password',
			'auth.agreeAndPrivacy' => 'I agree with the Terms of Service & Privacy Policy',
			'auth.haveAccount' => 'Have an account?',
			'auth.doNotHaveAccount' => 'Don’t have an account?',
			'auth.welcome' => 'Welcome back',
			'auth.join' => 'Join us',
			'auth.exampleEmail' => 'itsmemamun1@gmail.com',
			'auth.emailVerification' => 'Enter your email for the verification process. We will send a 4-digit code to your email.',
			'auth.enterDigit' => 'Enter 4-Digit Code',
			'auth.enterReceivedDigit' => 'Enter the 4-digit code that you received in your email.',
			'auth.reset' => 'Reset Password',
			'auth.newPassword' => 'New Password',
			'auth.reenterPassword' => 'Re-enter Password',
			'auth.entername' => 'Please enter your Name',
			'auth.enterEmail' => 'Please enter your email',
			'auth.enterPassword' => 'Please enter your password',
			'auth.passwordSuccess' => 'Password reset successfully',
			'auth.somethingwentwrong' => 'Something went wrong',
			_ => null,
		};
	}
}
