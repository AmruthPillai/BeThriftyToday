// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static m0(type) => "Agregar nueva Categoría ${type}";

  static m1(category) => "${Intl.select(category, {'Automobile': 'Automovil', 'Awards': 'Premios', 'BabyCare': 'Cuidado del bebé', 'Bonus': 'Bonos', 'Books': 'Libros', 'Charity': 'Caridad', 'Clothing': 'Ropa', 'Drinks': 'Bebidas', 'Education': 'Educación', 'Electronics': 'Electronica', 'Entertainment': 'Entretenimiento', 'Food': 'Comida', 'Freelance': 'Freelance', 'FriendsFamily': 'Amigos y Familia', 'Gifts': 'Regalos', 'Grants': 'Apoyos', 'Groceries': 'Despensa', 'Health': 'Salud', 'Hobbies': 'Pasatiempos', 'Insurance': 'Seguros', 'Interest': 'Intereses', 'Investments': 'Inversiones', 'Laundry': 'Lavandería', 'Lottery': 'Lotería', 'Mobile': 'Teléfono', 'Office': 'Oficina', 'Others': 'Otros', 'Pets': 'Mascotas', 'Refunds': 'Reembolsos', 'Rent': 'Renta', 'Salary': 'Salario', 'Sale': 'Ventas', 'SalonSpa': 'Salon y Spa', 'Shopping': 'Compras', 'Tax': 'Impuestos', 'Transportation': 'Transporte', 'Travel': 'Viajes', 'Utilities': 'Utilidades', 'other': '${category}', })}";

  static m2(symbol, spendAmount, budgetAmount, monthYear) => "Has gastado ${symbol} ${spendAmount} de tu presupuesto total de ${symbol} ${budgetAmount} en el mes de ${monthYear}.";

  static m3(howMany) => "${Intl.plural(howMany, one: '1 transacción oculta', other: '${howMany} transacciones ocultas')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addCategoryBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("AÑADIR"),
    "addCategoryBottomSheetButtonTextCancel" : MessageLookupByLibrary.simpleMessage("CANCELAR"),
    "addCategoryBottomSheetHeadingText" : m0,
    "addCategoryBottomSheetLabelTextCategoryName" : MessageLookupByLibrary.simpleMessage("Nombre de Categoría"),
    "appName" : MessageLookupByLibrary.simpleMessage("Be Thrifty Today"),
    "categoriesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Categorías"),
    "categoriesScreenButtonTextAddNew" : MessageLookupByLibrary.simpleMessage("Agregar nueva"),
    "categoriesScreenSnackbarTextDeleteMessage" : MessageLookupByLibrary.simpleMessage("La categoría fue eliminada satisfactoriamente"),
    "categoriesScreenSnackbarTextResetCategoriesConfirmation" : MessageLookupByLibrary.simpleMessage("Seguro que quieres restaurar todas las categorías a los valores por defecto?"),
    "categoriesScreenSnackbarTextResetCategoriesSuccess" : MessageLookupByLibrary.simpleMessage("Todas las categorías fueron restauradas satisfactoriamente"),
    "categoriesScreenTabBarTextExpense" : MessageLookupByLibrary.simpleMessage("Gasto"),
    "categoriesScreenTabBarTextIncome" : MessageLookupByLibrary.simpleMessage("Ingreso"),
    "categoryName" : m1,
    "currenciesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Monedas"),
    "currencySetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Cual es tu moneda?"),
    "deleteAccountDialogButtonTextCancel" : MessageLookupByLibrary.simpleMessage("No, no quiero salir!"),
    "deleteAccountDialogButtonTextDelete" : MessageLookupByLibrary.simpleMessage("Si, borrar mis datos!"),
    "deleteAccountDialogContent" : MessageLookupByLibrary.simpleMessage("Perderás todos los datos (incluyendo información del perfil y tu historial de transacciones) cuando borres tu cuenta. Este es un proceso irreversible, estas seguro que deseas llevarlo a cabo?"),
    "deleteAccountDialogTitle" : MessageLookupByLibrary.simpleMessage("De verdad quieres borrar tu cuenta?"),
    "exportBottomSheetButtonTextDownload" : MessageLookupByLibrary.simpleMessage("DESCARGAR"),
    "exportBottomSheetButtonTextExport" : MessageLookupByLibrary.simpleMessage("EXPORTAR"),
    "exportBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Exportar como CSV/JSON"),
    "exportBottomSheetLabelTextEndDate" : MessageLookupByLibrary.simpleMessage("Fecha de fin"),
    "exportBottomSheetLabelTextStartDate" : MessageLookupByLibrary.simpleMessage("Fecha de inicio"),
    "exportBottomSheetTextDateValidationError" : MessageLookupByLibrary.simpleMessage("La fecha de inicio debe ser anterior a la fecha de fin"),
    "homeDailyNoTransactionsTextSubtitle" : MessageLookupByLibrary.simpleMessage("Toca el botón + de abajo para añadir un nuevo ingreso/gasto."),
    "homeDailyNoTransactionsTextTitle" : MessageLookupByLibrary.simpleMessage("Esta lista se ve un poco vacía..."),
    "loginButtonTextGoogle" : MessageLookupByLibrary.simpleMessage("Acceder con Google"),
    "loginButtonTextGuest" : MessageLookupByLibrary.simpleMessage("Acceder como Invitado"),
    "loginTextTagline" : MessageLookupByLibrary.simpleMessage("Be Thrifty Today es una aplicación de administración de dinero simple y segura que te ayuda a rastrear tus ingresos y gastos."),
    "profileSetupButtonTextNext" : MessageLookupByLibrary.simpleMessage("SIGUIENTE"),
    "profileSetupLabelTextEmailAddress" : MessageLookupByLibrary.simpleMessage("Dirección de correo"),
    "profileSetupLabelTextFullName" : MessageLookupByLibrary.simpleMessage("Nombre completo"),
    "profileSetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Quién eres?"),
    "settingsScreenHeaderTitleAccount" : MessageLookupByLibrary.simpleMessage("Cuenta"),
    "settingsScreenHeaderTitleDangerZone" : MessageLookupByLibrary.simpleMessage("Zona de peligro"),
    "settingsScreenHeaderTitlePreferences" : MessageLookupByLibrary.simpleMessage("Preferencias"),
    "settingsScreenSettingTitleAccentColor" : MessageLookupByLibrary.simpleMessage("Color de acento"),
    "settingsScreenSettingTitleBiometric" : MessageLookupByLibrary.simpleMessage("Fortificación Biometrica"),
    "settingsScreenSettingTitleBiometricDescription" : MessageLookupByLibrary.simpleMessage("Solicita tu huella digital cada vez que abres la app."),
    "settingsScreenSettingTitleCurrency" : MessageLookupByLibrary.simpleMessage("Moneda"),
    "settingsScreenSettingTitleDeleteAccount" : MessageLookupByLibrary.simpleMessage("Borrar cuenta"),
    "settingsScreenSettingTitleEmailAddress" : MessageLookupByLibrary.simpleMessage("Dirección de correo"),
    "settingsScreenSettingTitleLanguage" : MessageLookupByLibrary.simpleMessage("Lenguaje"),
    "settingsScreenSettingTitleName" : MessageLookupByLibrary.simpleMessage("Nombre"),
    "settingsScreenSettingTitleTheme" : MessageLookupByLibrary.simpleMessage("Tema"),
    "settingsScreenSettingTitleThemeAMOLED" : MessageLookupByLibrary.simpleMessage("AMOLED"),
    "settingsScreenSettingTitleThemeDark" : MessageLookupByLibrary.simpleMessage("Obscuro"),
    "settingsScreenSettingTitleThemeLight" : MessageLookupByLibrary.simpleMessage("Claro"),
    "thriftyDrawerMessageShare" : MessageLookupByLibrary.simpleMessage("Checa esta app que te ayuda a administrar tus ingresos y gastos de forma segura: https://pillai.xyz/thrifty"),
    "thriftyDrawerTextAbout" : MessageLookupByLibrary.simpleMessage("Acerca de la App"),
    "thriftyDrawerTextAboutAppLegalese" : MessageLookupByLibrary.simpleMessage("Esta aplicación es de codigo abierto y gratuita, gobernada por la Apache License 2.0. Si eres desarrollador por favor sientete libre de contribuir a esta app en GitHub."),
    "thriftyDrawerTextAboutFooter" : MessageLookupByLibrary.simpleMessage("Si te gusta la app y la usas regularmente, por favor dona lo que puedas, esto es suficiente para mantener la app viva y corriendo por si misma. Los detalles para donaciónes pueden encontrarse en la pagina de GitHub del proyecto o en el sitio web. Muchas gracias!"),
    "thriftyDrawerTextCategories" : MessageLookupByLibrary.simpleMessage("Categorías"),
    "thriftyDrawerTextCurrencies" : MessageLookupByLibrary.simpleMessage("Monedas"),
    "thriftyDrawerTextExport" : MessageLookupByLibrary.simpleMessage("Exportar a JSON/CSV"),
    "thriftyDrawerTextLogout" : MessageLookupByLibrary.simpleMessage("Cerrar sesión"),
    "thriftyDrawerTextRate" : MessageLookupByLibrary.simpleMessage("Calificar la App"),
    "thriftyDrawerTextSettings" : MessageLookupByLibrary.simpleMessage("Ajustes"),
    "thriftyDrawerTextShare" : MessageLookupByLibrary.simpleMessage("Comparte el amor"),
    "thriftyOverviewTextBalanceHeading" : MessageLookupByLibrary.simpleMessage("TU BALANCE"),
    "thriftyOverviewTextBudgetSet" : m2,
    "thriftyOverviewTextBudgetUnset" : MessageLookupByLibrary.simpleMessage("Toca aquí para establecer un presupuesto mensual y administrar tus gastos eficientemente."),
    "transactionBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("AGREGAR"),
    "transactionBottomSheetButtonTextExpense" : MessageLookupByLibrary.simpleMessage("Gasto"),
    "transactionBottomSheetButtonTextIncome" : MessageLookupByLibrary.simpleMessage("Ingreso"),
    "transactionBottomSheetButtonTextUpdate" : MessageLookupByLibrary.simpleMessage("ACTUALIZAR"),
    "transactionBottomSheetLabelTextAmount" : MessageLookupByLibrary.simpleMessage("Monto"),
    "transactionBottomSheetLabelTextDate" : MessageLookupByLibrary.simpleMessage("Fecha"),
    "transactionBottomSheetLabelTextDescription" : MessageLookupByLibrary.simpleMessage("Descripción (opcional)"),
    "transactionBottomSheetTextHeadingAdd" : MessageLookupByLibrary.simpleMessage("Agregar nueva transacción"),
    "transactionBottomSheetTextHeadingUpdate" : MessageLookupByLibrary.simpleMessage("Actualizar transacción"),
    "transactionListHiddenTransactionText" : m3,
    "updateBudgetBottomSheetButtonTextClear" : MessageLookupByLibrary.simpleMessage("LIMPIAR"),
    "updateBudgetBottomSheetButtonTextSetBudget" : MessageLookupByLibrary.simpleMessage("ESTABLECER PRESUPUESTO"),
    "updateBudgetBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Por favor ingresa un presupuesto mensual que creas que es moderado de acuerdo a tus habitos de gasto."),
    "updateBudgetBottomSheetLabelTextBudget" : MessageLookupByLibrary.simpleMessage("Presupuesto")
  };
}
