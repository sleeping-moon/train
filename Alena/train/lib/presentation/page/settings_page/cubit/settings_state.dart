part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {
  final String theme;
  final String font;

  SettingsInitial( {
    required this.font,
    required this.theme,
  });

  SettingsInitial copyWith({
    String? theme,
    String? font,
  }) =>
      SettingsInitial(
        font: font ?? this.font,
        theme: theme ?? this.theme,
      );

  factory SettingsInitial.init() =>
      SettingsInitial(
        font: StandardText.fontDefault,
        theme: StandardText.themeLight,);
}
