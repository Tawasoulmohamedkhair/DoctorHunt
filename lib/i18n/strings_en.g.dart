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

	/// en: 'Check your internet connection and try again.'
	String get errorNetwork => 'Check your internet connection and try again.';

	/// en: 'The request took too long. Please try again.'
	String get errorTimeout => 'The request took too long. Please try again.';

	/// en: 'Your session could not be verified. Please sign in again.'
	String get errorAuthentication => 'Your session could not be verified. Please sign in again.';

	/// en: 'You do not have permission to complete this action.'
	String get errorPermission => 'You do not have permission to complete this action.';

	/// en: 'Some information could not be accepted. Please review and try again.'
	String get errorValidation => 'Some information could not be accepted. Please review and try again.';

	/// en: 'The requested information could not be found.'
	String get errorNotFound => 'The requested information could not be found.';

	/// en: 'We could not load the information right now. Please try again.'
	String get errorDatabase => 'We could not load the information right now. Please try again.';

	/// en: 'Something went wrong. Please try again.'
	String get errorUnexpected => 'Something went wrong. Please try again.';

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

	/// en: 'Enter your email for the verification process. We will send a 6-digit code to your email.'
	String get emailVerification => 'Enter your email for the verification process. We will send a 6-digit code to your email.';

	/// en: 'Enter 6-Digit Code'
	String get enterDigit => 'Enter 6-Digit Code';

	/// en: 'Enter the 6-digit code that you received in your email.'
	String get enterReceivedDigit => 'Enter the 6-digit code that you received in your email.';

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

	/// en: 'Failed to login'
	String get failedLogin => 'Failed to login';

	/// en: 'Failed to signup'
	String get failedSignup => 'Failed to signup';

	/// en: 'Google sign in failed'
	String get googleSigninFailed => 'Google sign in failed';

	/// en: 'OTP verified but no recovery session found.'
	String get otpnorecovery => 'OTP verified but no recovery session found.';

	/// en: 'Hi'
	String get hi => 'Hi';

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

	/// en: 'No Doctors Found'
	String get nodoctorfound => 'No Doctors Found';

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

	/// en: 'views'
	String get views => 'views';

	/// en: 'Medical consultation'
	String get medicalConsultation => 'Medical consultation';

	/// en: 'Follow-up'
	String get followUp => 'Follow-up';

	/// en: 'General checkup'
	String get generalCheckup => 'General checkup';

	/// en: 'Dental checkup'
	String get dentalCheckup => 'Dental checkup';

	/// en: 'Teeth cleaning'
	String get teethCleaning => 'Teeth cleaning';

	/// en: 'Root canal treatment'
	String get rootCanalTreatment => 'Root canal treatment';

	/// en: 'Tooth extraction'
	String get toothExtraction => 'Tooth extraction';

	/// en: 'No services available for this doctor.'
	String get noServicesAvailableForDoctor => 'No services available for this doctor.';

	/// en: 'Top Rated Doctors'
	String get topRatedDoctors => 'Top Rated Doctors';

	/// en: 'Patient care should be the number one priority.'
	String get patientCare => 'Patient care should be the number one priority.';

	/// en: 'If you run your practice you know how frustrating.'
	String get run => 'If you run your practice you know how frustrating.';

	/// en: 'That’s why some of appointment reminder system.'
	String get appointmentReminder  => 'That’s why some of appointment reminder system.';

	/// en: 'Find Doctors'
	String get find_doctors => 'Find Doctors';

	/// en: 'Search for a doctor'
	String get search_hint => 'Search for a doctor';

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

	/// en: 'Cardiology'
	String get cardiology => 'Cardiology';

	/// en: 'Dentistry'
	String get dentistry => 'Dentistry';

	/// en: 'Dermatology'
	String get dermatology => 'Dermatology';

	/// en: 'General Medicine'
	String get generalMedicine => 'General Medicine';

	/// en: 'Internal Medicine'
	String get internalMedicine => 'Internal Medicine';

	/// en: 'Neurology'
	String get neurology => 'Neurology';

	/// en: 'Ophthalmology'
	String get ophthalmology => 'Ophthalmology';

	/// en: 'Pediatrics'
	String get pediatrics => 'Pediatrics';

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

	/// en: 'Book'
	String get book => 'Book';

	/// en: 'Chat'
	String get chat => 'Chat';

	/// en: 'My Appointments'
	String get myappointments => 'My Appointments';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Favorites'
	String get favorites => 'Favorites';

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

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Are you sure you want to logout?'
	String get confirmLogout => 'Are you sure you want to logout?';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Patient User'
	String get patientUser => 'Patient User';

	/// en: 'Logout failed. Please try again.'
	String get logoutFailed => 'Logout failed. Please try again.';

	/// en: 'No email address is available for this account.'
	String get noEmailAddress => 'No email address is available for this account.';

	/// en: 'Password reset instructions have been sent to your email.'
	String get passwordResetInstructionsSent => 'Password reset instructions have been sent to your email.';

	/// en: 'Unable to send the password reset email.'
	String get unableToSendPasswordResetEmail => 'Unable to send the password reset email.';

	/// en: 'Choose language'
	String get chooseLanguage => 'Choose language';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Arabic'
	String get arabic => 'Arabic';

	/// en: 'Account settings'
	String get accountSettings => 'Account settings';

	/// en: 'Privacy Policy'
	String get privacyPolicy => 'Privacy Policy';

	/// en: 'More options'
	String get moreOptions => 'More options';

	/// en: 'Languages'
	String get languages => 'Languages';

	/// en: 'Logging out...'
	String get loggingOut => 'Logging out...';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Personal information'
	String get personalInformation => 'Personal information';

	/// en: 'Contact Number'
	String get contactNumber => 'Contact Number';

	/// en: 'Unable to load profile information.'
	String get unableToLoadProfile => 'Unable to load profile information.';

	/// en: 'Unable to select the image.'
	String get unableToSelectImage => 'Unable to select the image.';

	/// en: 'Please sign in again.'
	String get pleaseSignInAgain => 'Please sign in again.';

	/// en: 'Please enter your full name.'
	String get enterYourFullName => 'Please enter your full name.';

	/// en: 'Please enter your phone number.'
	String get enterYourPhoneNumber => 'Please enter your phone number.';

	/// en: 'Profile updated successfully.'
	String get profileUpdatedSuccessfully => 'Profile updated successfully.';

	/// en: 'Unable to save profile. Check your connection and permissions.'
	String get unableToSaveProfile => 'Unable to save profile. Check your connection and permissions.';

	/// en: 'Appointments'
	String get appointments => 'Appointments';

	/// en: 'Upcoming'
	String get upcoming => 'Upcoming';

	/// en: 'Completed'
	String get completed => 'Completed';

	/// en: 'Cancelled'
	String get cancelled => 'Cancelled';

	/// en: 'Try Again'
	String get tryAgain => 'Try Again';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'You have no upcoming appointments.'
	String get noUpcomingAppointments => 'You have no upcoming appointments.';

	/// en: 'You have no completed appointments.'
	String get noCompletedAppointments => 'You have no completed appointments.';

	/// en: 'You have no cancelled appointments.'
	String get noCancelledAppointments => 'You have no cancelled appointments.';

	/// en: 'Appointment date'
	String get appointmentDate => 'Appointment date';

	/// en: 'Appointment time'
	String get appointmentTime => 'Appointment time';

	/// en: 'Medical service'
	String get medicalService => 'Medical service';

	/// en: 'Consultation fee'
	String get consultationFee => 'Consultation fee';

	/// en: 'View Details'
	String get viewDetails => 'View Details';

	/// en: 'Rate Doctor'
	String get rateDoctor => 'Rate Doctor';

	/// en: 'Rated'
	String get rated => 'Rated';

	/// en: 'Cancel Appointment'
	String get cancelAppointment => 'Cancel Appointment';

	/// en: 'Doctor information is unavailable.'
	String get doctorInformationUnavailable => 'Doctor information is unavailable.';

	/// en: 'Invalid review information.'
	String get invalidReviewInformation => 'Invalid review information.';

	/// en: 'Review submitted successfully.'
	String get reviewSubmittedSuccessfully => 'Review submitted successfully.';

	/// en: 'How was your experience?'
	String get howWasYourExperience => 'How was your experience?';

	/// en: 'Comment (optional)'
	String get commentOptional => 'Comment (optional)';

	/// en: 'Submit Review'
	String get submitReview => 'Submit Review';

	/// en: 'Cancel Appointment?'
	String get cancelAppointmentQuestion => 'Cancel Appointment?';

	/// en: 'Are you sure you want to cancel this appointment?'
	String get confirmCancelAppointment => 'Are you sure you want to cancel this appointment?';

	/// en: 'Keep Appointment'
	String get keepAppointment => 'Keep Appointment';

	/// en: 'Appointment cancelled successfully.'
	String get appointmentCancelledSuccessfully => 'Appointment cancelled successfully.';

	/// en: 'Appointment Details'
	String get appointmentDetails => 'Appointment Details';

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Time'
	String get time => 'Time';

	/// en: 'Fee'
	String get fee => 'Fee';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Unable to load appointments. Please try again.'
	String get unableToLoadAppointments => 'Unable to load appointments. Please try again.';

	/// en: 'Unable to cancel the appointment. Please try again.'
	String get unableToCancelAppointment => 'Unable to cancel the appointment. Please try again.';

	/// en: 'Unable to submit your review. Please try again.'
	String get unableToSubmitReview => 'Unable to submit your review. Please try again.';

	/// en: 'Unable to load doctor details.'
	String get unableToLoadDoctorDetails => 'Unable to load doctor details.';

	/// en: 'Unable to load available times. Please try again.'
	String get unableToLoadAvailableTimes => 'Unable to load available times. Please try again.';

	/// en: 'Unable to book this appointment. It may no longer be available. Please try again.'
	String get unableToBookAppointment => 'Unable to book this appointment. It may no longer be available. Please try again.';

	/// en: 'Clinic Location'
	String get clinicLocation => 'Clinic Location';

	/// en: 'Unable to load clinic location.'
	String get unableToLoadClinicLocation => 'Unable to load clinic location.';

	/// en: 'Clinic location is not available.'
	String get clinicLocationUnavailable => 'Clinic location is not available.';

	/// en: 'No reviews yet.'
	String get noReviewsYet => 'No reviews yet.';

	/// en: 'Patient Reviews'
	String get patientReviews => 'Patient Reviews';

	/// en: 'Reviews'
	String get reviews => 'Reviews';

	/// en: 'No written comment.'
	String get noWrittenComment => 'No written comment.';

	/// en: 'Thank You!'
	String get thankYou => 'Thank You!';

	/// en: 'Your appointment was booked successfully.'
	String get appointmentBookingSuccessful => 'Your appointment was booked successfully.';

	/// en: 'Doctor'
	String get doctor => 'Doctor';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Select Date'
	String get selectDateLabel => 'Select Date';

	/// en: 'No available dates this month.'
	String get noAvailableDatesThisMonth => 'No available dates this month.';

	/// en: 'Available Time Slots'
	String get availableTimeSlots => 'Available Time Slots';

	/// en: 'Select a highlighted date to see available times.'
	String get selectHighlightedDateForTimes => 'Select a highlighted date to see available times.';

	/// en: 'No available times for this date.'
	String get noAvailableTimesForDate => 'No available times for this date.';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Previous month'
	String get previousMonth => 'Previous month';

	/// en: 'Next month'
	String get nextMonth => 'Next month';

	/// en: 'January'
	String get january => 'January';

	/// en: 'February'
	String get february => 'February';

	/// en: 'March'
	String get march => 'March';

	/// en: 'April'
	String get april => 'April';

	/// en: 'May'
	String get may => 'May';

	/// en: 'June'
	String get june => 'June';

	/// en: 'July'
	String get july => 'July';

	/// en: 'August'
	String get august => 'August';

	/// en: 'September'
	String get september => 'September';

	/// en: 'October'
	String get october => 'October';

	/// en: 'November'
	String get november => 'November';

	/// en: 'December'
	String get december => 'December';

	/// en: 'Popular Doctors'
	String get populardoctor => 'Popular Doctors';

	/// en: 'Tap photo to change'
	String get tapphoto => 'Tap photo to change';

	/// en: 'FULL NAME'
	String get fullname => 'FULL NAME';

	/// en: 'EMAIL ADDRESS'
	String get emailaddress => 'EMAIL ADDRESS';

	/// en: 'CLINIC LOCATION'
	String get cliniclocation => 'CLINIC LOCATION';

	/// en: 'admin@doctorhunt.com'
	String get adminhintemail => 'admin@doctorhunt.com';

	/// en: 'DoctorHunt HQ Clinic'
	String get doctorhunthq => 'DoctorHunt HQ Clinic';

	/// en: 'EnterFullName'
	String get enterfullname => 'EnterFullName';

	/// en: 'Save Changes'
	String get savechange => 'Save Changes';

	/// en: 'Administrator'
	String get administrator => 'Administrator';

	/// en: 'Admin Profile'
	String get adminprofile => 'Admin Profile';

	/// en: 'Edit super admin details & permissions'
	String get editsuperadmin => 'Edit super admin details & permissions';

	/// en: 'Change Password'
	String get changepassword => 'Change Password';

	/// en: 'Update master security credentials'
	String get updatecredentials => 'Update master security credentials';

	/// en: 'App Information'
	String get appinfo => 'App Information';

	/// en: 'Build version'
	String get buildversion => 'Build version';

	/// en: 'v1.0.0'
	String get version => 'v1.0.0';

	/// en: 'Doctors'
	String get doctors => 'Doctors';

	/// en: 'Search doctors...'
	String get searchdoctor => 'Search doctors...';

	/// en: 'Add Doctor'
	String get adddoctor => 'Add Doctor';

	/// en: 'Unable to load doctors.'
	String get unabletoloaddoctors => 'Unable to load doctors.';

	/// en: 'No Doctors Found'
	String get nodoctorsfound => 'No Doctors Found';

	/// en: 'No doctors match your search or selected specialty.'
	String get nodoctoematch => 'No doctors match your search or selected specialty.';

	/// en: 'No Doctors Yet'
	String get nodoctorsyet => 'No Doctors Yet';

	/// en: 'No Doctors Yet Message'
	String get nodoctorsyetmessage => 'No Doctors Yet Message';

	/// en: 'Refreshing'
	String get refreshing => 'Refreshing';

	/// en: 'operation Failed'
	String get operationfailed => 'operation Failed';

	/// en: 'User profile not found.'
	String get userProfileNotFound => 'User profile not found.';

	/// en: 'This account is not registered as an admin.'
	String get accountNotRegisteredAsAdmin => 'This account is not registered as an admin.';

	/// en: 'This account is not registered as a patient.'
	String get accountNotRegisteredAsPatient => 'This account is not registered as a patient.';

	/// en: 'Unable to sign in. Please try again.'
	String get unableToCompleteSignIn => 'Unable to sign in. Please try again.';

	/// en: 'Unable to verify the code. Please try again.'
	String get unableToVerifyCode => 'Unable to verify the code. Please try again.';

	/// en: 'Unable to reset the password. Please try again.'
	String get unableToResetPassword => 'Unable to reset the password. Please try again.';

	/// en: 'Active Doctors'
	String get activeDoctors => 'Active Doctors';

	/// en: 'Total Doctors'
	String get totalDoctors => 'Total Doctors';

	/// en: 'Specialty'
	String get specialty => 'Specialty';

	/// en: 'Rating'
	String get rating => 'Rating';

	/// en: 'Doctor Status'
	String get doctorStatus => 'Doctor Status';

	/// en: 'Active & Available'
	String get activeAndAvailable => 'Active & Available';

	/// en: 'Active'
	String get active => 'Active';

	/// en: 'Inactive'
	String get inactive => 'Inactive';

	/// en: 'Select specialty'
	String get selectSpecialty => 'Select specialty';

	/// en: 'Edit Doctor'
	String get editDoctor => 'Edit Doctor';

	/// en: 'Create Doctor'
	String get createDoctor => 'Create Doctor';

	/// en: 'DOCTOR NAME'
	String get doctorName => 'DOCTOR NAME';

	/// en: 'e.g. Dr. Ahmed Ali'
	String get doctorNameExample => 'e.g. Dr. Ahmed Ali';

	/// en: 'e.g. 28.00'
	String get consultationFeeExample => 'e.g. 28.00';

	/// en: 'Please enter the doctor name.'
	String get pleaseEnterDoctorName => 'Please enter the doctor name.';

	/// en: 'Please enter the consultation fee.'
	String get pleaseEnterConsultationFee => 'Please enter the consultation fee.';

	/// en: 'Please enter a valid consultation fee.'
	String get pleaseEnterValidConsultationFee => 'Please enter a valid consultation fee.';

	/// en: 'Please select a specialty.'
	String get pleaseSelectSpecialty => 'Please select a specialty.';

	/// en: 'Delete Doctor'
	String get deleteDoctor => 'Delete Doctor';

	/// en: 'Deleting doctor...'
	String get deletingDoctor => 'Deleting doctor...';

	/// en: 'Are you sure you want to delete this doctor?'
	String get confirmDeleteDoctor => 'Are you sure you want to delete this doctor?';

	/// en: 'Unable to load doctor information. Please try again.'
	String get unableToLoadDoctorForm => 'Unable to load doctor information. Please try again.';

	/// en: 'Unable to save doctor information. Please try again.'
	String get unableToSaveDoctor => 'Unable to save doctor information. Please try again.';

	/// en: 'Unable to delete the doctor. Please try again.'
	String get unableToDeleteDoctor => 'Unable to delete the doctor. Please try again.';

	/// en: 'Doctor data is unavailable.'
	String get doctorDataUnavailable => 'Doctor data is unavailable.';

	/// en: 'Manage Availability'
	String get manageAvailability => 'Manage Availability';

	/// en: 'Appointment not found.'
	String get appointmentNotFound => 'Appointment not found.';

	/// en: 'No appointments found.'
	String get noAppointmentsFound => 'No appointments found.';

	/// en: 'Cancel appointment?'
	String get cancelAppointmentQuestionAdmin => 'Cancel appointment?';

	/// en: 'Are you sure you want to cancel this appointment?'
	String get confirmCancelAppointmentAdmin => 'Are you sure you want to cancel this appointment?';

	/// en: 'Complete appointment?'
	String get completeAppointmentQuestion => 'Complete appointment?';

	/// en: 'Confirm that this appointment has been completed.'
	String get confirmAppointmentCompleted => 'Confirm that this appointment has been completed.';

	/// en: 'Go back'
	String get goBack => 'Go back';

	/// en: 'Mark as completed'
	String get markAsCompleted => 'Mark as completed';

	/// en: 'Unable to complete the appointment. Please try again.'
	String get unableToCompleteAppointment => 'Unable to complete the appointment. Please try again.';

	/// en: 'Unable to load appointment details. Please try again.'
	String get unableToLoadAppointmentDetails => 'Unable to load appointment details. Please try again.';

	/// en: 'Unknown Patient'
	String get unknownPatient => 'Unknown Patient';

	/// en: 'Unknown Doctor'
	String get unknownDoctor => 'Unknown Doctor';

	/// en: 'Not available'
	String get notAvailable => 'Not available';

	/// en: 'Shift'
	String get shift => 'Shift';

	/// en: 'Status'
	String get status => 'Status';

	/// en: 'Working day'
	String get workingDay => 'Working day';

	/// en: 'Clinic closed'
	String get clinicClosed => 'Clinic closed';

	/// en: 'Available'
	String get available => 'Available';

	/// en: 'Closed'
	String get closed => 'Closed';

	/// en: 'Mon'
	String get mondayShort => 'Mon';

	/// en: 'Tue'
	String get tuesdayShort => 'Tue';

	/// en: 'Wed'
	String get wednesdayShort => 'Wed';

	/// en: 'Thu'
	String get thursdayShort => 'Thu';

	/// en: 'Fri'
	String get fridayShort => 'Fri';

	/// en: 'Sat'
	String get saturdayShort => 'Sat';

	/// en: 'Sun'
	String get sundayShort => 'Sun';

	/// en: 'Unsaved changes'
	String get unsavedChanges => 'Unsaved changes';

	/// en: 'You have unsaved changes. Do you want to discard them and change the month?'
	String get unsavedSchedulePrompt => 'You have unsaved changes. Do you want to discard them and change the month?';

	/// en: 'Stay'
	String get stay => 'Stay';

	/// en: 'Discard'
	String get discard => 'Discard';

	/// en: 'Schedule operation completed.'
	String get scheduleOperationCompleted => 'Schedule operation completed.';

	/// en: 'Unable to load the schedule. Please try again.'
	String get unableToLoadSchedule => 'Unable to load the schedule. Please try again.';

	/// en: 'Published schedules cannot be saved as drafts. Use the edit icon to update an availability.'
	String get publishedScheduleCannotSaveDraft => 'Published schedules cannot be saved as drafts. Use the edit icon to update an availability.';

	/// en: 'Published schedule. Existing appointments are protected.'
	String get publishedScheduleProtected => 'Published schedule. Existing appointments are protected.';

	/// en: 'Add working days and save them as a draft.'
	String get addWorkingDaysDraft => 'Add working days and save them as a draft.';

	/// en: 'Edit published availability'
	String get editPublishedAvailability => 'Edit published availability';

	/// en: 'Remove from draft'
	String get removeFromDraft => 'Remove from draft';

	/// en: 'Add working day'
	String get addWorkingDay => 'Add working day';

	/// en: 'Save Draft'
	String get saveDraft => 'Save Draft';

	/// en: 'Publish'
	String get publish => 'Publish';

	/// en: 'Save your changes before publishing.'
	String get saveChangesBeforePublishing => 'Save your changes before publishing.';

	/// en: 'Add {weekday}, {day}'
	String get addScheduleDay => 'Add {weekday}, {day}';

	/// en: 'Edit {weekday}, {day}'
	String get editScheduleDay => 'Edit {weekday}, {day}';

	/// en: 'A working shift already exists for this date.'
	String get aShiftAlreadyExistsForDate => 'A working shift already exists for this date.';

	/// en: 'No clinic operating hours found for this day.'
	String get noClinicHoursForDay => 'No clinic operating hours found for this day.';

	/// en: 'No active services are assigned to this doctor.'
	String get noActiveServicesAssigned => 'No active services are assigned to this doctor.';

	/// en: 'No valid medical service was found.'
	String get noValidMedicalService => 'No valid medical service was found.';

	/// en: 'The default clinic hours will be used for this shift.'
	String get defaultClinicHoursForShift => 'The default clinic hours will be used for this shift.';

	/// en: 'Working day added. Press Save Draft to save it.'
	String get workingDayAddedSaveDraft => 'Working day added. Press Save Draft to save it.';

	/// en: 'At least one working day is required. You cannot remove the last day.'
	String get lastWorkingDayRequired => 'At least one working day is required. You cannot remove the last day.';

	/// en: 'A published schedule cannot be saved as a draft.'
	String get cannotSavePublishedScheduleAsDraft => 'A published schedule cannot be saved as a draft.';

	/// en: 'Add at least one working day before saving.'
	String get addWorkingDayBeforeSaving => 'Add at least one working day before saving.';

	/// en: 'Cannot edit this record: availability ID is missing.'
	String get availabilityIdMissing => 'Cannot edit this record: availability ID is missing.';

	/// en: 'No active medical services are available.'
	String get noActiveMedicalServicesAvailable => 'No active medical services are available.';

	/// en: '{weekday} ? Closed'
	String get weekdayClosed => '{weekday} ? Closed';

	/// en: 'Unable to add availability. Please try again.'
	String get unableToAddAvailability => 'Unable to add availability. Please try again.';

	/// en: 'Unable to update availability. Please try again.'
	String get unableToUpdateAvailability => 'Unable to update availability. Please try again.';

	/// en: 'Load a saved draft before publishing.'
	String get loadSavedDraftBeforePublishing => 'Load a saved draft before publishing.';

	/// en: 'Add at least one working day before publishing.'
	String get addWorkingDayBeforePublishing => 'Add at least one working day before publishing.';

	/// en: 'Only a published schedule can be edited.'
	String get onlyPublishedScheduleCanBeEdited => 'Only a published schedule can be edited.';

	/// en: 'Only a published schedule can be updated.'
	String get onlyPublishedScheduleCanBeUpdated => 'Only a published schedule can be updated.';

	/// en: 'No selected month is available.'
	String get noSelectedMonthAvailable => 'No selected month is available.';

	/// en: 'Unable to save the draft. Please try again.'
	String get unableToSaveScheduleDraft => 'Unable to save the draft. Please try again.';

	/// en: 'Unable to publish the schedule. Please try again.'
	String get unableToPublishSchedule => 'Unable to publish the schedule. Please try again.';

	/// en: 'Each doctor can have only one availability record per date.'
	String get onlyOneAvailabilityPerDate => 'Each doctor can have only one availability record per date.';

	/// en: 'This schedule is published. Create a safe revision before editing it.'
	String get publishedScheduleRevisionRequired => 'This schedule is published. Create a safe revision before editing it.';

	/// en: 'Unable to load admin information. Please try again.'
	String get unableToLoadAdminInformation => 'Unable to load admin information. Please try again.';

	/// en: 'Unable to load the admin profile. Please try again.'
	String get unableToLoadAdminProfile => 'Unable to load the admin profile. Please try again.';

	/// en: 'Unable to save the admin profile. Please try again.'
	String get unableToSaveAdminProfile => 'Unable to save the admin profile. Please try again.';

	/// en: 'Unable to choose the clinic location. Please try again.'
	String get unableToChooseClinicLocation => 'Unable to choose the clinic location. Please try again.';

	/// en: 'Please wait while the address is being loaded.'
	String get pleaseWaitForAddress => 'Please wait while the address is being loaded.';

	/// en: 'Please enter the clinic address.'
	String get enterClinicAddress => 'Please enter the clinic address.';

	/// en: 'Please select the clinic location and enter its address.'
	String get selectClinicLocation => 'Please select the clinic location and enter its address.';

	/// en: 'Please select the clinic location on the map.'
	String get selectLocationCoordinates => 'Please select the clinic location on the map.';

	/// en: 'Could not retrieve the area name. Please enter the clinic address manually.'
	String get addressCouldNotBeRetrieved => 'Could not retrieve the area name. Please enter the clinic address manually.';

	/// en: 'Choose Clinic Location'
	String get chooseClinicLocation => 'Choose Clinic Location';

	/// en: 'Getting location address...'
	String get gettingLocationAddress => 'Getting location address...';

	/// en: 'Address unavailable. You can still confirm the coordinates and enter the address manually.'
	String get addressUnavailable => 'Address unavailable. You can still confirm the coordinates and enter the address manually.';

	/// en: 'Tap the map to select the clinic location.'
	String get tapMapToSelectLocation => 'Tap the map to select the clinic location.';

	/// en: 'Latitude'
	String get latitude => 'Latitude';

	/// en: 'Longitude'
	String get longitude => 'Longitude';

	/// en: 'Confirm Location'
	String get confirmLocation => 'Confirm Location';

	/// en: 'Tap photo to add'
	String get tapPhotoToAdd => 'Tap photo to add';

	/// en: 'Morning'
	String get morning => 'Morning';

	/// en: 'Monday'
	String get monday => 'Monday';

	/// en: 'Tuesday'
	String get tuesday => 'Tuesday';

	/// en: 'Wednesday'
	String get wednesday => 'Wednesday';

	/// en: 'Thursday'
	String get thursday => 'Thursday';

	/// en: 'Friday'
	String get friday => 'Friday';

	/// en: 'Saturday'
	String get saturday => 'Saturday';

	/// en: 'Sunday'
	String get sunday => 'Sunday';

	/// en: 'Unable to update doctor status. Please try again.'
	String get unableToUpdateDoctorStatus => 'Unable to update doctor status. Please try again.';

	/// en: 'Unable to delete the doctor. Please try again.'
	String get unableToDeleteDoctorFromList => 'Unable to delete the doctor. Please try again.';

	/// en: 'Clinic hours'
	String get clinicHours => 'Clinic hours';

	/// en: 'Start time'
	String get startTime => 'Start time';

	/// en: 'End time'
	String get endTime => 'End time';

	/// en: 'Use 24-hour time, for example 07:00 or 15:30.'
	String get timeFormatHelp => 'Use 24-hour time, for example 07:00 or 15:30.';

	/// en: 'Enter valid times. Start time must be before end time.'
	String get invalidTimeRange => 'Enter valid times. Start time must be before end time.';

	/// en: 'The selected times must be within clinic hours.'
	String get timesOutsideClinicHours => 'The selected times must be within clinic hours.';

	/// en: 'Unable to edit availability. Please try again.'
	String get unableToEditAvailability => 'Unable to edit availability. Please try again.';

	/// en: 'Complete'
	String get complete => 'Complete';

	/// en: 'Add'
	String get add => 'Add';

	/// en: 'Privacy Policy'
	String get privacyPolicyTitle => 'Privacy Policy';

	/// en: 'Last updated: October 21, 2026'
	String get privacyPolicyLastUpdated => 'Last updated: October 21, 2026';

	/// en: '1. Introduction'
	String get privacyPolicyIntroductionTitle => '1. Introduction';

	/// en: 'Doctor Hunt respects your privacy and is committed to protecting your personal information. This policy explains how your information is collected, used, and protected when you use the application.'
	String get privacyPolicyIntroductionBody => 'Doctor Hunt respects your privacy and is committed to protecting your personal information. This policy explains how your information is collected, used, and protected when you use the application.';

	/// en: '2. Information We Collect'
	String get privacyPolicyInformationTitle => '2. Information We Collect';

	/// en: 'Depending on how you use the application, we may collect your name, email address, phone number, profile picture if uploaded, appointment details, favorite doctors, and reviews or ratings you submit.'
	String get privacyPolicyInformationBody => 'Depending on how you use the application, we may collect your name, email address, phone number, profile picture if uploaded, appointment details, favorite doctors, and reviews or ratings you submit.';

	/// en: '3. How We Use Your Information'
	String get privacyPolicyUsageTitle => '3. How We Use Your Information';

	/// en: 'We use your information to create and manage your account, help you find doctors, manage appointments, save favorite doctors, receive reviews and ratings, and maintain the functionality and security of the application.'
	String get privacyPolicyUsageBody => 'We use your information to create and manage your account, help you find doctors, manage appointments, save favorite doctors, receive reviews and ratings, and maintain the functionality and security of the application.';

	/// en: '4. Data Storage and Security'
	String get privacyPolicySecurityTitle => '4. Data Storage and Security';

	/// en: 'Your information is stored and processed using the services that support Doctor Hunt. Reasonable measures are taken to protect your information against unauthorized access, alteration, disclosure, or loss. However, no electronic storage or transmission method can be guaranteed to be completely secure.'
	String get privacyPolicySecurityBody => 'Your information is stored and processed using the services that support Doctor Hunt. Reasonable measures are taken to protect your information against unauthorized access, alteration, disclosure, or loss. However, no electronic storage or transmission method can be guaranteed to be completely secure.';

	/// en: '5. Data Sharing'
	String get privacyPolicySharingTitle => '5. Data Sharing';

	/// en: 'Your information may be accessed by authorized personnel or service providers when necessary to operate the application and provide its services. Appointment information may be used to facilitate appointment management. Information may also be disclosed when required or permitted by applicable law.'
	String get privacyPolicySharingBody => 'Your information may be accessed by authorized personnel or service providers when necessary to operate the application and provide its services. Appointment information may be used to facilitate appointment management. Information may also be disclosed when required or permitted by applicable law.';

	/// en: '6. Data Retention and Your Rights'
	String get privacyPolicyRightsTitle => '6. Data Retention and Your Rights';

	/// en: 'Your information is retained for as long as necessary to provide the application's services and meet applicable legal requirements. You may request access to, correction of, or deletion of your personal information, subject to applicable laws and legitimate data-retention requirements.'
	String get privacyPolicyRightsBody => 'Your information is retained for as long as necessary to provide the application\'s services and meet applicable legal requirements. You may request access to, correction of, or deletion of your personal information, subject to applicable laws and legitimate data-retention requirements.';

	/// en: '7. Children's Privacy'
	String get privacyPolicyChildrenTitle => '7. Children\'s Privacy';

	/// en: 'Doctor Hunt is not intended to collect personal information directly from children without appropriate authorization where required by law. If you believe personal information has been provided improperly, please contact the team responsible for the application.'
	String get privacyPolicyChildrenBody => 'Doctor Hunt is not intended to collect personal information directly from children without appropriate authorization where required by law. If you believe personal information has been provided improperly, please contact the team responsible for the application.';

	/// en: '8. Changes to This Privacy Policy'
	String get privacyPolicyChangesTitle => '8. Changes to This Privacy Policy';

	/// en: 'This Privacy Policy may be updated from time to time. Changes will be reflected in the updated version displayed in the application, together with the revised update date where applicable.'
	String get privacyPolicyChangesBody => 'This Privacy Policy may be updated from time to time. Changes will be reflected in the updated version displayed in the application, together with the revised update date where applicable.';

	/// en: '9. Contact Us'
	String get privacyPolicyContactTitle => '9. Contact Us';

	/// en: 'If you have questions or concerns about this Privacy Policy or the handling of your personal information, please contact the team responsible for Doctor Hunt through the official contact channel provided by the application.'
	String get privacyPolicyContactBody => 'If you have questions or concerns about this Privacy Policy or the handling of your personal information, please contact the team responsible for Doctor Hunt through the official contact channel provided by the application.';
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
			'errorNetwork' => 'Check your internet connection and try again.',
			'errorTimeout' => 'The request took too long. Please try again.',
			'errorAuthentication' => 'Your session could not be verified. Please sign in again.',
			'errorPermission' => 'You do not have permission to complete this action.',
			'errorValidation' => 'Some information could not be accepted. Please review and try again.',
			'errorNotFound' => 'The requested information could not be found.',
			'errorDatabase' => 'We could not load the information right now. Please try again.',
			'errorUnexpected' => 'Something went wrong. Please try again.',
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
			'emailVerification' => 'Enter your email for the verification process. We will send a 6-digit code to your email.',
			'enterDigit' => 'Enter 6-Digit Code',
			'enterReceivedDigit' => 'Enter the 6-digit code that you received in your email.',
			'reset' => 'Reset Password',
			'newPassword' => 'New Password',
			'reenterPassword' => 'Re-enter Password',
			'entername' => 'Please enter your Name',
			'enterEmail' => 'Please enter your email',
			'enterPassword' => 'Please enter your password',
			'passwordSuccess' => 'Password reset successfully',
			'somethingwentwrong' => 'Something went wrong',
			'failedLogin' => 'Failed to login',
			'failedSignup' => 'Failed to signup',
			'googleSigninFailed' => 'Google sign in failed',
			'otpnorecovery' => 'OTP verified but no recovery session found.',
			'hi' => 'Hi',
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
			'nodoctorfound' => 'No Doctors Found',
			'doctorDetails' => 'Doctor Details',
			'drPediatrician' => 'Dr. Pediatrician',
			'specialistsCardiologist' => 'Specialist Cardiologist ',
			'k28hr' => '\$ 28.00/hr',
			'bookNow' => 'Book Now',
			'running' => 'Runing',
			'ongoing' => 'Ongoing',
			'service' => 'Services',
			'views' => 'views',
			'medicalConsultation' => 'Medical consultation',
			'followUp' => 'Follow-up',
			'generalCheckup' => 'General checkup',
			'dentalCheckup' => 'Dental checkup',
			'teethCleaning' => 'Teeth cleaning',
			'rootCanalTreatment' => 'Root canal treatment',
			'toothExtraction' => 'Tooth extraction',
			'noServicesAvailableForDoctor' => 'No services available for this doctor.',
			'topRatedDoctors' => 'Top Rated Doctors',
			'patientCare' => 'Patient care should be the number one priority.',
			'run' => 'If you run your practice you know how frustrating.',
			'appointmentReminder ' => 'That’s why some of appointment reminder system.',
			'find_doctors' => 'Find Doctors',
			'search_hint' => 'Search for a doctor',
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
			'cardiology' => 'Cardiology',
			'dentistry' => 'Dentistry',
			'dermatology' => 'Dermatology',
			'generalMedicine' => 'General Medicine',
			'internalMedicine' => 'Internal Medicine',
			'neurology' => 'Neurology',
			'ophthalmology' => 'Ophthalmology',
			'pediatrics' => 'Pediatrics',
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
			'book' => 'Book',
			'chat' => 'Chat',
			'myappointments' => 'My Appointments',
			'settings' => 'Settings',
			'favorites' => 'Favorites',
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
			'logout' => 'Logout',
			'confirmLogout' => 'Are you sure you want to logout?',
			'cancel' => 'Cancel',
			'ok' => 'OK',
			'patientUser' => 'Patient User',
			'logoutFailed' => 'Logout failed. Please try again.',
			'noEmailAddress' => 'No email address is available for this account.',
			'passwordResetInstructionsSent' => 'Password reset instructions have been sent to your email.',
			'unableToSendPasswordResetEmail' => 'Unable to send the password reset email.',
			'chooseLanguage' => 'Choose language',
			'english' => 'English',
			'arabic' => 'Arabic',
			'accountSettings' => 'Account settings',
			'privacyPolicy' => 'Privacy Policy',
			'moreOptions' => 'More options',
			'languages' => 'Languages',
			'loggingOut' => 'Logging out...',
			'notifications' => 'Notifications',
			'profile' => 'Profile',
			'personalInformation' => 'Personal information',
			'contactNumber' => 'Contact Number',
			'unableToLoadProfile' => 'Unable to load profile information.',
			'unableToSelectImage' => 'Unable to select the image.',
			'pleaseSignInAgain' => 'Please sign in again.',
			'enterYourFullName' => 'Please enter your full name.',
			'enterYourPhoneNumber' => 'Please enter your phone number.',
			'profileUpdatedSuccessfully' => 'Profile updated successfully.',
			'unableToSaveProfile' => 'Unable to save profile. Check your connection and permissions.',
			'appointments' => 'Appointments',
			'upcoming' => 'Upcoming',
			'completed' => 'Completed',
			'cancelled' => 'Cancelled',
			'tryAgain' => 'Try Again',
			'retry' => 'Retry',
			'noUpcomingAppointments' => 'You have no upcoming appointments.',
			'noCompletedAppointments' => 'You have no completed appointments.',
			'noCancelledAppointments' => 'You have no cancelled appointments.',
			'appointmentDate' => 'Appointment date',
			'appointmentTime' => 'Appointment time',
			'medicalService' => 'Medical service',
			'consultationFee' => 'Consultation fee',
			'viewDetails' => 'View Details',
			'rateDoctor' => 'Rate Doctor',
			'rated' => 'Rated',
			'cancelAppointment' => 'Cancel Appointment',
			'doctorInformationUnavailable' => 'Doctor information is unavailable.',
			'invalidReviewInformation' => 'Invalid review information.',
			'reviewSubmittedSuccessfully' => 'Review submitted successfully.',
			'howWasYourExperience' => 'How was your experience?',
			'commentOptional' => 'Comment (optional)',
			'submitReview' => 'Submit Review',
			'cancelAppointmentQuestion' => 'Cancel Appointment?',
			'confirmCancelAppointment' => 'Are you sure you want to cancel this appointment?',
			'keepAppointment' => 'Keep Appointment',
			'appointmentCancelledSuccessfully' => 'Appointment cancelled successfully.',
			'appointmentDetails' => 'Appointment Details',
			'date' => 'Date',
			'time' => 'Time',
			'fee' => 'Fee',
			'close' => 'Close',
			'unableToLoadAppointments' => 'Unable to load appointments. Please try again.',
			'unableToCancelAppointment' => 'Unable to cancel the appointment. Please try again.',
			'unableToSubmitReview' => 'Unable to submit your review. Please try again.',
			'unableToLoadDoctorDetails' => 'Unable to load doctor details.',
			'unableToLoadAvailableTimes' => 'Unable to load available times. Please try again.',
			'unableToBookAppointment' => 'Unable to book this appointment. It may no longer be available. Please try again.',
			'clinicLocation' => 'Clinic Location',
			'unableToLoadClinicLocation' => 'Unable to load clinic location.',
			'clinicLocationUnavailable' => 'Clinic location is not available.',
			'noReviewsYet' => 'No reviews yet.',
			'patientReviews' => 'Patient Reviews',
			'reviews' => 'Reviews',
			'noWrittenComment' => 'No written comment.',
			'thankYou' => 'Thank You!',
			'appointmentBookingSuccessful' => 'Your appointment was booked successfully.',
			'doctor' => 'Doctor',
			'done' => 'Done',
			'selectDateLabel' => 'Select Date',
			'noAvailableDatesThisMonth' => 'No available dates this month.',
			'availableTimeSlots' => 'Available Time Slots',
			'selectHighlightedDateForTimes' => 'Select a highlighted date to see available times.',
			'noAvailableTimesForDate' => 'No available times for this date.',
			'confirm' => 'Confirm',
			'previousMonth' => 'Previous month',
			'nextMonth' => 'Next month',
			'january' => 'January',
			'february' => 'February',
			'march' => 'March',
			'april' => 'April',
			'may' => 'May',
			'june' => 'June',
			'july' => 'July',
			'august' => 'August',
			'september' => 'September',
			'october' => 'October',
			'november' => 'November',
			'december' => 'December',
			'populardoctor' => 'Popular Doctors',
			'tapphoto' => 'Tap photo to change',
			'fullname' => 'FULL NAME',
			'emailaddress' => 'EMAIL ADDRESS',
			'cliniclocation' => 'CLINIC LOCATION',
			'adminhintemail' => 'admin@doctorhunt.com',
			'doctorhunthq' => 'DoctorHunt HQ Clinic',
			'enterfullname' => 'EnterFullName',
			'savechange' => 'Save Changes',
			'administrator' => 'Administrator',
			'adminprofile' => 'Admin Profile',
			'editsuperadmin' => 'Edit super admin details & permissions',
			'changepassword' => 'Change Password',
			'updatecredentials' => 'Update master security credentials',
			'appinfo' => 'App Information',
			'buildversion' => 'Build version',
			'version' => 'v1.0.0',
			'doctors' => 'Doctors',
			'searchdoctor' => 'Search doctors...',
			'adddoctor' => 'Add Doctor',
			'unabletoloaddoctors' => 'Unable to load doctors.',
			'nodoctorsfound' => 'No Doctors Found',
			'nodoctoematch' => 'No doctors match your search or selected specialty.',
			'nodoctorsyet' => 'No Doctors Yet',
			'nodoctorsyetmessage' => 'No Doctors Yet Message',
			'refreshing' => 'Refreshing',
			'operationfailed' => 'operation Failed',
			'userProfileNotFound' => 'User profile not found.',
			'accountNotRegisteredAsAdmin' => 'This account is not registered as an admin.',
			'accountNotRegisteredAsPatient' => 'This account is not registered as a patient.',
			'unableToCompleteSignIn' => 'Unable to sign in. Please try again.',
			'unableToVerifyCode' => 'Unable to verify the code. Please try again.',
			'unableToResetPassword' => 'Unable to reset the password. Please try again.',
			'activeDoctors' => 'Active Doctors',
			'totalDoctors' => 'Total Doctors',
			'specialty' => 'Specialty',
			'rating' => 'Rating',
			'doctorStatus' => 'Doctor Status',
			'activeAndAvailable' => 'Active & Available',
			'active' => 'Active',
			'inactive' => 'Inactive',
			'selectSpecialty' => 'Select specialty',
			'editDoctor' => 'Edit Doctor',
			'createDoctor' => 'Create Doctor',
			'doctorName' => 'DOCTOR NAME',
			'doctorNameExample' => 'e.g. Dr. Ahmed Ali',
			'consultationFeeExample' => 'e.g. 28.00',
			'pleaseEnterDoctorName' => 'Please enter the doctor name.',
			'pleaseEnterConsultationFee' => 'Please enter the consultation fee.',
			'pleaseEnterValidConsultationFee' => 'Please enter a valid consultation fee.',
			'pleaseSelectSpecialty' => 'Please select a specialty.',
			'deleteDoctor' => 'Delete Doctor',
			'deletingDoctor' => 'Deleting doctor...',
			'confirmDeleteDoctor' => 'Are you sure you want to delete this doctor?',
			'unableToLoadDoctorForm' => 'Unable to load doctor information. Please try again.',
			'unableToSaveDoctor' => 'Unable to save doctor information. Please try again.',
			'unableToDeleteDoctor' => 'Unable to delete the doctor. Please try again.',
			'doctorDataUnavailable' => 'Doctor data is unavailable.',
			'manageAvailability' => 'Manage Availability',
			'appointmentNotFound' => 'Appointment not found.',
			'noAppointmentsFound' => 'No appointments found.',
			'cancelAppointmentQuestionAdmin' => 'Cancel appointment?',
			'confirmCancelAppointmentAdmin' => 'Are you sure you want to cancel this appointment?',
			'completeAppointmentQuestion' => 'Complete appointment?',
			'confirmAppointmentCompleted' => 'Confirm that this appointment has been completed.',
			'goBack' => 'Go back',
			'markAsCompleted' => 'Mark as completed',
			'unableToCompleteAppointment' => 'Unable to complete the appointment. Please try again.',
			'unableToLoadAppointmentDetails' => 'Unable to load appointment details. Please try again.',
			'unknownPatient' => 'Unknown Patient',
			'unknownDoctor' => 'Unknown Doctor',
			'notAvailable' => 'Not available',
			'shift' => 'Shift',
			'status' => 'Status',
			'workingDay' => 'Working day',
			'clinicClosed' => 'Clinic closed',
			'available' => 'Available',
			'closed' => 'Closed',
			'mondayShort' => 'Mon',
			'tuesdayShort' => 'Tue',
			'wednesdayShort' => 'Wed',
			'thursdayShort' => 'Thu',
			'fridayShort' => 'Fri',
			'saturdayShort' => 'Sat',
			'sundayShort' => 'Sun',
			'unsavedChanges' => 'Unsaved changes',
			'unsavedSchedulePrompt' => 'You have unsaved changes. Do you want to discard them and change the month?',
			'stay' => 'Stay',
			'discard' => 'Discard',
			'scheduleOperationCompleted' => 'Schedule operation completed.',
			'unableToLoadSchedule' => 'Unable to load the schedule. Please try again.',
			'publishedScheduleCannotSaveDraft' => 'Published schedules cannot be saved as drafts. Use the edit icon to update an availability.',
			'publishedScheduleProtected' => 'Published schedule. Existing appointments are protected.',
			'addWorkingDaysDraft' => 'Add working days and save them as a draft.',
			'editPublishedAvailability' => 'Edit published availability',
			'removeFromDraft' => 'Remove from draft',
			'addWorkingDay' => 'Add working day',
			'saveDraft' => 'Save Draft',
			'publish' => 'Publish',
			'saveChangesBeforePublishing' => 'Save your changes before publishing.',
			'addScheduleDay' => 'Add {weekday}, {day}',
			'editScheduleDay' => 'Edit {weekday}, {day}',
			'aShiftAlreadyExistsForDate' => 'A working shift already exists for this date.',
			'noClinicHoursForDay' => 'No clinic operating hours found for this day.',
			'noActiveServicesAssigned' => 'No active services are assigned to this doctor.',
			'noValidMedicalService' => 'No valid medical service was found.',
			'defaultClinicHoursForShift' => 'The default clinic hours will be used for this shift.',
			'workingDayAddedSaveDraft' => 'Working day added. Press Save Draft to save it.',
			'lastWorkingDayRequired' => 'At least one working day is required. You cannot remove the last day.',
			'cannotSavePublishedScheduleAsDraft' => 'A published schedule cannot be saved as a draft.',
			'addWorkingDayBeforeSaving' => 'Add at least one working day before saving.',
			'availabilityIdMissing' => 'Cannot edit this record: availability ID is missing.',
			'noActiveMedicalServicesAvailable' => 'No active medical services are available.',
			'weekdayClosed' => '{weekday} ? Closed',
			'unableToAddAvailability' => 'Unable to add availability. Please try again.',
			'unableToUpdateAvailability' => 'Unable to update availability. Please try again.',
			'loadSavedDraftBeforePublishing' => 'Load a saved draft before publishing.',
			'addWorkingDayBeforePublishing' => 'Add at least one working day before publishing.',
			'onlyPublishedScheduleCanBeEdited' => 'Only a published schedule can be edited.',
			'onlyPublishedScheduleCanBeUpdated' => 'Only a published schedule can be updated.',
			'noSelectedMonthAvailable' => 'No selected month is available.',
			'unableToSaveScheduleDraft' => 'Unable to save the draft. Please try again.',
			'unableToPublishSchedule' => 'Unable to publish the schedule. Please try again.',
			'onlyOneAvailabilityPerDate' => 'Each doctor can have only one availability record per date.',
			'publishedScheduleRevisionRequired' => 'This schedule is published. Create a safe revision before editing it.',
			'unableToLoadAdminInformation' => 'Unable to load admin information. Please try again.',
			'unableToLoadAdminProfile' => 'Unable to load the admin profile. Please try again.',
			'unableToSaveAdminProfile' => 'Unable to save the admin profile. Please try again.',
			'unableToChooseClinicLocation' => 'Unable to choose the clinic location. Please try again.',
			'pleaseWaitForAddress' => 'Please wait while the address is being loaded.',
			'enterClinicAddress' => 'Please enter the clinic address.',
			'selectClinicLocation' => 'Please select the clinic location and enter its address.',
			'selectLocationCoordinates' => 'Please select the clinic location on the map.',
			'addressCouldNotBeRetrieved' => 'Could not retrieve the area name. Please enter the clinic address manually.',
			'chooseClinicLocation' => 'Choose Clinic Location',
			'gettingLocationAddress' => 'Getting location address...',
			'addressUnavailable' => 'Address unavailable. You can still confirm the coordinates and enter the address manually.',
			'tapMapToSelectLocation' => 'Tap the map to select the clinic location.',
			'latitude' => 'Latitude',
			'longitude' => 'Longitude',
			'confirmLocation' => 'Confirm Location',
			'tapPhotoToAdd' => 'Tap photo to add',
			'morning' => 'Morning',
			'monday' => 'Monday',
			'tuesday' => 'Tuesday',
			'wednesday' => 'Wednesday',
			'thursday' => 'Thursday',
			'friday' => 'Friday',
			'saturday' => 'Saturday',
			'sunday' => 'Sunday',
			'unableToUpdateDoctorStatus' => 'Unable to update doctor status. Please try again.',
			'unableToDeleteDoctorFromList' => 'Unable to delete the doctor. Please try again.',
			'clinicHours' => 'Clinic hours',
			'startTime' => 'Start time',
			'endTime' => 'End time',
			'timeFormatHelp' => 'Use 24-hour time, for example 07:00 or 15:30.',
			'invalidTimeRange' => 'Enter valid times. Start time must be before end time.',
			'timesOutsideClinicHours' => 'The selected times must be within clinic hours.',
			'unableToEditAvailability' => 'Unable to edit availability. Please try again.',
			'complete' => 'Complete',
			'add' => 'Add',
			'privacyPolicyTitle' => 'Privacy Policy',
			'privacyPolicyLastUpdated' => 'Last updated: October 21, 2026',
			'privacyPolicyIntroductionTitle' => '1. Introduction',
			'privacyPolicyIntroductionBody' => 'Doctor Hunt respects your privacy and is committed to protecting your personal information. This policy explains how your information is collected, used, and protected when you use the application.',
			'privacyPolicyInformationTitle' => '2. Information We Collect',
			'privacyPolicyInformationBody' => 'Depending on how you use the application, we may collect your name, email address, phone number, profile picture if uploaded, appointment details, favorite doctors, and reviews or ratings you submit.',
			'privacyPolicyUsageTitle' => '3. How We Use Your Information',
			'privacyPolicyUsageBody' => 'We use your information to create and manage your account, help you find doctors, manage appointments, save favorite doctors, receive reviews and ratings, and maintain the functionality and security of the application.',
			'privacyPolicySecurityTitle' => '4. Data Storage and Security',
			'privacyPolicySecurityBody' => 'Your information is stored and processed using the services that support Doctor Hunt. Reasonable measures are taken to protect your information against unauthorized access, alteration, disclosure, or loss. However, no electronic storage or transmission method can be guaranteed to be completely secure.',
			'privacyPolicySharingTitle' => '5. Data Sharing',
			'privacyPolicySharingBody' => 'Your information may be accessed by authorized personnel or service providers when necessary to operate the application and provide its services. Appointment information may be used to facilitate appointment management. Information may also be disclosed when required or permitted by applicable law.',
			'privacyPolicyRightsTitle' => '6. Data Retention and Your Rights',
			'privacyPolicyRightsBody' => 'Your information is retained for as long as necessary to provide the application\'s services and meet applicable legal requirements. You may request access to, correction of, or deletion of your personal information, subject to applicable laws and legitimate data-retention requirements.',
			'privacyPolicyChildrenTitle' => '7. Children\'s Privacy',
			'privacyPolicyChildrenBody' => 'Doctor Hunt is not intended to collect personal information directly from children without appropriate authorization where required by law. If you believe personal information has been provided improperly, please contact the team responsible for the application.',
			'privacyPolicyChangesTitle' => '8. Changes to This Privacy Policy',
			'privacyPolicyChangesBody' => 'This Privacy Policy may be updated from time to time. Changes will be reflected in the updated version displayed in the application, together with the revised update date where applicable.',
			'privacyPolicyContactTitle' => '9. Contact Us',
			'privacyPolicyContactBody' => 'If you have questions or concerns about this Privacy Policy or the handling of your personal information, please contact the team responsible for Doctor Hunt through the official contact channel provided by the application.',
			_ => null,
		};
	}
}
