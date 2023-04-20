import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:training_diary/core/constants/images.dart';
import 'package:training_diary/src/data_sources/isar_db/isar.dart';
import 'package:training_diary/src/models/locale/locale_model.dart';

part 'locale_state.dart';
part 'locale_cubit.freezed.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit(this.isarDB)
      : super(LocaleState.changedLocale(LocaleModel('en', usaFlag, 'English')));
  final IsarDB isarDB;

  LocaleModel? _localeModel;

  Future<LocaleModel?> _getLanguage() async {
    _localeModel = await isarDB.fetchLanguage();

    return _localeModel;
  }

  Future<void> getLanguage() async {
    try {
      emit(const LocaleState.loading());
      Future.delayed(const Duration(milliseconds: 400));
      await _getLanguage();
      if (_localeModel == null || _localeModel!.language.isEmpty) {
        _localeModel = LocaleModel('en', usaFlag, 'English');
      }
      emit(LocaleState.changedLocale(_localeModel!));
    } catch (e, st) {
      emit(LocaleState.errorLocale(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  Future<void> saveLanguage(String language, String image, String title) async {
    try {
      emit(const LocaleState.loading());
      Future.delayed(const Duration(milliseconds: 400));
      await isarDB.addlanguage(LocaleModel(language, image, title));
      emit(LocaleState.changedLocale(LocaleModel(language, image, title)));
    } catch (e, st) {
      emit(LocaleState.errorLocale(e.toString()));
      GetIt.I<Talker>().handle(e, st);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
