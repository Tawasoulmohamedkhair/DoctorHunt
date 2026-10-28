import 'package:doctor_hunt/apps/core/di/injection.dart';
import 'package:doctor_hunt/apps/core/repository/doctor_repository.dart';
import 'package:doctor_hunt/apps/core/service/avatar_storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockAvatarStorageService extends Mock implements AvatarStorageService {}

void main() {
  late MockSupabaseClient supabaseClient;
  late MockAvatarStorageService avatarStorageService;
  late DoctorRepository repository;

  setUp(() async {
    await getIt.reset();

    supabaseClient = MockSupabaseClient();
    avatarStorageService = MockAvatarStorageService();

    getIt.registerSingleton<AvatarStorageService>(avatarStorageService);

    repository = DoctorRepository(supabaseClient);
  });

  tearDown(() async {
    await getIt.reset();
  });

  group('DoctorRepository', () {
    group('getBookedSlots', () {
      test('returns an empty list when availability IDs are empty', () async {
        final result = await repository.getBookedSlots([]);

        expect(result, isEmpty);

        verifyNever(
          () => supabaseClient.rpc(any(), params: any(named: 'params')),
        );
      });
    });
  });
}
