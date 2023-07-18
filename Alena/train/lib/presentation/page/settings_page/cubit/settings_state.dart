part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {
  final String theme;

  SettingsInitial({
    required this.theme,
  });

  SettingsInitial copyWith({
    String? theme,
  }) =>
      SettingsInitial(
        theme: theme ?? this.theme,
      );

  factory SettingsInitial.init() =>
      SettingsInitial(
        theme: StandardText.themeLight,
      );
}
