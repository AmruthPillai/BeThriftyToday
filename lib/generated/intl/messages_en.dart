// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(symbol, spendAmount, budgetAmount, monthYear) => "You have spent ${symbol} ${spendAmount} of your total budget of ${symbol} ${budgetAmount} in the month of ${monthYear}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appName" : MessageLookupByLibrary.simpleMessage("Be Thrifty Today"),
    "currencySetupTextHeadline" : MessageLookupByLibrary.simpleMessage("What\'s your currency?"),
    "homeDailyNoTransactionsTextSubtitle" : MessageLookupByLibrary.simpleMessage("Tap on the + button below to add a new income/expense."),
    "homeDailyNoTransactionsTextTitle" : MessageLookupByLibrary.simpleMessage("This list is looking a little bit empty..."),
    "loginButtonTextGoogle" : MessageLookupByLibrary.simpleMessage("Login with Google"),
    "loginButtonTextGuest" : MessageLookupByLibrary.simpleMessage("Login as Guest"),
    "loginTextTagline" : MessageLookupByLibrary.simpleMessage("Be Thrifty Today is a simple and secure money management app that helps you track your incomes and expenses."),
    "profileSetupButtonTextNext" : MessageLookupByLibrary.simpleMessage("NEXT"),
    "profileSetupLabelTextEmailAddress" : MessageLookupByLibrary.simpleMessage("Email Address"),
    "profileSetupLabelTextFullName" : MessageLookupByLibrary.simpleMessage("Full Name"),
    "profileSetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Who are you?"),
    "thriftyDrawerMessageShare" : MessageLookupByLibrary.simpleMessage("Check out this app that helps you manage your income and expenses, safe and secure: https://pillai.xyz/thrifty"),
    "thriftyDrawerTextAbout" : MessageLookupByLibrary.simpleMessage("About the App"),
    "thriftyDrawerTextAboutAppLegalese" : MessageLookupByLibrary.simpleMessage("This application is open source and free-to-use, governed under the Apache License 2.0. If you are a developer, please feel free to contribute to the application on GitHub."),
    "thriftyDrawerTextAboutFooter" : MessageLookupByLibrary.simpleMessage("If you love the app and use it regularly, please donate as little as you can, enough to keep the app alive and running on it\'s own. Donation details can be found on the GitHub homepage or the website. Thank you so much!"),
    "thriftyDrawerTextCategories" : MessageLookupByLibrary.simpleMessage("Categories"),
    "thriftyDrawerTextCurrencies" : MessageLookupByLibrary.simpleMessage("Currencies"),
    "thriftyDrawerTextExport" : MessageLookupByLibrary.simpleMessage("Export to JSON/CSV"),
    "thriftyDrawerTextLogout" : MessageLookupByLibrary.simpleMessage("Logout"),
    "thriftyDrawerTextRate" : MessageLookupByLibrary.simpleMessage("Rate the App"),
    "thriftyDrawerTextSettings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "thriftyDrawerTextShare" : MessageLookupByLibrary.simpleMessage("Spread the Love"),
    "thriftyOverviewTextBalanceHeading" : MessageLookupByLibrary.simpleMessage("YOUR BALANCE"),
    "thriftyOverviewTextBudgetSet" : m0,
    "thriftyOverviewTextBudgetUnset" : MessageLookupByLibrary.simpleMessage("Tap here to set a monthly budget and manage your expenses efficiently."),
    "transactionBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("ADD"),
    "transactionBottomSheetButtonTextExpense" : MessageLookupByLibrary.simpleMessage("Expense"),
    "transactionBottomSheetButtonTextIncome" : MessageLookupByLibrary.simpleMessage("Income"),
    "transactionBottomSheetButtonTextUpdate" : MessageLookupByLibrary.simpleMessage("UPDATE"),
    "transactionBottomSheetLabelTextAmount" : MessageLookupByLibrary.simpleMessage("Amount"),
    "transactionBottomSheetLabelTextDate" : MessageLookupByLibrary.simpleMessage("Date"),
    "transactionBottomSheetLabelTextDescription" : MessageLookupByLibrary.simpleMessage("Description (optional)"),
    "transactionBottomSheetTextHeadingAdd" : MessageLookupByLibrary.simpleMessage("Add New Transaction"),
    "transactionBottomSheetTextHeadingUpdate" : MessageLookupByLibrary.simpleMessage("Update Transaction")
  };
}
