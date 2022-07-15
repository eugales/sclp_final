import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sclp_final/repo/repo_auth.dart';

import 'repo_auth_test.mocks.dart';

class FakeRepoAuth extends Mock implements RepoAuth {}

@GenerateMocks([FakeRepoAuth])
Future<void> main() async {
  late MockFakeRepoAuth repoAuth;

  setUpAll(() {
    repoAuth = MockFakeRepoAuth();
  });

  group('authorize', () {
    test('returns ResultRepoAuth with token', () async {
      final model = ResultRepoAuth(token: 'eyJhbGciOiJIUzI1NiIsInR');
      when(repoAuth.authorize('qwerty', '123456ab'))
          .thenAnswer((realInvocation) async {
        return model;
      });

      final response = await repoAuth.authorize('qwerty', '123456ab');

      expect(response, isA<ResultRepoAuth>());
      expect(response, model);
      expect(response.token, isNotNull);
    });

    test('return ResultRepoAuth with error message', () async {
      when(repoAuth.authorize('invalid', 'invalid'))
          .thenAnswer((realInvocation) async {
        return ResultRepoAuth(
            errorMessage: 'S.current.incorrectUsernamePassword');
      });

      final response = await repoAuth.authorize('invalid', 'invalid');

      expect(response, isA<ResultRepoAuth>());
      expect(response.errorMessage, isNotNull);
    });
  });
}
