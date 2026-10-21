
import 'package:bloc_test/bloc_test.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit.dart';
import 'package:doctor_hunt/apps/features/common/auth/presentation/cubit/auth_cubit_state.dart';

class MockAuthCubit extends MockCubit<AuthCubitState> implements AuthCubit {}