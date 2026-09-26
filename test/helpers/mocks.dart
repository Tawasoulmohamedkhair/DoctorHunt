
import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/Patient/features/auth/cubit/auth_cubit_state.dart';

class MockAuthCubit extends MockCubit<AuthCubitState> implements AuthCubit {}