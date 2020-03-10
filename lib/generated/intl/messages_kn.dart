// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a kn locale. All the
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
  String get localeName => 'kn';

  static m0(category) => "${Intl.select(category, {'Automobile': 'Automobile', 'Awards': 'Awards', 'BabyCare': 'Baby Care', 'Bonus': 'Bonus', 'Books': 'Books', 'Charity': 'Charity', 'Clothing': 'Clothing', 'Drinks': 'Drinks', 'Education': 'Education', 'Electronics': 'Electronics', 'Entertainment': 'Entertainment', 'Food': 'Food', 'Freelance': 'Freelance', 'FriendsFamily': 'Friends & Family', 'Gifts': 'Gifts', 'Grants': 'Grants', 'Groceries': 'Groceries', 'Health': 'Health', 'Hobbies': 'Hobbies', 'Insurance': 'Insurance', 'Interest': 'Interest', 'Investments': 'Investments', 'Laundry': 'Laundry', 'Lottery': 'Lottery', 'Mobile': 'Mobile', 'Office': 'Office', 'Others': 'Others', 'Pets': 'Pets', 'Refunds': 'Refunds', 'Rent': 'Rent', 'Salary': 'Salary', 'Sale': 'Sale', 'SalonSpa': 'Salon & Spa', 'Shopping': 'Shopping', 'Tax': 'Tax', 'Transportation': 'Transportation', 'Travel': 'Travel', 'Utilities': 'Utilities', 'other': '${category}', })}";

  static m1(symbol, spendAmount, budgetAmount, monthYear) => "You have spent ${symbol} ${spendAmount} of your total budget of ${symbol} ${budgetAmount} in the month of ${monthYear}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appName" : MessageLookupByLibrary.simpleMessage("Be Thrifty Today"),
    "categoryName" : m0,
    "currencySetupTextHeadline" : MessageLookupByLibrary.simpleMessage("ನಿಮ್ಮ ಕರೆನ್ಸಿ ಏನು?"),
    "homeDailyNoTransactionsTextSubtitle" : MessageLookupByLibrary.simpleMessage("Tap on the + button below to add a new income/expense."),
    "homeDailyNoTransactionsTextTitle" : MessageLookupByLibrary.simpleMessage("This list is looking a little bit empty..."),
    "loginButtonTextGoogle" : MessageLookupByLibrary.simpleMessage("ಗೂಗಲ್ ನೊಂದಿಗೆ ಲಾಗಿನ್ ಮಾಡಿ"),
    "loginButtonTextGuest" : MessageLookupByLibrary.simpleMessage("ಅತಿಥಿಯಾಗಿ ಲಾಗಿನ್ ಮಾಡಿ"),
    "loginTextTagline" : MessageLookupByLibrary.simpleMessage("ಬಿ ತ್ರಿಫ್ತಿ ಟುಡೇ ಇದು ಸರಳ ಮತ್ತು ನಿಮ್ಮ ಆದಾಯ ಮತ್ತು ವೆಚ್ಚಗಳು ಟ್ರ್ಯಾಕ್ ಸಹಾಯ ಮಾಡುತ್ತದೆ ಸುರಕ್ಷಿತ ಹಣ ನಿರ್ವಹಣೆ ಅಪ್ಲಿಕೇಶನ್."),
    "profileSetupButtonTextNext" : MessageLookupByLibrary.simpleMessage("ಮುಂದುವರಿಸಿ"),
    "profileSetupLabelTextEmailAddress" : MessageLookupByLibrary.simpleMessage("ಇಮೇಲ್ ವಿಳಾಸ"),
    "profileSetupLabelTextFullName" : MessageLookupByLibrary.simpleMessage("ಪೂರ್ಣ ಹೆಸರು"),
    "profileSetupTextHeadline" : MessageLookupByLibrary.simpleMessage("ನೀವು ಯಾರು?"),
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
    "thriftyOverviewTextBudgetSet" : m1,
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
