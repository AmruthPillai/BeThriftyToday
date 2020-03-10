// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get appName {
    return Intl.message(
      'Be Thrifty Today',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  String categoryName(dynamic category) {
    return Intl.message(
      '{category, select, Automobile {Automobile} Awards {Awards} BabyCare {Baby Care} Bonus {Bonus} Books {Books} Charity {Charity} Clothing {Clothing} Drinks {Drinks} Education {Education} Electronics {Electronics} Entertainment {Entertainment} Food {Food} Freelance {Freelance} FriendsFamily {Friends & Family} Gifts {Gifts} Grants {Grants} Groceries {Groceries} Health {Health} Hobbies {Hobbies} Insurance {Insurance} Interest {Interest} Investments {Investments} Laundry {Laundry} Lottery {Lottery} Mobile {Mobile} Office {Office} Others {Others} Pets {Pets} Refunds {Refunds} Rent {Rent} Salary {Salary} Sale {Sale} SalonSpa {Salon & Spa} Shopping {Shopping} Tax {Tax} Transportation {Transportation} Travel {Travel} Utilities {Utilities} other {{category}}}',
      name: 'categoryName',
      desc: '',
      args: [category],
    );
  }

  String get currencySetupTextHeadline {
    return Intl.message(
      'What\'s your currency?',
      name: 'currencySetupTextHeadline',
      desc: '',
      args: [],
    );
  }

  String get homeDailyNoTransactionsTextSubtitle {
    return Intl.message(
      'Tap on the + button below to add a new income/expense.',
      name: 'homeDailyNoTransactionsTextSubtitle',
      desc: '',
      args: [],
    );
  }

  String get homeDailyNoTransactionsTextTitle {
    return Intl.message(
      'This list is looking a little bit empty...',
      name: 'homeDailyNoTransactionsTextTitle',
      desc: '',
      args: [],
    );
  }

  String get loginButtonTextGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginButtonTextGoogle',
      desc: '',
      args: [],
    );
  }

  String get loginButtonTextGuest {
    return Intl.message(
      'Login as Guest',
      name: 'loginButtonTextGuest',
      desc: '',
      args: [],
    );
  }

  String get loginTextTagline {
    return Intl.message(
      'Be Thrifty Today is a simple and secure money management app that helps you track your incomes and expenses.',
      name: 'loginTextTagline',
      desc: '',
      args: [],
    );
  }

  String get profileSetupButtonTextNext {
    return Intl.message(
      'NEXT',
      name: 'profileSetupButtonTextNext',
      desc: '',
      args: [],
    );
  }

  String get profileSetupLabelTextEmailAddress {
    return Intl.message(
      'Email Address',
      name: 'profileSetupLabelTextEmailAddress',
      desc: '',
      args: [],
    );
  }

  String get profileSetupLabelTextFullName {
    return Intl.message(
      'Full Name',
      name: 'profileSetupLabelTextFullName',
      desc: '',
      args: [],
    );
  }

  String get profileSetupTextHeadline {
    return Intl.message(
      'Who are you?',
      name: 'profileSetupTextHeadline',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerMessageShare {
    return Intl.message(
      'Check out this app that helps you manage your income and expenses, safe and secure: https://pillai.xyz/thrifty',
      name: 'thriftyDrawerMessageShare',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextAbout {
    return Intl.message(
      'About the App',
      name: 'thriftyDrawerTextAbout',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextAboutAppLegalese {
    return Intl.message(
      'This application is open source and free-to-use, governed under the Apache License 2.0. If you are a developer, please feel free to contribute to the application on GitHub.',
      name: 'thriftyDrawerTextAboutAppLegalese',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextAboutFooter {
    return Intl.message(
      'If you love the app and use it regularly, please donate as little as you can, enough to keep the app alive and running on it\'s own. Donation details can be found on the GitHub homepage or the website. Thank you so much!',
      name: 'thriftyDrawerTextAboutFooter',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextCategories {
    return Intl.message(
      'Categories',
      name: 'thriftyDrawerTextCategories',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextCurrencies {
    return Intl.message(
      'Currencies',
      name: 'thriftyDrawerTextCurrencies',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextExport {
    return Intl.message(
      'Export to JSON/CSV',
      name: 'thriftyDrawerTextExport',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextLogout {
    return Intl.message(
      'Logout',
      name: 'thriftyDrawerTextLogout',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextRate {
    return Intl.message(
      'Rate the App',
      name: 'thriftyDrawerTextRate',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextSettings {
    return Intl.message(
      'Settings',
      name: 'thriftyDrawerTextSettings',
      desc: '',
      args: [],
    );
  }

  String get thriftyDrawerTextShare {
    return Intl.message(
      'Spread the Love',
      name: 'thriftyDrawerTextShare',
      desc: '',
      args: [],
    );
  }

  String get thriftyOverviewTextBalanceHeading {
    return Intl.message(
      'YOUR BALANCE',
      name: 'thriftyOverviewTextBalanceHeading',
      desc: '',
      args: [],
    );
  }

  String thriftyOverviewTextBudgetSet(dynamic symbol, dynamic spendAmount, dynamic budgetAmount, dynamic monthYear) {
    return Intl.message(
      'You have spent $symbol $spendAmount of your total budget of $symbol $budgetAmount in the month of $monthYear.',
      name: 'thriftyOverviewTextBudgetSet',
      desc: '',
      args: [symbol, spendAmount, budgetAmount, monthYear],
    );
  }

  String get thriftyOverviewTextBudgetUnset {
    return Intl.message(
      'Tap here to set a monthly budget and manage your expenses efficiently.',
      name: 'thriftyOverviewTextBudgetUnset',
      desc: '',
      args: [],
    );
  }

  String get transactionBottomSheetButtonTextAdd {
    return Intl.message(
      'ADD',
      name: 'transactionBottomSheetButtonTextAdd',
      desc: '',
      args: [],
    );
  }

  String get transactionBottomSheetButtonTextExpense {
    return Intl.message(
      'Expense',
      name: 'transactionBottomSheetButtonTextExpense',
      desc: '',
      args: [],
    );
  }

  String get transactionBottomSheetButtonTextIncome {
    return Intl.message(
      'Income',
      name: 'transactionBottomSheetButtonTextIncome',
      desc: '',
      args: [],
    );
  }

  String get transactionBottomSheetButtonTextUpdate {
    return Intl.message(
      'UPDATE',
      name: 'transactionBottomSheetButtonTextUpdate',
      desc: '',
      args: [],
    );
  }

  String get transactionBottomSheetLabelTextAmount {
    return Intl.message(
      'Amount',
      name: 'transactionBottomSheetLabelTextAmount',
      desc: '',
      args: [],
    );
  }

  String get transactionBottomSheetLabelTextDate {
    return Intl.message(
      'Date',
      name: 'transactionBottomSheetLabelTextDate',
      desc: '',
      args: [],
    );
  }

  String get transactionBottomSheetLabelTextDescription {
    return Intl.message(
      'Description (optional)',
      name: 'transactionBottomSheetLabelTextDescription',
      desc: '',
      args: [],
    );
  }

  String get transactionBottomSheetTextHeadingAdd {
    return Intl.message(
      'Add New Transaction',
      name: 'transactionBottomSheetTextHeadingAdd',
      desc: '',
      args: [],
    );
  }

  String get transactionBottomSheetTextHeadingUpdate {
    return Intl.message(
      'Update Transaction',
      name: 'transactionBottomSheetTextHeadingUpdate',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('kn', ''), Locale('en', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}