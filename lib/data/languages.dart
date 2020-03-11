class Language {
  final String code;
  final String title;

  Language({
    this.code,
    this.title,
  });
}

final List<Language> languages = [
  Language(
    code: 'en',
    title: 'English (US)',
  ),
  Language(
    code: 'fr',
    title: 'French (Français)',
  ),
  Language(
    code: 'es',
    title: 'Spanish (Español)',
  ),
];
