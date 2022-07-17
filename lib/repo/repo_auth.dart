import 'dart:convert';
import 'dart:developer';

import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/repo/api.dart';

abstract class RepoAuth {
  Future<ResultRepoAuth> authorize(String username, String password);
}

class RepoAuthImpl extends RepoAuth {
  @override
  Future<ResultRepoAuth> authorize(String username, String password) async {
    if (username != 'qwerty' && password != '123456ab') {
      log(S.current.incorrectUsernamePassword);
      return ResultRepoAuth(errorMessage: S.current.incorrectUsernamePassword);
    }
    try {
      final json = jsonEncode({'username': 'mor_2314', 'password': '83r5^_'});
      final response = await Api().dio.post('/auth/login', data: json);
      final token = response.data['token'];
      log(S.current.authorized);
      return ResultRepoAuth(token: token);
    } catch (e) {
      log(S.current.somethingWentWrong, error: e);
      return ResultRepoAuth(errorMessage: S.current.somethingWentWrong);
    }
  }
}

class ResultRepoAuth {
  ResultRepoAuth({this.token, this.errorMessage});

  final String? token;
  final String? errorMessage;
}
