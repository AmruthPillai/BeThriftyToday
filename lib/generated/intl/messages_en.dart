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

  static m0(type) => "Add New ${type} Category";

  static m1(category) => "${Intl.select(category, {'Automobile': 'Automobile', 'Awards': 'Awards', 'BabyCare': 'Baby Care', 'Bonus': 'Bonus', 'Books': 'Books', 'Charity': 'Charity', 'Clothing': 'Clothing', 'Drinks': 'Drinks', 'Education': 'Education', 'Electronics': 'Electronics', 'Entertainment': 'Entertainment', 'Food': 'Food', 'Freelance': 'Freelance', 'FriendsFamily': 'Friends & Family', 'Gifts': 'Gifts', 'Grants': 'Grants', 'Groceries': 'Groceries', 'Health': 'Health', 'Hobbies': 'Hobbies', 'Insurance': 'Insurance', 'Interest': 'Interest', 'Investments': 'Investments', 'Laundry': 'Laundry', 'Lottery': 'Lottery', 'Mobile': 'Mobile', 'Office': 'Office', 'Others': 'Others', 'Pets': 'Pets', 'Refunds': 'Refunds', 'Rent': 'Rent', 'Salary': 'Salary', 'Sale': 'Sale', 'SalonSpa': 'Salon & Spa', 'Shopping': 'Shopping', 'Tax': 'Tax', 'Transportation': 'Transportation', 'Travel': 'Travel', 'Utilities': 'Utilities', 'other': '${category}', })}";

  static m2(symbol, spendAmount, budgetAmount, monthYear) => "You have spent ${symbol} ${spendAmount} of your total budget of ${symbol} ${budgetAmount} in the month of ${monthYear}.";

  static m3(howMany) => "${Intl.plural(howMany, one: '1 transaction hidden', other: '${howMany} transactions hidden')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addCategoryBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("ADD"),
    "addCategoryBottomSheetButtonTextCancel" : MessageLookupByLibrary.simpleMessage("CANCEL"),
    "addCategoryBottomSheetHeadingText" : m0,
    "addCategoryBottomSheetLabelTextCategoryName" : MessageLookupByLibrary.simpleMessage("Category Name"),
    "appName" : MessageLookupByLibrary.simpleMessage("Be Thrifty Today"),
    "categoriesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Categories"),
    "categoriesScreenButtonTextAddNew" : MessageLookupByLibrary.simpleMessage("Add New"),
    "categoriesScreenSnackbarTextDeleteMessage" : MessageLookupByLibrary.simpleMessage("The category has been successfully deleted"),
    "categoriesScreenSnackbarTextResetCategoriesConfirmation" : MessageLookupByLibrary.simpleMessage("Are you sure you want to reset all categories to the original?"),
    "categoriesScreenSnackbarTextResetCategoriesSuccess" : MessageLookupByLibrary.simpleMessage("All categories have been reset successfully"),
    "categoriesScreenTabBarTextExpense" : MessageLookupByLibrary.simpleMessage("Expense"),
    "categoriesScreenTabBarTextIncome" : MessageLookupByLibrary.simpleMessage("Income"),
    "categoryName" : m1,
    "currenciesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Currencies"),
    "currencySetupTextHeadline" : MessageLookupByLibrary.simpleMessage("What\'s your currency?"),
    "deleteAccountDialogButtonTextCancel" : MessageLookupByLibrary.simpleMessage("No, I don\'t want to leave!"),
    "deleteAccountDialogButtonTextDelete" : MessageLookupByLibrary.simpleMessage("Yes, delete my data!"),
    "deleteAccountDialogContent" : MessageLookupByLibrary.simpleMessage("You will lose all the data (including profile information and you transaction history) when you delete your account. This is an irreversible process, are you sure you want to go through with it?"),
    "deleteAccountDialogTitle" : MessageLookupByLibrary.simpleMessage("Do you really want to delete your account?"),
    "exportBottomSheetButtonTextDownload" : MessageLookupByLibrary.simpleMessage("DOWNLOAD"),
    "exportBottomSheetButtonTextExport" : MessageLookupByLibrary.simpleMessage("EXPORT"),
    "exportBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Export as CSV/JSON"),
    "exportBottomSheetLabelTextEndDate" : MessageLookupByLibrary.simpleMessage("End Date"),
    "exportBottomSheetLabelTextStartDate" : MessageLookupByLibrary.simpleMessage("Start Date"),
    "exportBottomSheetTextDateValidationError" : MessageLookupByLibrary.simpleMessage("Start Date must be earlier than End Date"),
    "homeDailyNoTransactionsTextSubtitle" : MessageLookupByLibrary.simpleMessage("Tap on the + button below to add a new income/expense."),
    "homeDailyNoTransactionsTextTitle" : MessageLookupByLibrary.simpleMessage("This list is looking a little bit empty..."),
    "loginButtonTextGoogle" : MessageLookupByLibrary.simpleMessage("Login with Google"),
    "loginButtonTextGuest" : MessageLookupByLibrary.simpleMessage("Login as Guest"),
    "loginTextTagline" : MessageLookupByLibrary.simpleMessage("Be Thrifty Today is a simple and secure money management app that helps you track your incomes and expenses."),
    "profileSetupButtonTextNext" : MessageLookupByLibrary.simpleMessage("NEXT"),
    "profileSetupLabelTextEmailAddress" : MessageLookupByLibrary.simpleMessage("Email Address"),
    "profileSetupLabelTextFullName" : MessageLookupByLibrary.simpleMessage("Full Name"),
    "profileSetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Who are you?"),
    "settingsScreenHeaderTitleAccount" : MessageLookupByLibrary.simpleMessage("Account"),
    "settingsScreenHeaderTitleDangerZone" : MessageLookupByLibrary.simpleMessage("Danger Zone"),
    "settingsScreenHeaderTitlePreferences" : MessageLookupByLibrary.simpleMessage("Preferences"),
    "settingsScreenSettingTitleAccentColor" : MessageLookupByLibrary.simpleMessage("Accent Color"),
    "settingsScreenSettingTitleBiometric" : MessageLookupByLibrary.simpleMessage("Biometric Fortification"),
    "settingsScreenSettingTitleBiometricDescription" : MessageLookupByLibrary.simpleMessage("Asks for your fingerprint everytime you open the app."),
    "settingsScreenSettingTitleCurrency" : MessageLookupByLibrary.simpleMessage("Currency"),
    "settingsScreenSettingTitleDeleteAccount" : MessageLookupByLibrary.simpleMessage("Delete Account"),
    "settingsScreenSettingTitleEmailAddress" : MessageLookupByLibrary.simpleMessage("Email Address"),
    "settingsScreenSettingTitleLanguage" : MessageLookupByLibrary.simpleMessage("Language"),
    "settingsScreenSettingTitleName" : MessageLookupByLibrary.simpleMessage("Name"),
    "settingsScreenSettingTitleTheme" : MessageLookupByLibrary.simpleMessage("Theme"),
    "settingsScreenSettingTitleThemeAMOLED" : MessageLookupByLibrary.simpleMessage("AMOLED"),
    "settingsScreenSettingTitleThemeDark" : MessageLookupByLibrary.simpleMessage("Dark"),
    "settingsScreenSettingTitleThemeLight" : MessageLookupByLibrary.simpleMessage("Light"),
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
    "thriftyOverviewTextBudgetSet" : m2,
    "thriftyOverviewTextBudgetUnset" : MessageLookupByLibrary.simpleMessage("Tap here to set a monthly budget and manage your expenses efficiently."),
    "transactionBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("ADD"),
    "transactionBottomSheetButtonTextExpense" : MessageLookupByLibrary.simpleMessage("Expense"),
    "transactionBottomSheetButtonTextIncome" : MessageLookupByLibrary.simpleMessage("Income"),
    "transactionBottomSheetButtonTextUpdate" : MessageLookupByLibrary.simpleMessage("UPDATE"),
    "transactionBottomSheetLabelTextAmount" : MessageLookupByLibrary.simpleMessage("Amount"),
    "transactionBottomSheetLabelTextDate" : MessageLookupByLibrary.simpleMessage("Date"),
    "transactionBottomSheetLabelTextDescription" : MessageLookupByLibrary.simpleMessage("Description (optional)"),
    "transactionBottomSheetTextHeadingAdd" : MessageLookupByLibrary.simpleMessage("Add New Transaction"),
    "transactionBottomSheetTextHeadingUpdate" : MessageLookupByLibrary.simpleMessage("Update Transaction"),
    "transactionListHiddenTransactionText" : m3,
    "updateBudgetBottomSheetButtonTextClear" : MessageLookupByLibrary.simpleMessage("CLEAR"),
    "updateBudgetBottomSheetButtonTextSetBudget" : MessageLookupByLibrary.simpleMessage("SET BUDGET"),
    "updateBudgetBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Please enter a monthly budget that you feel is conservative according to your spending habits."),
    "updateBudgetBottomSheetLabelTextBudget" : MessageLookupByLibrary.simpleMessage("Budget")
  };
}
