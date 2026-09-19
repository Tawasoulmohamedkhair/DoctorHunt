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
	late final Translations$chooserole$en chooserole = Translations$chooserole$en._(_root);
	late final Translations$auth$en auth = Translations$auth$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$details$en details = Translations$details$en._(_root);
	late final Translations$find$en find = Translations$find$en._(_root);
	late final Translations$doctors$en doctors = Translations$doctors$en._(_root);
	late final Translations$specialties$en specialties = Translations$specialties$en._(_root);
	late final Translations$categories$en categories = Translations$categories$en._(_root);
	late final Translations$bottomNav$en bottomNav = Translations$bottomNav$en._(_root);
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

	/// en: 'LIVE'
	String get live => 'LIVE';

	/// en: 'hours'
	String get hours => 'hours';

	/// en: 'Something went wrong'
	String get error => 'Something went wrong';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Seeall'
	String get seeall => 'Seeall';
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

// Path: chooserole
class Translations$chooserole$en {
	Translations$chooserole$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Choose your role'
	String get chooseRole => 'Choose your role';

	/// en: 'The selected role determines the experience and available features.'
	String get selectedRole => 'The selected role determines the experience and available features.';

	/// en: 'Patient'
	String get patient => 'Patient';

	/// en: 'Find doctors, book appointments,and manage your medical records.'
	String get findDoctorbook => 'Find doctors, book appointments,and manage your medical records.';

	/// en: 'Admin'
	String get admin => 'Admin';

	/// en: 'Manage doctors, appointments,users, and the platform.'
	String get manageDoctors => 'Manage doctors, appointments,users, and the platform.';
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

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hi Handwerker! '
	String get hihand => 'Hi Handwerker! ';

	/// en: 'Find Your Doctor'
	String get findDoctor => 'Find Your Doctor';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Live Doctors'
	String get liveDoctor => 'Live Doctors';

	/// en: 'Popular Doctor'
	String get popularDoctor => 'Popular Doctor';

	/// en: 'See all'
	String get seeAll => 'See all';

	/// en: 'Dr. Fillerup Grab'
	String get drFill => 'Dr. Fillerup Grab';

	/// en: 'Medicine Specialist'
	String get medicineSpecialist => 'Medicine Specialist';

	/// en: 'Dr. Blessing'
	String get drBlessing => 'Dr. Blessing';

	/// en: 'Dentist Specialist'
	String get dentist => 'Dentist Specialist';

	/// en: 'Feature Doctor'
	String get featureDoctor => 'Feature Doctor';

	/// en: 'Dr. Crick'
	String get drCrick => 'Dr. Crick';

	/// en: '$ 25.00/ hours'
	String get k25hours => '\$ 25.00/ hours';

	/// en: 'Dr. Strain'
	String get drstrain => 'Dr. Strain';

	/// en: '$ 22.00/ hours'
	String get k22hours => '\$ 22.00/ hours';

	/// en: 'Dr. Lachinet'
	String get drlachinet => 'Dr. Lachinet';

	/// en: '$ 29.00/ hours'
	String get k29hours => '\$ 29.00/ hours';
}

// Path: details
class Translations$details$en {
	Translations$details$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Doctor Details'
	String get doctorDetails => 'Doctor Details';

	/// en: 'Dr. Pediatrician'
	String get drPediatrician => 'Dr. Pediatrician';

	/// en: 'Specialist Cardiologist '
	String get specialistsCardiologist => 'Specialist Cardiologist ';

	/// en: '$ 28.00/hr'
	String get k28hr => '\$ 28.00/hr';

	/// en: 'Book Now'
	String get bookNow => 'Book Now';

	/// en: 'Runing'
	String get running => 'Runing';

	/// en: 'Ongoing'
	String get ongoing => 'Ongoing';

	/// en: 'Patient'
	String get patient => 'Patient';

	/// en: 'Services'
	String get service => 'Services';

	/// en: 'Patient care should be the number one priority.'
	String get patientCare => 'Patient care should be the number one priority.';

	/// en: 'If you run your practice you know how frustrating.'
	String get run => 'If you run your practice you know how frustrating.';

	/// en: 'That’s why some of appointment reminder system.'
	String get appointmentReminder  => 'That’s why some of appointment reminder system.';
}

// Path: find
class Translations$find$en {
	Translations$find$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Find Doctors'
	String get find_doctors => 'Find Doctors';

	/// en: 'Dentist'
	String get search_hint => 'Dentist';

	/// en: ' Years experience'
	String get years_experience => ' Years experience';

	/// en: ' Patient Stories'
	String get patient_stories => ' Patient Stories';

	/// en: 'Next Available'
	String get next_available => 'Next Available';

	/// en: 'Book Now'
	String get book_now => 'Book Now';

	/// en: 'AM'
	String get am => 'AM';

	/// en: 'PM'
	String get pm => 'PM';

	/// en: 'tomorrow'
	String get tomorrow => 'tomorrow';

	late final Translations$find$doctors$en doctors = Translations$find$doctors$en._(_root);
	late final Translations$find$specialties$en specialties = Translations$find$specialties$en._(_root);
}

// Path: doctors
class Translations$doctors$en {
	Translations$doctors$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dr. Ahmed Hassan'
	String get ahmedHassan => 'Dr. Ahmed Hassan';

	/// en: 'Dr. Mohamed Ali'
	String get mohamedAli => 'Dr. Mohamed Ali';

	/// en: 'Dr. Khaled Omar'
	String get khaledOmar => 'Dr. Khaled Omar';

	/// en: 'Dr. Fillerup Grab'
	String get fillerupGrab => 'Dr. Fillerup Grab';

	/// en: 'Dr. Youssef Ibrahim'
	String get youssefIbrahim => 'Dr. Youssef Ibrahim';

	/// en: 'Dr. Crick'
	String get crick => 'Dr. Crick';

	/// en: 'Dr. Strain'
	String get strain => 'Dr. Strain';

	/// en: 'Dr. Lachinet'
	String get lachinet => 'Dr. Lachinet';
}

// Path: specialties
class Translations$specialties$en {
	Translations$specialties$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cardiologist'
	String get cardiologist => 'Cardiologist';

	/// en: 'Surgeon'
	String get surgeon => 'Surgeon';

	/// en: 'Dentist'
	String get dentist => 'Dentist';

	/// en: 'Medicine Specialist'
	String get medicineSpecialist => 'Medicine Specialist';

	/// en: 'Dentist Specialist'
	String get dentistSpecialist => 'Dentist Specialist';

	/// en: 'General'
	String get general => 'General';

	/// en: 'Neurologist'
	String get neurologist => 'Neurologist';
}

// Path: categories
class Translations$categories$en {
	Translations$categories$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dental'
	String get dental => 'Dental';

	/// en: 'Heart'
	String get heart => 'Heart';

	/// en: 'Eye'
	String get eye => 'Eye';

	/// en: 'Body'
	String get body => 'Body';
}

// Path: bottomNav
class Translations$bottomNav$en {
	Translations$bottomNav$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Favorite'
	String get favorite => 'Favorite';

	/// en: 'Book'
	String get book => 'Book';

	/// en: 'Chat'
	String get chat => 'Chat';
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

// Path: find.doctors
class Translations$find$doctors$en {
	Translations$find$doctors$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dr. Shruti Kedia'
	String get shruti => 'Dr. Shruti Kedia';

	/// en: 'Dr. Watamaniuk'
	String get watamaniuk => 'Dr. Watamaniuk';

	/// en: 'Dr. Crownover'
	String get crownover => 'Dr. Crownover';

	/// en: 'Dr. Balestra'
	String get balestra => 'Dr. Balestra';
}

// Path: find.specialties
class Translations$find$specialties$en {
	Translations$find$specialties$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tooths Dentist'
	String get dentist => 'Tooths Dentist';
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
			'common.live' => 'LIVE',
			'common.hours' => 'hours',
			'common.error' => 'Something went wrong',
			'common.loading' => 'Loading...',
			'common.seeall' => 'Seeall',
			'onboarding.pages.0.title' => 'Find Trusted Doctors',
			'onboarding.pages.0.description' => 'Discover trusted doctors and healthcare specialists near you, all in one place.',
			'onboarding.pages.1.title' => 'Choose Best Doctors',
			'onboarding.pages.1.description' => 'Explore doctor profiles, check their specialties, and choose the right doctor for your needs.',
			'onboarding.pages.2.title' => 'Easy Appointments',
			'onboarding.pages.2.description' => 'Book your appointment easily and choose a date and time that works best for you.',
			'chooserole.chooseRole' => 'Choose your role',
			'chooserole.selectedRole' => 'The selected role determines the experience and available features.',
			'chooserole.patient' => 'Patient',
			'chooserole.findDoctorbook' => 'Find doctors, book appointments,and manage your medical records.',
			'chooserole.admin' => 'Admin',
			'chooserole.manageDoctors' => 'Manage doctors, appointments,users, and the platform.',
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
			'home.hihand' => 'Hi Handwerker! ',
			'home.findDoctor' => 'Find Your Doctor',
			'home.search' => 'Search',
			'home.liveDoctor' => 'Live Doctors',
			'home.popularDoctor' => 'Popular Doctor',
			'home.seeAll' => 'See all',
			'home.drFill' => 'Dr. Fillerup Grab',
			'home.medicineSpecialist' => 'Medicine Specialist',
			'home.drBlessing' => 'Dr. Blessing',
			'home.dentist' => 'Dentist Specialist',
			'home.featureDoctor' => 'Feature Doctor',
			'home.drCrick' => 'Dr. Crick',
			'home.k25hours' => '\$ 25.00/ hours',
			'home.drstrain' => 'Dr. Strain',
			'home.k22hours' => '\$ 22.00/ hours',
			'home.drlachinet' => 'Dr. Lachinet',
			'home.k29hours' => '\$ 29.00/ hours',
			'details.doctorDetails' => 'Doctor Details',
			'details.drPediatrician' => 'Dr. Pediatrician',
			'details.specialistsCardiologist' => 'Specialist Cardiologist ',
			'details.k28hr' => '\$ 28.00/hr',
			'details.bookNow' => 'Book Now',
			'details.running' => 'Runing',
			'details.ongoing' => 'Ongoing',
			'details.patient' => 'Patient',
			'details.service' => 'Services',
			'details.patientCare' => 'Patient care should be the number one priority.',
			'details.run' => 'If you run your practice you know how frustrating.',
			'details.appointmentReminder ' => 'That’s why some of appointment reminder system.',
			'find.find_doctors' => 'Find Doctors',
			'find.search_hint' => 'Dentist',
			'find.years_experience' => ' Years experience',
			'find.patient_stories' => ' Patient Stories',
			'find.next_available' => 'Next Available',
			'find.book_now' => 'Book Now',
			'find.am' => 'AM',
			'find.pm' => 'PM',
			'find.tomorrow' => 'tomorrow',
			'find.doctors.shruti' => 'Dr. Shruti Kedia',
			'find.doctors.watamaniuk' => 'Dr. Watamaniuk',
			'find.doctors.crownover' => 'Dr. Crownover',
			'find.doctors.balestra' => 'Dr. Balestra',
			'find.specialties.dentist' => 'Tooths Dentist',
			'doctors.ahmedHassan' => 'Dr. Ahmed Hassan',
			'doctors.mohamedAli' => 'Dr. Mohamed Ali',
			'doctors.khaledOmar' => 'Dr. Khaled Omar',
			'doctors.fillerupGrab' => 'Dr. Fillerup Grab',
			'doctors.youssefIbrahim' => 'Dr. Youssef Ibrahim',
			'doctors.crick' => 'Dr. Crick',
			'doctors.strain' => 'Dr. Strain',
			'doctors.lachinet' => 'Dr. Lachinet',
			'specialties.cardiologist' => 'Cardiologist',
			'specialties.surgeon' => 'Surgeon',
			'specialties.dentist' => 'Dentist',
			'specialties.medicineSpecialist' => 'Medicine Specialist',
			'specialties.dentistSpecialist' => 'Dentist Specialist',
			'specialties.general' => 'General',
			'specialties.neurologist' => 'Neurologist',
			'categories.dental' => 'Dental',
			'categories.heart' => 'Heart',
			'categories.eye' => 'Eye',
			'categories.body' => 'Body',
			'bottomNav.home' => 'Home',
			'bottomNav.favorite' => 'Favorite',
			'bottomNav.book' => 'Book',
			'bottomNav.chat' => 'Chat',
			_ => null,
		};
	}
}
