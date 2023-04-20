import 'package:isar/isar.dart';

part 'locale_model.g.dart';

@collection
class LocaleModel {
  LocaleModel(this.language, this.image, this.title);
  Id id = Isar.autoIncrement;
  String language;
  String title;
  String image;
}
