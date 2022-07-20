// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTheme": MessageLookupByLibrary.simpleMessage("App theme"),
        "authorized": MessageLookupByLibrary.simpleMessage("Authorized"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "incorrectUsernamePassword": MessageLookupByLibrary.simpleMessage(
            "Username or password is incorrect"),
        "inputErrorPasswordShort": MessageLookupByLibrary.simpleMessage(
            "Password must contain more then 8 symbols"),
        "inputErrorUsernameShort": MessageLookupByLibrary.simpleMessage(
            "Username must contain more than 3 symbols"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "noData": MessageLookupByLibrary.simpleMessage("No Data"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "products": MessageLookupByLibrary.simpleMessage("Products"),
        "rating": MessageLookupByLibrary.simpleMessage("Rating"),
        "russian": MessageLookupByLibrary.simpleMessage("Russian"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized"),
        "username": MessageLookupByLibrary.simpleMessage("Username")
      };
}
