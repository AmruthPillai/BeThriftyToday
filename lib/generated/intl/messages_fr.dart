// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static m0(type) => "Ajouter une nouvelle catégorie de ${type}";

  static m1(category) => "${Intl.select(category, {'Automobile': 'Automobile', 'Awards': 'Récompenses', 'BabyCare': 'Soins pour bébés', 'Bonus': 'Bonus', 'Books': 'Livres', 'Charity': 'Associations', 'Clothing': 'Habillement', 'Drinks': 'Boissons', 'Education': 'Education', 'Electronics': 'Electronique', 'Entertainment': 'Divertissement', 'Food': 'Nourriture', 'Freelance': 'Freelance', 'FriendsFamily': 'Amis & Famille', 'Gifts': 'Cadeaux', 'Grants': 'Subventions', 'Groceries': 'Courses', 'Health': 'Santé', 'Hobbies': 'Hobbies', 'Insurance': 'Assurance', 'Interest': 'Intérêts', 'Investments': 'Investissements', 'Laundry': 'Ménage', 'Lottery': 'Loterie', 'Mobile': 'Téléphone', 'Office': 'Papeterie', 'Others': 'Autres', 'Pets': 'Animaux', 'Refunds': 'Remboursements', 'Rent': 'Location', 'Salary': 'Salaire', 'Sale': 'Vente', 'SalonSpa': 'Salon & Spa', 'Shopping': 'Shopping', 'Tax': 'Taxe', 'Transportation': 'Transport', 'Travel': 'Voyage', 'Utilities': 'Services Publics', 'other': '${category}', })}";

  static m2(symbol, spendAmount, budgetAmount, monthYear) => "Vous avez dépensé ${symbol} ${spendAmount} de votre budget total de ${symbol} ${budgetAmount} en ${monthYear}.";

  static m3(howMany) => "${Intl.plural(howMany, one: '1 transaction cachée', other: '${howMany} transactions cachées')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addCategoryBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("AJOUTER"),
    "addCategoryBottomSheetButtonTextCancel" : MessageLookupByLibrary.simpleMessage("ANNULER"),
    "addCategoryBottomSheetHeadingText" : m0,
    "addCategoryBottomSheetLabelTextCategoryName" : MessageLookupByLibrary.simpleMessage("Nom de la catégorie"),
    "appName" : MessageLookupByLibrary.simpleMessage("Be Thrifty Today"),
    "categoriesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Catégories"),
    "categoriesScreenButtonTextAddNew" : MessageLookupByLibrary.simpleMessage("Ajouter"),
    "categoriesScreenSnackbarTextDeleteMessage" : MessageLookupByLibrary.simpleMessage("La catégorie a bien été supprimée"),
    "categoriesScreenSnackbarTextResetCategoriesConfirmation" : MessageLookupByLibrary.simpleMessage("Êtes-vous sûr de vouloir réinitialiser toutes les catégories ?"),
    "categoriesScreenSnackbarTextResetCategoriesSuccess" : MessageLookupByLibrary.simpleMessage("Toutes les catégories ont bien été réinitialisées"),
    "categoriesScreenTabBarTextExpense" : MessageLookupByLibrary.simpleMessage("Dépenses"),
    "categoriesScreenTabBarTextIncome" : MessageLookupByLibrary.simpleMessage("Revenus"),
    "categoryName" : m1,
    "currenciesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Devises"),
    "currencySetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Quelle est votre devise ?"),
    "deleteAccountDialogButtonTextCancel" : MessageLookupByLibrary.simpleMessage("Non, je ne veux pas quitter !"),
    "deleteAccountDialogButtonTextDelete" : MessageLookupByLibrary.simpleMessage("Oui, supprimez mes données !"),
    "deleteAccountDialogContent" : MessageLookupByLibrary.simpleMessage("Vous allez perdre toutes vos données (dont vos informations publiques and votre historique de transactions) si vous supprimez votre compte. C\'est un processus irréversible, êtes-vous sûr de le vouloir ?"),
    "deleteAccountDialogTitle" : MessageLookupByLibrary.simpleMessage("Voulez-vous vraiment supprimer votre compte ?"),
    "exportBottomSheetButtonTextDownload" : MessageLookupByLibrary.simpleMessage("TÉLÉCHARGER"),
    "exportBottomSheetButtonTextExport" : MessageLookupByLibrary.simpleMessage("EXPORTER"),
    "exportBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Exporter en tant que CSV/JSON"),
    "exportBottomSheetLabelTextEndDate" : MessageLookupByLibrary.simpleMessage("Date de fin"),
    "exportBottomSheetLabelTextStartDate" : MessageLookupByLibrary.simpleMessage("Date de début"),
    "exportBottomSheetTextDateValidationError" : MessageLookupByLibrary.simpleMessage("La date de début doit se trouver avant la date de fin"),
    "homeDailyNoTransactionsTextSubtitle" : MessageLookupByLibrary.simpleMessage("Cliquez sur le bouton + ci-dessous pour ajouter une nouvelle entrée."),
    "homeDailyNoTransactionsTextTitle" : MessageLookupByLibrary.simpleMessage("Cette liste à l\'air un peu vide..."),
    "loginButtonTextGoogle" : MessageLookupByLibrary.simpleMessage("Se connecter avec Google"),
    "loginButtonTextGuest" : MessageLookupByLibrary.simpleMessage("Se connecter en tant qu\'invité(e)"),
    "loginTextTagline" : MessageLookupByLibrary.simpleMessage("Be Thrifty Today est une application simple et sécurisée pour gérer votre budget. Elle vous aide à suivre vos dépenses et vos revenus."),
    "profileSetupButtonTextNext" : MessageLookupByLibrary.simpleMessage("SUIVANT"),
    "profileSetupLabelTextEmailAddress" : MessageLookupByLibrary.simpleMessage("Adresse E-mail"),
    "profileSetupLabelTextFullName" : MessageLookupByLibrary.simpleMessage("Nom"),
    "profileSetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Qui êtes-vous ?"),
    "settingsScreenHeaderTitleAccount" : MessageLookupByLibrary.simpleMessage("Compte"),
    "settingsScreenHeaderTitleDangerZone" : MessageLookupByLibrary.simpleMessage("Zone rouge"),
    "settingsScreenHeaderTitlePreferences" : MessageLookupByLibrary.simpleMessage("Préférences"),
    "settingsScreenSettingTitleAccentColor" : MessageLookupByLibrary.simpleMessage("Couleur d\'accentuation"),
    "settingsScreenSettingTitleBiometric" : MessageLookupByLibrary.simpleMessage("Sécurisation biométrique"),
    "settingsScreenSettingTitleBiometricDescription" : MessageLookupByLibrary.simpleMessage("Demande votre empreinte digitale à chaque ouverture de l\'application."),
    "settingsScreenSettingTitleCurrency" : MessageLookupByLibrary.simpleMessage("Devise"),
    "settingsScreenSettingTitleDeleteAccount" : MessageLookupByLibrary.simpleMessage("Supprimer mon compte"),
    "settingsScreenSettingTitleEmailAddress" : MessageLookupByLibrary.simpleMessage("Adresse E-mail"),
    "settingsScreenSettingTitleLanguage" : MessageLookupByLibrary.simpleMessage("Langue"),
    "settingsScreenSettingTitleName" : MessageLookupByLibrary.simpleMessage("Nom"),
    "settingsScreenSettingTitleTheme" : MessageLookupByLibrary.simpleMessage("Thème"),
    "settingsScreenSettingTitleThemeAMOLED" : MessageLookupByLibrary.simpleMessage("AMOLED"),
    "settingsScreenSettingTitleThemeDark" : MessageLookupByLibrary.simpleMessage("Sombre"),
    "settingsScreenSettingTitleThemeLight" : MessageLookupByLibrary.simpleMessage("Clair"),
    "thriftyDrawerMessageShare" : MessageLookupByLibrary.simpleMessage("Découvrez cette application qui vous aide à gérer vos revenus et vos dépenses en toute sécurité: https://pillai.xyz/thrifty"),
    "thriftyDrawerTextAbout" : MessageLookupByLibrary.simpleMessage("À propos"),
    "thriftyDrawerTextAboutAppLegalese" : MessageLookupByLibrary.simpleMessage("Cette application, gratuite et open-source, est régie par la licence Apache 2.0. Si vous êtes développeur, n\'hésitez pas à contribuer à l\'application sur GitHub."),
    "thriftyDrawerTextAboutFooter" : MessageLookupByLibrary.simpleMessage("Si vous aimez l\'application et l\'utilisez régulièrement, vous pouvez faire une donation du montant que vous voulez, juste assez pour que l\'application vive et fonctionne de manière autonome. Vous pouvez trouvez les détails sur la page Github ou sur le site. Merci beaucoup !"),
    "thriftyDrawerTextCategories" : MessageLookupByLibrary.simpleMessage("Catégories"),
    "thriftyDrawerTextCurrencies" : MessageLookupByLibrary.simpleMessage("Devises"),
    "thriftyDrawerTextExport" : MessageLookupByLibrary.simpleMessage("Exporter en tant que JSON/CSV"),
    "thriftyDrawerTextLogout" : MessageLookupByLibrary.simpleMessage("Se déconnecter"),
    "thriftyDrawerTextRate" : MessageLookupByLibrary.simpleMessage("Évaluer l\'application"),
    "thriftyDrawerTextSettings" : MessageLookupByLibrary.simpleMessage("Règlages"),
    "thriftyDrawerTextShare" : MessageLookupByLibrary.simpleMessage("Partager avec amour"),
    "thriftyOverviewTextBalanceHeading" : MessageLookupByLibrary.simpleMessage("VOTRE SOLDE"),
    "thriftyOverviewTextBudgetSet" : m2,
    "thriftyOverviewTextBudgetUnset" : MessageLookupByLibrary.simpleMessage("Cliquez ici pour définir un budget mensuel, afin de gérer efficacement vos dépenses."),
    "transactionBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("AJOUTER"),
    "transactionBottomSheetButtonTextExpense" : MessageLookupByLibrary.simpleMessage("Dépense"),
    "transactionBottomSheetButtonTextIncome" : MessageLookupByLibrary.simpleMessage("Revenu"),
    "transactionBottomSheetButtonTextUpdate" : MessageLookupByLibrary.simpleMessage("METTRE À JOUR"),
    "transactionBottomSheetLabelTextAmount" : MessageLookupByLibrary.simpleMessage("Montant"),
    "transactionBottomSheetLabelTextDate" : MessageLookupByLibrary.simpleMessage("Date"),
    "transactionBottomSheetLabelTextDescription" : MessageLookupByLibrary.simpleMessage("Description (facultative)"),
    "transactionBottomSheetTextHeadingAdd" : MessageLookupByLibrary.simpleMessage("Ajouter une nouvelle transaction"),
    "transactionBottomSheetTextHeadingUpdate" : MessageLookupByLibrary.simpleMessage("Mettre à jour la transaction"),
    "transactionListHiddenTransactionText" : m3,
    "updateBudgetBottomSheetButtonTextClear" : MessageLookupByLibrary.simpleMessage("EFFACER"),
    "updateBudgetBottomSheetButtonTextSetBudget" : MessageLookupByLibrary.simpleMessage("DÉFINIR UN BUDGET"),
    "updateBudgetBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Veuillez indiquer un budget mensuel proportionnel à vos habitudes de dépenses."),
    "updateBudgetBottomSheetLabelTextBudget" : MessageLookupByLibrary.simpleMessage("Budget")
  };
}
