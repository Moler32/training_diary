import 'package:isar/isar.dart';

part 'training_model.g.dart';

@collection
class Training {
  Training(this.title, this.weekDay, this.exercises);
  Id id = Isar.autoIncrement;
  String? title;
  String? weekDay;
  List<Exercise> exercises;
}

@embedded
class Exercise {
  Exercise(
      {this.title,
      this.sets,
      this.reps,
      this.weight,
      this.time,
      this.description,
      this.isComlete = false});

  String? title;
  //подходы
  String? sets;
  // повторения
  String? reps;
  String? weight;
  String? time;
  String? description;
  bool isComlete;
}
