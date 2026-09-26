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

	late final Translations$onboarding$en onboarding = Translations$onboarding$en._(_root);

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
	String get dentistspecialist => 'Dentist Specialist';

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

	/// en: 'Services'
	String get service => 'Services';

	/// en: 'Patient care should be the number one priority.'
	String get patientCare => 'Patient care should be the number one priority.';

	/// en: 'If you run your practice you know how frustrating.'
	String get run => 'If you run your practice you know how frustrating.';

	/// en: 'That’s why some of appointment reminder system.'
	String get appointmentReminder  => 'That’s why some of appointment reminder system.';

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

	/// en: 'Dr. Shruti Kedia'
	String get shruti => 'Dr. Shruti Kedia';

	/// en: 'Dr. Watamaniuk'
	String get watamaniuk => 'Dr. Watamaniuk';

	/// en: 'Dr. Crownover'
	String get crownover => 'Dr. Crownover';

	/// en: 'Dr. Balestra'
	String get balestra => 'Dr. Balestra';

	/// en: 'Tooths Dentist'
	String get dentists => 'Tooths Dentist';

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

	/// en: 'Cardiologist'
	String get cardiologist => 'Cardiologist';

	/// en: 'Surgeon'
	String get surgeon => 'Surgeon';

	/// en: 'Dentist'
	String get dentist => 'Dentist';

	/// en: 'Medicine Specialist'
	String get medicinesSpecialist => 'Medicine Specialist';

	/// en: 'Dentist Specialist'
	String get dentistSpecialist => 'Dentist Specialist';

	/// en: 'General'
	String get general => 'General';

	/// en: 'Neurologist'
	String get neurologist => 'Neurologist';

	/// en: 'Dental'
	String get dental => 'Dental';

	/// en: 'Heart'
	String get heart => 'Heart';

	/// en: 'Eye'
	String get eye => 'Eye';

	/// en: 'Body'
	String get body => 'Body';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Favorite'
	String get favorite => 'Favorite';

	/// en: 'Book'
	String get book => 'Book';

	/// en: 'Chat'
	String get chat => 'Chat';

	/// en: 'Select Time'
	String get selecttime => 'Select Time';

	/// en: 'Upasana Dental Clinic, salt lake'
	String get dentalclinic => 'Upasana Dental Clinic, salt lake';

	/// en: 'Today'
	String get today => 'Today';

	/// en: 'No slots available'
	String get noslots => 'No slots available';

	/// en: 'Next availability on wed, 24 Feb'
	String get nextavailabilityon => 'Next availability on wed, 24 Feb';

	/// en: 'OR'
	String get oR => 'OR';

	/// en: 'Contact Clinic'
	String get contactclinic => 'Contact Clinic';

	/// en: 'Afternoon'
	String get afternoon => 'Afternoon';

	/// en: 'slots'
	String get slots => 'slots';

	/// en: 'Evening'
	String get evening => 'Evening';

	/// en: 'Enter a valid email'
	String get enterValidEmail => 'Enter a valid email';

	/// en: 'Password must be at least 8 characters'
	String get passwordMinLength => 'Password must be at least 8 characters';

	/// en: 'Must contain a lowercase letter'
	String get passwordLowerCase => 'Must contain a lowercase letter';

	/// en: 'Must contain an uppercase letter'
	String get passwordUpperCase => 'Must contain an uppercase letter';

	/// en: 'Must contain a number'
	String get passwordNumber => 'Must contain a number';

	/// en: 'Must contain a special character'
	String get passwordSpecialChar => 'Must contain a special character';

	/// en: 'Account created successfully'
	String get signUpSuccess => 'Account created successfully';
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
			'kContinue' => 'Continue',
			'next' => 'Next',
			'skip' => 'Skip',
			'getStarted' => 'Get Started',
			'resencode' => 'Resend Code',
			'live' => 'LIVE',
			'hours' => 'hours',
			'error' => 'Something went wrong',
			'loading' => 'Loading...',
			'seeall' => 'Seeall',
			'onboarding.pages.0.title' => 'Find Trusted Doctors',
			'onboarding.pages.0.description' => 'Discover trusted doctors and healthcare specialists near you, all in one place.',
			'onboarding.pages.1.title' => 'Choose Best Doctors',
			'onboarding.pages.1.description' => 'Explore doctor profiles, check their specialties, and choose the right doctor for your needs.',
			'onboarding.pages.2.title' => 'Easy Appointments',
			'onboarding.pages.2.description' => 'Book your appointment easily and choose a date and time that works best for you.',
			'chooseRole' => 'Choose your role',
			'selectedRole' => 'The selected role determines the experience and available features.',
			'patient' => 'Patient',
			'findDoctorbook' => 'Find doctors, book appointments,and manage your medical records.',
			'admin' => 'Admin',
			'manageDoctors' => 'Manage doctors, appointments,users, and the platform.',
			'signUpTitle' => 'Join us to find the right doctor',
			'createAccountDescription' => 'Create an account to find trusted doctors, explore their specialties, and book appointments with ease.',
			'loginDescription' => 'Find trusted doctors, explore specialties, and manage your appointments with ease.',
			'passworddonotmatch' => 'Passwords do not match',
			'confirmepassword' => 'Confirm Password',
			'creatNewPassword' => 'Create a new password for your account.',
			'logIn' => 'Login',
			'signUp' => 'Sign up',
			'google' => 'Google',
			'facebook' => 'Facebook',
			'name' => 'Name',
			'email' => 'Email',
			'password' => 'Password',
			'forgotPassword' => 'Forgot Password',
			'agreeAndPrivacy' => 'I agree with the Terms of Service & Privacy Policy',
			'haveAccount' => 'Have an account?',
			'doNotHaveAccount' => 'Don’t have an account?',
			'welcome' => 'Welcome back',
			'join' => 'Join us',
			'exampleEmail' => 'itsmemamun1@gmail.com',
			'emailVerification' => 'Enter your email for the verification process. We will send a 4-digit code to your email.',
			'enterDigit' => 'Enter 4-Digit Code',
			'enterReceivedDigit' => 'Enter the 4-digit code that you received in your email.',
			'reset' => 'Reset Password',
			'newPassword' => 'New Password',
			'reenterPassword' => 'Re-enter Password',
			'entername' => 'Please enter your Name',
			'enterEmail' => 'Please enter your email',
			'enterPassword' => 'Please enter your password',
			'passwordSuccess' => 'Password reset successfully',
			'somethingwentwrong' => 'Something went wrong',
			'hihand' => 'Hi Handwerker! ',
			'findDoctor' => 'Find Your Doctor',
			'search' => 'Search',
			'liveDoctor' => 'Live Doctors',
			'popularDoctor' => 'Popular Doctor',
			'seeAll' => 'See all',
			'drFill' => 'Dr. Fillerup Grab',
			'medicineSpecialist' => 'Medicine Specialist',
			'drBlessing' => 'Dr. Blessing',
			'dentistspecialist' => 'Dentist Specialist',
			'featureDoctor' => 'Feature Doctor',
			'drCrick' => 'Dr. Crick',
			'k25hours' => '\$ 25.00/ hours',
			'drstrain' => 'Dr. Strain',
			'k22hours' => '\$ 22.00/ hours',
			'drlachinet' => 'Dr. Lachinet',
			'k29hours' => '\$ 29.00/ hours',
			'doctorDetails' => 'Doctor Details',
			'drPediatrician' => 'Dr. Pediatrician',
			'specialistsCardiologist' => 'Specialist Cardiologist ',
			'k28hr' => '\$ 28.00/hr',
			'bookNow' => 'Book Now',
			'running' => 'Runing',
			'ongoing' => 'Ongoing',
			'service' => 'Services',
			'patientCare' => 'Patient care should be the number one priority.',
			'run' => 'If you run your practice you know how frustrating.',
			'appointmentReminder ' => 'That’s why some of appointment reminder system.',
			'find_doctors' => 'Find Doctors',
			'search_hint' => 'Dentist',
			'years_experience' => ' Years experience',
			'patient_stories' => ' Patient Stories',
			'next_available' => 'Next Available',
			'book_now' => 'Book Now',
			'am' => 'AM',
			'pm' => 'PM',
			'tomorrow' => 'tomorrow',
			'shruti' => 'Dr. Shruti Kedia',
			'watamaniuk' => 'Dr. Watamaniuk',
			'crownover' => 'Dr. Crownover',
			'balestra' => 'Dr. Balestra',
			'dentists' => 'Tooths Dentist',
			'ahmedHassan' => 'Dr. Ahmed Hassan',
			'mohamedAli' => 'Dr. Mohamed Ali',
			'khaledOmar' => 'Dr. Khaled Omar',
			'fillerupGrab' => 'Dr. Fillerup Grab',
			'youssefIbrahim' => 'Dr. Youssef Ibrahim',
			'crick' => 'Dr. Crick',
			'strain' => 'Dr. Strain',
			'lachinet' => 'Dr. Lachinet',
			'cardiologist' => 'Cardiologist',
			'surgeon' => 'Surgeon',
			'dentist' => 'Dentist',
			'medicinesSpecialist' => 'Medicine Specialist',
			'dentistSpecialist' => 'Dentist Specialist',
			'general' => 'General',
			'neurologist' => 'Neurologist',
			'dental' => 'Dental',
			'heart' => 'Heart',
			'eye' => 'Eye',
			'body' => 'Body',
			'home' => 'Home',
			'favorite' => 'Favorite',
			'book' => 'Book',
			'chat' => 'Chat',
			'selecttime' => 'Select Time',
			'dentalclinic' => 'Upasana Dental Clinic, salt lake',
			'today' => 'Today',
			'noslots' => 'No slots available',
			'nextavailabilityon' => 'Next availability on wed, 24 Feb',
			'oR' => 'OR',
			'contactclinic' => 'Contact Clinic',
			'afternoon' => 'Afternoon',
			'slots' => 'slots',
			'evening' => 'Evening',
			'enterValidEmail' => 'Enter a valid email',
			'passwordMinLength' => 'Password must be at least 8 characters',
			'passwordLowerCase' => 'Must contain a lowercase letter',
			'passwordUpperCase' => 'Must contain an uppercase letter',
			'passwordNumber' => 'Must contain a number',
			'passwordSpecialChar' => 'Must contain a special character',
			'signUpSuccess' => 'Account created successfully',
			_ => null,
		};
	}
}
