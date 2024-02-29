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
        "createOneNow": MessageLookupByLibrary.simpleMessage("Create one now!"),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "error400": MessageLookupByLibrary.simpleMessage(
            "The request could not be understood or was missing some parameters"),
        "error401": MessageLookupByLibrary.simpleMessage(
            "Authentication error! Please log in again or check your permissions"),
        "error403": MessageLookupByLibrary.simpleMessage(
            "Access denied! You don\'\'t have permissions to access this resource"),
        "error404": MessageLookupByLibrary.simpleMessage(
            "Resource not found! We couldn\'\'t find what you were looking for"),
        "error405": MessageLookupByLibrary.simpleMessage(
            "The request method is not supported for the requested resource"),
        "error429": MessageLookupByLibrary.simpleMessage(
            "Too many requests! Please wait a moment and try again"),
        "error500": MessageLookupByLibrary.simpleMessage(
            "Oops, something went wrong on our server. We\'\'re working to fix it"),
        "error502": MessageLookupByLibrary.simpleMessage(
            "Gateway error! An invalid response was received from the server"),
        "error503": MessageLookupByLibrary.simpleMessage(
            "Service unavailable! The server is currently unable to handle the request"),
        "error504": MessageLookupByLibrary.simpleMessage(
            "Timeout error! We couldn\'\'t receive a timely response from the server"),
        "errorDefault": MessageLookupByLibrary.simpleMessage(
            "Oops! Something went wrong and we couldn\'\'t process your request"),
        "haveAccount":
            MessageLookupByLibrary.simpleMessage("Do you have an Account?"),
        "login": MessageLookupByLibrary.simpleMessage("Log In"),
        "loginNow": MessageLookupByLibrary.simpleMessage("Log In Now!"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "termsAndConditions":
            MessageLookupByLibrary.simpleMessage("Terms and Conditions")
      };
}
