// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru_RU locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru_RU';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTheme": MessageLookupByLibrary.simpleMessage("Тема"),
        "authorized": MessageLookupByLibrary.simpleMessage("Авторизован"),
        "english": MessageLookupByLibrary.simpleMessage("Английский"),
        "incorrectUsernamePassword": MessageLookupByLibrary.simpleMessage(
            "Неверное имя пользователя или пароль"),
        "inputErrorPasswordShort": MessageLookupByLibrary.simpleMessage(
            "Пароль должен содержать не менее 8 символов"),
        "inputErrorUsernameShort": MessageLookupByLibrary.simpleMessage(
            "Имя пользователя должно содержать не менее 3 символов"),
        "language": MessageLookupByLibrary.simpleMessage("Язык"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "russian": MessageLookupByLibrary.simpleMessage("Русский"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Что то пошло не так"),
        "unauthorized": MessageLookupByLibrary.simpleMessage("Неавторизован"),
        "username": MessageLookupByLibrary.simpleMessage("Имя пользователя")
      };
}
