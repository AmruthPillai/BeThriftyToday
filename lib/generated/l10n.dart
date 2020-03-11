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

  String get addCategoryBottomSheetButtonTextAdd {
    return Intl.message(
      'ADD',
      name: 'addCategoryBottomSheetButtonTextAdd',
      desc: '',
      args: [],
    );
  }

  String get addCategoryBottomSheetButtonTextCancel {
    return Intl.message(
      'CANCEL',
      name: 'addCategoryBottomSheetButtonTextCancel',
      desc: '',
      args: [],
    );
  }

  String addCategoryBottomSheetHeadingText(dynamic type) {
    return Intl.message(
      'Add New $type Category',
      name: 'addCategoryBottomSheetHeadingText',
      desc: '',
      args: [type],
    );
  }

  String get addCategoryBottomSheetLabelTextCategoryName {
    return Intl.message(
      'Category Name',
      name: 'addCategoryBottomSheetLabelTextCategoryName',
      desc: '',
      args: [],
    );
  }

  String get appName {
    return Intl.message(
      'Be Thrifty Today',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  String get categoriesScreenAppBarTitle {
    return Intl.message(
      'Categories',
      name: 'categoriesScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  String get categoriesScreenButtonTextAddNew {
    return Intl.message(
      'Add New',
      name: 'categoriesScreenButtonTextAddNew',
      desc: '',
      args: [],
    );
  }

  String get categoriesScreenSnackbarTextDeleteMessage {
    return Intl.message(
      'The category has been successfully deleted',
      name: 'categoriesScreenSnackbarTextDeleteMessage',
      desc: '',
      args: [],
    );
  }

  String get categoriesScreenSnackbarTextResetCategoriesAction {
    return Intl.message(
      'Yes',
      name: 'categoriesScreenSnackbarTextResetCategoriesAction',
      desc: '',
      args: [],
    );
  }

  String get categoriesScreenSnackbarTextResetCategoriesConfirmation {
    return Intl.message(
      'Are you sure you want to reset all categories to the original?',
      name: 'categoriesScreenSnackbarTextResetCategoriesConfirmation',
      desc: '',
      args: [],
    );
  }

  String get categoriesScreenSnackbarTextResetCategoriesSuccess {
    return Intl.message(
      'All categories have been reset successfully',
      name: 'categoriesScreenSnackbarTextResetCategoriesSuccess',
      desc: '',
      args: [],
    );
  }

  String get categoriesScreenTabBarTextExpense {
    return Intl.message(
      'Expense',
      name: 'categoriesScreenTabBarTextExpense',
      desc: '',
      args: [],
    );
  }

  String get categoriesScreenTabBarTextIncome {
    return Intl.message(
      'Income',
      name: 'categoriesScreenTabBarTextIncome',
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

  String get currenciesScreenAppBarTitle {
    return Intl.message(
      'Currencies',
      name: 'currenciesScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  String get currenciesScreenSnackbarTextResetCurrenciesAction {
    return Intl.message(
      'Yes',
      name: 'currenciesScreenSnackbarTextResetCurrenciesAction',
      desc: '',
      args: [],
    );
  }

  String get currenciesScreenSnackbarTextResetCurrenciesConfirmation {
    return Intl.message(
      'Are you sure you want to reset all currencies to the original?',
      name: 'currenciesScreenSnackbarTextResetCurrenciesConfirmation',
      desc: '',
      args: [],
    );
  }

  String get currenciesScreenSnackbarTextResetCurrenciesSuccess {
    return Intl.message(
      'All currencies have been reset successfully',
      name: 'currenciesScreenSnackbarTextResetCurrenciesSuccess',
      desc: '',
      args: [],
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

  String get deleteAccountDialogButtonTextCancel {
    return Intl.message(
      'No, I don\'t want to leave!',
      name: 'deleteAccountDialogButtonTextCancel',
      desc: '',
      args: [],
    );
  }

  String get deleteAccountDialogButtonTextDelete {
    return Intl.message(
      'Yes, delete my data!',
      name: 'deleteAccountDialogButtonTextDelete',
      desc: '',
      args: [],
    );
  }

  String get deleteAccountDialogContent {
    return Intl.message(
      'You will lose all the data (including profile information and you transaction history) when you delete your account. This is an irreversible process, are you sure you want to go through with it?',
      name: 'deleteAccountDialogContent',
      desc: '',
      args: [],
    );
  }

  String get deleteAccountDialogTitle {
    return Intl.message(
      'Do you really want to delete your account?',
      name: 'deleteAccountDialogTitle',
      desc: '',
      args: [],
    );
  }

  String get exportBottomSheetButtonTextDownload {
    return Intl.message(
      'DOWNLOAD',
      name: 'exportBottomSheetButtonTextDownload',
      desc: '',
      args: [],
    );
  }

  String get exportBottomSheetButtonTextExport {
    return Intl.message(
      'EXPORT',
      name: 'exportBottomSheetButtonTextExport',
      desc: '',
      args: [],
    );
  }

  String get exportBottomSheetHeadingText {
    return Intl.message(
      'Export as CSV/JSON',
      name: 'exportBottomSheetHeadingText',
      desc: '',
      args: [],
    );
  }

  String get exportBottomSheetLabelTextEndDate {
    return Intl.message(
      'End Date',
      name: 'exportBottomSheetLabelTextEndDate',
      desc: '',
      args: [],
    );
  }

  String get exportBottomSheetLabelTextStartDate {
    return Intl.message(
      'Start Date',
      name: 'exportBottomSheetLabelTextStartDate',
      desc: '',
      args: [],
    );
  }

  String get exportBottomSheetTextDateValidationError {
    return Intl.message(
      'Start Date must be earlier than End Date',
      name: 'exportBottomSheetTextDateValidationError',
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

  String get settingsScreenHeaderTitleAccount {
    return Intl.message(
      'Account',
      name: 'settingsScreenHeaderTitleAccount',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenHeaderTitleDangerZone {
    return Intl.message(
      'Danger Zone',
      name: 'settingsScreenHeaderTitleDangerZone',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenHeaderTitlePreferences {
    return Intl.message(
      'Preferences',
      name: 'settingsScreenHeaderTitlePreferences',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleAccentColor {
    return Intl.message(
      'Accent Color',
      name: 'settingsScreenSettingTitleAccentColor',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleBiometric {
    return Intl.message(
      'Biometric Fortification',
      name: 'settingsScreenSettingTitleBiometric',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleBiometricDescription {
    return Intl.message(
      'Asks for your fingerprint everytime you open the app.',
      name: 'settingsScreenSettingTitleBiometricDescription',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleCurrency {
    return Intl.message(
      'Currency',
      name: 'settingsScreenSettingTitleCurrency',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleDeleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'settingsScreenSettingTitleDeleteAccount',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleEmailAddress {
    return Intl.message(
      'Email Address',
      name: 'settingsScreenSettingTitleEmailAddress',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleLanguage {
    return Intl.message(
      'Language',
      name: 'settingsScreenSettingTitleLanguage',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleName {
    return Intl.message(
      'Name',
      name: 'settingsScreenSettingTitleName',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleTheme {
    return Intl.message(
      'Theme',
      name: 'settingsScreenSettingTitleTheme',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleThemeAMOLED {
    return Intl.message(
      'AMOLED',
      name: 'settingsScreenSettingTitleThemeAMOLED',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleThemeDark {
    return Intl.message(
      'Dark',
      name: 'settingsScreenSettingTitleThemeDark',
      desc: '',
      args: [],
    );
  }

  String get settingsScreenSettingTitleThemeLight {
    return Intl.message(
      'Light',
      name: 'settingsScreenSettingTitleThemeLight',
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

  String transactionListHiddenTransactionText(dynamic howMany) {
    return Intl.plural(
      howMany,
      one: '1 transaction hidden',
      other: '$howMany transactions hidden',
      name: 'transactionListHiddenTransactionText',
      desc: '',
      args: [howMany],
    );
  }

  String get updateBudgetBottomSheetButtonTextClear {
    return Intl.message(
      'CLEAR',
      name: 'updateBudgetBottomSheetButtonTextClear',
      desc: '',
      args: [],
    );
  }

  String get updateBudgetBottomSheetButtonTextSetBudget {
    return Intl.message(
      'SET BUDGET',
      name: 'updateBudgetBottomSheetButtonTextSetBudget',
      desc: '',
      args: [],
    );
  }

  String get updateBudgetBottomSheetHeadingText {
    return Intl.message(
      'Please enter a monthly budget that you feel is conservative according to your spending habits.',
      name: 'updateBudgetBottomSheetHeadingText',
      desc: '',
      args: [],
    );
  }

  String get updateBudgetBottomSheetLabelTextBudget {
    return Intl.message(
      'Budget',
      name: 'updateBudgetBottomSheetLabelTextBudget',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('es', ''), Locale('en', ''), Locale('fr', ''),
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