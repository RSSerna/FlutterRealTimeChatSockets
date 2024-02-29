// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Create one now!`
  String get createOneNow {
    return Intl.message(
      'Create one now!',
      name: 'createOneNow',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login {
    return Intl.message(
      'Log In',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an Account?`
  String get haveAccount {
    return Intl.message(
      'Do you have an Account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log In Now!`
  String get loginNow {
    return Intl.message(
      'Log In Now!',
      name: 'loginNow',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `The request could not be understood or was missing some parameters`
  String get error400 {
    return Intl.message(
      'The request could not be understood or was missing some parameters',
      name: 'error400',
      desc: '',
      args: [],
    );
  }

  /// `Authentication error! Please log in again or check your permissions`
  String get error401 {
    return Intl.message(
      'Authentication error! Please log in again or check your permissions',
      name: 'error401',
      desc: '',
      args: [],
    );
  }

  /// `Access denied! You don''t have permissions to access this resource`
  String get error403 {
    return Intl.message(
      'Access denied! You don\'\'t have permissions to access this resource',
      name: 'error403',
      desc: '',
      args: [],
    );
  }

  /// `Resource not found! We couldn''t find what you were looking for`
  String get error404 {
    return Intl.message(
      'Resource not found! We couldn\'\'t find what you were looking for',
      name: 'error404',
      desc: '',
      args: [],
    );
  }

  /// `The request method is not supported for the requested resource`
  String get error405 {
    return Intl.message(
      'The request method is not supported for the requested resource',
      name: 'error405',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests! Please wait a moment and try again`
  String get error429 {
    return Intl.message(
      'Too many requests! Please wait a moment and try again',
      name: 'error429',
      desc: '',
      args: [],
    );
  }

  /// `Oops, something went wrong on our server. We''re working to fix it`
  String get error500 {
    return Intl.message(
      'Oops, something went wrong on our server. We\'\'re working to fix it',
      name: 'error500',
      desc: '',
      args: [],
    );
  }

  /// `Gateway error! An invalid response was received from the server`
  String get error502 {
    return Intl.message(
      'Gateway error! An invalid response was received from the server',
      name: 'error502',
      desc: '',
      args: [],
    );
  }

  /// `Service unavailable! The server is currently unable to handle the request`
  String get error503 {
    return Intl.message(
      'Service unavailable! The server is currently unable to handle the request',
      name: 'error503',
      desc: '',
      args: [],
    );
  }

  /// `Timeout error! We couldn''t receive a timely response from the server`
  String get error504 {
    return Intl.message(
      'Timeout error! We couldn\'\'t receive a timely response from the server',
      name: 'error504',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Something went wrong and we couldn''t process your request`
  String get errorDefault {
    return Intl.message(
      'Oops! Something went wrong and we couldn\'\'t process your request',
      name: 'errorDefault',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
