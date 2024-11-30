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
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "aboutApi": MessageLookupByLibrary.simpleMessage("About the Api"),
        "aboutProgrammer":
            MessageLookupByLibrary.simpleMessage("About the Programmer"),
        "apiText": MessageLookupByLibrary.simpleMessage(
            "This app uses NewsAPI to get the latest news from different categories like business, entertainment, health, technology, and more. The API provides up-to-date and reliable information from multiple globally recognized news sources."),
        "categories": MessageLookupByLibrary.simpleMessage("Categories"),
        "categoryBusiness": MessageLookupByLibrary.simpleMessage("Business"),
        "categoryEntertainment":
            MessageLookupByLibrary.simpleMessage("Entertainment"),
        "categoryGeneral": MessageLookupByLibrary.simpleMessage("General"),
        "categoryHealth": MessageLookupByLibrary.simpleMessage("Health"),
        "categoryScience": MessageLookupByLibrary.simpleMessage("Science"),
        "categorySports": MessageLookupByLibrary.simpleMessage("Sports"),
        "categoryTechnology":
            MessageLookupByLibrary.simpleMessage("Technology"),
        "mail":
            MessageLookupByLibrary.simpleMessage("Mail: Vicboss2002@gmail.com"),
        "name": MessageLookupByLibrary.simpleMessage("Name: Víctor Narváez"),
        "news": MessageLookupByLibrary.simpleMessage("News"),
        "role": MessageLookupByLibrary.simpleMessage("Role: Flutter Developer"),
        "title": MessageLookupByLibrary.simpleMessage("News App")
      };
}
