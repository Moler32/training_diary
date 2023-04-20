import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:training_diary/src/models/locale/locale_model.dart';

@LazySingleton()
class IsarLocaleDB {
  Isar? isar;
  LocaleModel? localeModel;

  Future<String> fetchLanguage() async {
    isar ??= await Isar.open([LocaleModelSchema]);

    localeModel = await isar!.localeModels.where().findFirst();
    return localeModel?.language ?? 'en';
  }

  Future<void> addlanguage(LocaleModel localeModel) async {
    await isar!.writeTxn(() async {
      isar!.localeModels.put(localeModel);
    });
  }
}
