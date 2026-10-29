import 'dart:io';

import 'package:doctor_hunt/apps/core/service/avatar_storage_service.dart';
import 'package:doctor_hunt/apps/features/admin/core/repository/admin_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockGoTrueClient extends Mock implements GoTrueClient {}

class MockUser extends Mock implements User {}

class MockAvatarStorageService extends Mock implements AvatarStorageService {}

class FakeFile extends Fake implements File {}

void main() {
  late MockSupabaseClient client;
  late MockGoTrueClient auth;
  late MockUser user;
  late MockAvatarStorageService avatarStorage;
  late AdminRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeFile());
  });

  setUp(() {
    client = MockSupabaseClient();
    auth = MockGoTrueClient();
    user = MockUser();
    avatarStorage = MockAvatarStorageService();

    when(() => client.auth).thenReturn(auth);
    when(() => auth.currentUser).thenReturn(user);
    when(() => user.id).thenReturn('admin-1');
    when(() => user.email).thenReturn('admin@example.com');

    repository = AdminRepository(client, avatarStorage);
  });

  group('getAdmin', () {
    test('rejects unauthenticated access without querying Supabase', () async {
      when(() => auth.currentUser).thenReturn(null);

      await expectLater(repository.getAdmin(), throwsException);

      verifyNever(() => client.from(any()));
    });
  });

  group('updateProfile', () {
    test('rejects unauthenticated update before any query', () async {
      when(() => auth.currentUser).thenReturn(null);

      await expectLater(
        repository.updateProfile(
          fullName: 'Updated Name',
          clinicLocation: 'Muscat',
        ),
        throwsException,
      );

      verifyNever(() => client.from(any()));
    });
  });

  group('uploadProfileImage', () {
    test('rejects unauthenticated upload before storage access', () async {
      when(() => auth.currentUser).thenReturn(null);

      final file = File('unused-test-image.png');

      await expectLater(
        repository.uploadProfileImage(file: file, extension: 'png'),
        throwsException,
      );

      verifyNever(
        () => avatarStorage.upload(
          path: any(named: 'path'),
          file: any(named: 'file'),
          upsert: any(named: 'upsert'),
        ),
      );

      verifyNever(() => client.from(any()));
    });
  });
}
