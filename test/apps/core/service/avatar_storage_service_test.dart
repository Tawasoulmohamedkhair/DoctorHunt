import 'dart:io';

import 'package:doctor_hunt/apps/core/service/avatar_storage_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockSupabaseStorageClient extends Mock implements SupabaseStorageClient {}

class MockStorageFileApi extends Mock implements StorageFileApi {}

class FakeFileOptions extends Fake implements FileOptions {}

class FakeFile extends Fake implements File {}

void main() {
  late MockSupabaseClient supabaseClient;
  late MockSupabaseStorageClient storageClient;
  late MockStorageFileApi storageFileApi;
  late AvatarStorageService service;
  late FakeFile file;

  const path = 'patients/patient-1/profile.png';
  const publicUrl =
      'https://example.supabase.co/storage/v1/object/public/avatars/$path';

  setUpAll(() {
    registerFallbackValue(FakeFileOptions());
    registerFallbackValue(FakeFile());
  });

  setUp(() {
    supabaseClient = MockSupabaseClient();
    storageClient = MockSupabaseStorageClient();
    storageFileApi = MockStorageFileApi();
    service = AvatarStorageService(supabaseClient);
    file = FakeFile();

    when(() => supabaseClient.storage).thenReturn(storageClient);
    when(() => storageClient.from('avatars')).thenReturn(storageFileApi);
  });

  group('AvatarStorageService', () {
    group('upload', () {
      test('uploads the file and returns its public URL', () async {
        when(
          () => storageFileApi.upload(
            path,
            any(),
            fileOptions: any(named: 'fileOptions'),
          ),
        ).thenAnswer((_) async => 'uploaded');

        when(() => storageFileApi.getPublicUrl(path)).thenReturn(publicUrl);

        final result = await service.upload(path: path, file: file);

        expect(result, publicUrl);

        verify(
          () => storageFileApi.upload(
            path,
            file,
            fileOptions: any(named: 'fileOptions', that: isA<FileOptions>()),
          ),
        ).called(1);

        verify(() => storageFileApi.getPublicUrl(path)).called(1);
      });

      test('passes upsert true when requested', () async {
        when(
          () => storageFileApi.upload(
            path,
            any(),
            fileOptions: any(named: 'fileOptions'),
          ),
        ).thenAnswer((_) async => 'uploaded');

        when(() => storageFileApi.getPublicUrl(path)).thenReturn(publicUrl);

        await service.upload(path: path, file: file, upsert: true);

        final captured =
            verify(
                  () => storageFileApi.upload(
                    path,
                    file,
                    fileOptions: captureAny(named: 'fileOptions'),
                  ),
                ).captured.single
                as FileOptions;

        expect(captured.upsert, isTrue);
      });

      test('does not return a URL when upload fails', () async {
        when(
          () => storageFileApi.upload(
            path,
            any(),
            fileOptions: any(named: 'fileOptions'),
          ),
        ).thenThrow(Exception('Upload failed'));

        await expectLater(
          service.upload(path: path, file: file),
          throwsA(isA<Exception>()),
        );

        verifyNever(() => storageFileApi.getPublicUrl(path));
      });
    });
  });
}
