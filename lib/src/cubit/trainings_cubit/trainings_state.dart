part of 'trainings_cubit.dart';

@freezed
class TrainingsState with _$TrainingsState {
  const factory TrainingsState.loading() = Loading;
  const factory TrainingsState.loaded(List<Training> trainings) = Loaded;
  const factory TrainingsState.emptyList() = EmptyList;
  const factory TrainingsState.error(String message) = Error;
}
