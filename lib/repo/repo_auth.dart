import 'dart:developer';

import 'package:dio/dio.dart';
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
      throw ResultRepoAuth(errorMessage: S.current.incorrectUsernamePassword);
    }
    try {
      final response = await Api().dio.post(
        '/auth/login',
        data: {username: 'mor_2314', password: '83r5^_'},
      );
      final token = response.data['token'];
      return ResultRepoAuth(token: token);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        throw ResultRepoAuth(errorMessage: S.current.unauthorized);
      }
      return ResultRepoAuth(errorMessage: S.current.somethingWentWrong);
    } catch (e) {
      log(S.current.somethingWentWrong, error: e);
      throw ResultRepoAuth(errorMessage: S.current.somethingWentWrong);
    }
  }
}

class ResultRepoAuth {
  ResultRepoAuth({this.token, this.errorMessage});

  final String? token;
  final String? errorMessage;
}
