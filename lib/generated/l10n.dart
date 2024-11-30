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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `News App`
  String get title {
    return Intl.message(
      'News App',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get categoryBusiness {
    return Intl.message(
      'Business',
      name: 'categoryBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get categoryEntertainment {
    return Intl.message(
      'Entertainment',
      name: 'categoryEntertainment',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get categoryGeneral {
    return Intl.message(
      'General',
      name: 'categoryGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get categoryHealth {
    return Intl.message(
      'Health',
      name: 'categoryHealth',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get categoryScience {
    return Intl.message(
      'Science',
      name: 'categoryScience',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get categorySports {
    return Intl.message(
      'Sports',
      name: 'categorySports',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get categoryTechnology {
    return Intl.message(
      'Technology',
      name: 'categoryTechnology',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `About the Programmer`
  String get aboutProgrammer {
    return Intl.message(
      'About the Programmer',
      name: 'aboutProgrammer',
      desc: '',
      args: [],
    );
  }

  /// `Name: Víctor Narváez`
  String get name {
    return Intl.message(
      'Name: Víctor Narváez',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Mail: Vicboss2002@gmail.com`
  String get mail {
    return Intl.message(
      'Mail: Vicboss2002@gmail.com',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Role: Flutter Developer`
  String get role {
    return Intl.message(
      'Role: Flutter Developer',
      name: 'role',
      desc: '',
      args: [],
    );
  }

  /// `About the Api`
  String get aboutApi {
    return Intl.message(
      'About the Api',
      name: 'aboutApi',
      desc: '',
      args: [],
    );
  }

  /// `This app uses NewsAPI to get the latest news from different categories like business, entertainment, health, technology, and more. The API provides up-to-date and reliable information from multiple globally recognized news sources.`
  String get apiText {
    return Intl.message(
      'This app uses NewsAPI to get the latest news from different categories like business, entertainment, health, technology, and more. The API provides up-to-date and reliable information from multiple globally recognized news sources.',
      name: 'apiText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
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
  Future<S> load(Locale locale) => S.load(locale);
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
