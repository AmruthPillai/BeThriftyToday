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
  String get localeName => 'pt-br';

  static m0(type) => "Adicionar nova categoria ${type}";

  static m1(category) => "${Intl.select(category, {'Automobile': 'Automóvel', 'Awards': 'Prêmios', 'BabyCare': 'Cuidados com o bebê', 'Bonus': 'Bônus', 'Books': 'Livros', 'Charity': 'Caridade', 'Clothing': 'Roupas', 'Drinks': 'Bebidas', 'Education': 'Educação', 'Electronics': 'Eletrônicos', 'Entertainment': 'Entretenimento', 'Food': 'Comida', 'Freelance': 'Freelance', 'FriendsFamily': 'Família de amigos', 'Gifts': 'Presentes', 'Grants': 'Subvenções', 'Groceries': 'Mercearias', 'Health': 'Saúde', 'Hobbies': 'Hobbies', 'Insurance': 'Seguro', 'Interest': 'Interesse', 'Investments': 'Investimentos', 'Laundry': 'Lavanderia', 'Lottery': 'Loteria', 'Mobile': 'Móvel', 'Office': 'Escritório', 'Others': 'Outras', 'Pets': 'Animais de estimação', 'Refunds': 'Reembolsos', 'Rent': 'Renda', 'Salary': 'Salário', 'Sale': 'Venda', 'SalonSpa': 'Salon & Spa', 'Shopping': 'Compras', 'Tax': 'Imposto', 'Transportation': 'Transporte', 'Travel': 'Viagem', 'Utilities': 'Serviços de utilidade pública', 'other': '${category}',})}";

  static m2(symbol, spendAmount, budgetAmount, monthYear) => "Você gastou ${symbol} ${gastoAmount} do seu orçamento total de ${symbol} ${budgetAmount} no mês de ${monthYear}.";

  static m3(howMany) => "${Intl.plural(howMany, one: '1 transação oculta', other: '${howMany} transações ocultas')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "addCategoryBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("ADICIONAR"),
    "addCategoryBottomSheetButtonTextCancel" : MessageLookupByLibrary.simpleMessage("CANCELAR"),
    "addCategoryBottomSheetHeadingText" : m0,
    "addCategoryBottomSheetLabelTextCategoryName" : MessageLookupByLibrary.simpleMessage("Nome da Categoria"),
    "appName" : MessageLookupByLibrary.simpleMessage("Econômize hoje"),
    "categoriesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Categorias"),
    "categoriesScreenButtonTextAddNew" : MessageLookupByLibrary.simpleMessage("Adicionar novo"),
    "categoriesScreenSnackbarTextDeleteMessage" : MessageLookupByLibrary.simpleMessage("A categoria foi excluída com sucesso"),
    "categoriesScreenSnackbarTextResetCategoriesAction" : MessageLookupByLibrary.simpleMessage("sim"),
    "categoriesScreenSnackbarTextResetCategoriesConfirmation" : MessageLookupByLibrary.simpleMessage("Tem certeza de que deseja redefinir todas as categorias para a original?"),
    "categoriesScreenSnackbarTextResetCategoriesSuccess" : MessageLookupByLibrary.simpleMessage("Todas as categorias foram redefinidas com sucesso"),
    "categoriesScreenTabBarTextExpense" : MessageLookupByLibrary.simpleMessage("Despesa"),
    "categoriesScreenTabBarTextIncome" : MessageLookupByLibrary.simpleMessage("Renda"),
    "categoryName" : m1,
    "currenciesScreenAppBarTitle" : MessageLookupByLibrary.simpleMessage("Moedas"),
    "currenciesScreenSnackbarTextResetCurrenciesAction" : MessageLookupByLibrary.simpleMessage("sim"),
    "currenciesScreenSnackbarTextResetCurrenciesConfirmation" : MessageLookupByLibrary.simpleMessage("Tem certeza de que deseja redefinir todas as moedas para a original?"),
    "currenciesScreenSnackbarTextResetCurrenciesSuccess" : MessageLookupByLibrary.simpleMessage("Todas as moedas foram redefinidas com sucesso"),
    "currencySetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Qual é a sua moeda?"),
    "deleteAccountDialogButtonTextCancel" : MessageLookupByLibrary.simpleMessage("Não, eu não quero sair!"),
    "deleteAccountDialogButtonTextDelete" : MessageLookupByLibrary.simpleMessage("Sim, exclua meus dados!"),
    "deleteAccountDialogContent" : MessageLookupByLibrary.simpleMessage("Você perderá todos os dados (incluindo informações de perfil e histórico de transações) ao excluir sua conta. Este é um processo irreversível. Tem certeza de que deseja continuar com ele??"),
    "deleteAccountDialogTitle" : MessageLookupByLibrary.simpleMessage("Deseja realmente excluir sua conta?"),
    "exportBottomSheetButtonTextDownload" : MessageLookupByLibrary.simpleMessage("BAIXAR"),
    "exportBottomSheetButtonTextExport" : MessageLookupByLibrary.simpleMessage("EXPORTAÇÃO"),
    "exportBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Exportar como CSV / JSON"),
    "exportBottomSheetLabelTextEndDate" : MessageLookupByLibrary.simpleMessage("Data final"),
    "exportBottomSheetLabelTextStartDate" : MessageLookupByLibrary.simpleMessage("Data de início"),
    "exportBottomSheetTextDateValidationError" : MessageLookupByLibrary.simpleMessage("A Data de início deve ser anterior à Data de término"),
    "homeDailyNoTransactionsTextSubtitle" : MessageLookupByLibrary.simpleMessage("Toque no botão + abaixo para adicionar uma nova receita / despesa."),
    "homeDailyNoTransactionsTextTitle" : MessageLookupByLibrary.simpleMessage("Esta lista está um pouco vazia..."),
    "loginButtonTextGoogle" : MessageLookupByLibrary.simpleMessage("Entre com o Google"),
    "loginButtonTextGuest" : MessageLookupByLibrary.simpleMessage("Entrar como Convidado"),
    "loginTextTagline" : MessageLookupByLibrary.simpleMessage("O Be Thrifty Today é um aplicativo de gerenciamento de dinheiro simples e seguro que ajuda a rastrear suas receitas e despesas."),
    "profileSetupButtonTextNext" : MessageLookupByLibrary.simpleMessage("PRÓXIMO"),
    "profileSetupLabelTextEmailAddress" : MessageLookupByLibrary.simpleMessage("Endereço de e-mail"),
    "profileSetupLabelTextFullName" : MessageLookupByLibrary.simpleMessage("Nome completo"),
    "profileSetupTextHeadline" : MessageLookupByLibrary.simpleMessage("Quem é Você?"),
    "settingsScreenHeaderTitleAccount" : MessageLookupByLibrary.simpleMessage("Conta"),
    "settingsScreenHeaderTitleDangerZone" : MessageLookupByLibrary.simpleMessage("Zona de perigo"),
    "settingsScreenHeaderTitlePreferences" : MessageLookupByLibrary.simpleMessage("Preferências"),
    "settingsScreenSettingTitleAccentColor" : MessageLookupByLibrary.simpleMessage("Cor de destaque"),
    "settingsScreenSettingTitleBiometric" : MessageLookupByLibrary.simpleMessage("Segurança biométrica"),
    "settingsScreenSettingTitleBiometricDescription" : MessageLookupByLibrary.simpleMessage("Solicita sua impressão digital toda vez que você abre o aplicativo."),
    "settingsScreenSettingTitleCurrency" : MessageLookupByLibrary.simpleMessage("Moeda"),
    "settingsScreenSettingTitleDeleteAccount" : MessageLookupByLibrary.simpleMessage("Deletar conta"),
    "settingsScreenSettingTitleEmailAddress" : MessageLookupByLibrary.simpleMessage("Endereço de e-mail"),
    "settingsScreenSettingTitleLanguage" : MessageLookupByLibrary.simpleMessage("Língua"),
    "settingsScreenSettingTitleName" : MessageLookupByLibrary.simpleMessage("Nome completo"),
    "settingsScreenSettingTitleTheme" : MessageLookupByLibrary.simpleMessage("Tema"),
    "settingsScreenSettingTitleThemeAMOLED" : MessageLookupByLibrary.simpleMessage("AMOLED"),
    "settingsScreenSettingTitleThemeDark" : MessageLookupByLibrary.simpleMessage("Escuro"),
    "settingsScreenSettingTitleThemeLight" : MessageLookupByLibrary.simpleMessage("Luz"),
    "thriftyDrawerMessageShare" : MessageLookupByLibrary.simpleMessage("Confira este aplicativo que ajuda você a gerenciar suas receitas e despesas, seguras e protegidas: https://pillai.xyz/thrifty"),
    "thriftyDrawerTextAbout" : MessageLookupByLibrary.simpleMessage("Sobre o aplicativo"),
    "thriftyDrawerTextAboutAppLegalese" : MessageLookupByLibrary.simpleMessage("Este aplicativo é de código aberto e gratuito, governado sob a Apache License 2.0. Se você é um desenvolvedor, sinta-se à vontade para contribuir com o aplicativo no GitHub."),
    "thriftyDrawerTextAboutFooter" : MessageLookupByLibrary.simpleMessage("Se você ama o aplicativo e o usa regularmente, doe o mínimo possível, o suficiente para manter o aplicativo vivo e funcionando por conta própria. Detalhes da doação podem ser encontrados na página inicial do GitHub ou no site. muito obrigado!"),
    "thriftyDrawerTextCategories" : MessageLookupByLibrary.simpleMessage("Categorias"),
    "thriftyDrawerTextCurrencies" : MessageLookupByLibrary.simpleMessage("Moedas"),
    "thriftyDrawerTextExport" : MessageLookupByLibrary.simpleMessage("Exportar para JSON / CSV"),
    "thriftyDrawerTextLogout" : MessageLookupByLibrary.simpleMessage("Sair"),
    "thriftyDrawerTextRate" : MessageLookupByLibrary.simpleMessage("Avalie o aplicativo"),
    "thriftyDrawerTextSettings" : MessageLookupByLibrary.simpleMessage("Definições"),
    "thriftyDrawerTextShare" : MessageLookupByLibrary.simpleMessage("Espalhar o amor"),
    "thriftyOverviewTextBalanceHeading" : MessageLookupByLibrary.simpleMessage("SEU BALANÇO"),
    "thriftyOverviewTextBudgetSet" : m2,
    "thriftyOverviewTextBudgetUnset" : MessageLookupByLibrary.simpleMessage("Toque aqui para definir um orçamento mensal e gerenciar suas despesas com eficiência."),
    "transactionBottomSheetButtonTextAdd" : MessageLookupByLibrary.simpleMessage("ADICIONAR"),
    "transactionBottomSheetButtonTextExpense" : MessageLookupByLibrary.simpleMessage("Despesa"),
    "transactionBottomSheetButtonTextIncome" : MessageLookupByLibrary.simpleMessage("Renda"),
    "transactionBottomSheetButtonTextUpdate" : MessageLookupByLibrary.simpleMessage("ATUALIZAR"),
    "transactionBottomSheetLabelTextAmount" : MessageLookupByLibrary.simpleMessage("Montante"),
    "transactionBottomSheetLabelTextDate" : MessageLookupByLibrary.simpleMessage("Data"),
    "transactionBottomSheetLabelTextDescription" : MessageLookupByLibrary.simpleMessage("Descrição (opcional)"),
    "transactionBottomSheetTextHeadingAdd" : MessageLookupByLibrary.simpleMessage("Adicionar nova transação"),
    "transactionBottomSheetTextHeadingUpdate" : MessageLookupByLibrary.simpleMessage("Atualizar transação"),
    "transactionListHiddenTransactionText" : m3,
    "updateBudgetBottomSheetButtonTextClear" : MessageLookupByLibrary.simpleMessage("CLARO"),
    "updateBudgetBottomSheetButtonTextSetBudget" : MessageLookupByLibrary.simpleMessage("ORÇAMENTO CONJUNTO"),
    "updateBudgetBottomSheetHeadingText" : MessageLookupByLibrary.simpleMessage("Digite um orçamento mensal que considere conservador de acordo com seus hábitos de consumo."),
    "updateBudgetBottomSheetLabelTextBudget" : MessageLookupByLibrary.simpleMessage("Despesas")
  };
}
