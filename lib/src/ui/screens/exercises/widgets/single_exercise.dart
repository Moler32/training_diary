import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/core/styles/theme/constants.dart';
import 'package:training_diary/src/models/trainings/training_model.dart';

class SingleExercise extends StatelessWidget {
  const SingleExercise(
      {super.key,
      required this.index,
      this.title,
      this.sets,
      this.reps,
      this.weight,
      this.time,
      this.description,
      this.isComplete = false,
      this.onTapCheckbox,
      this.onSwapLeft,
      this.onSwapRight,
      this.exercises});

  final int index;
  final String? title;
  //подходы
  final String? sets;
  // повторения
  final String? reps;
  final String? weight;
  final String? time;
  final String? description;
  final List<Exercise>? exercises;
  final bool isComplete;
  final Function()? onTapCheckbox;
  final Function()? onSwapLeft;
  final Function()? onSwapRight;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      closeOnScroll: false,
      // key: Key('$index'),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              onSwapRight?.call();
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: LocaleKeys.change.tr(),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              onSwapLeft?.call();
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: LocaleKeys.delete.tr(),
          ),
        ],
      ),
      child: InkWell(
        // key: Key('$index'),

        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Column(
                      children: [
                        Container(
                          width: 39,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          title ?? '',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${LocaleKeys.sets.tr()}: $sets',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${LocaleKeys.reps.tr()}: $reps',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${LocaleKeys.weight.tr()}: $weight',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              '${LocaleKeys.time.tr()}: $time',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              '${LocaleKeys.description.tr()}:',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              description ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              context: context);
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: exercisesColors,
              ),
              borderRadius: exercises!.length == 1
                  ? BorderRadius.circular(10)
                  : index == 0
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )
                      : index == exercises!.length - 1
                          ? const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )
                          : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  title ?? '',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    value: isComplete,
                    onChanged: (value) {
                      onTapCheckbox?.call();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
