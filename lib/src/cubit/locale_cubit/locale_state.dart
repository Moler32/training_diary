part of 'locale_cubit.dart';

@freezed
class LocaleState with _$LocaleState {
  const factory LocaleState.loading() = LoadingLocale;
  const factory LocaleState.changedLocale(LocaleModel localeModel) =
      ChangedLocale;
  const factory LocaleState.errorLocale(String message) = ErrorLocale;
}
