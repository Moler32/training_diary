import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
      this.onSwapRight});

  final int index;
  final String? title;
  //подходы
  final String? sets;
  // повторения
  final String? reps;
  final String? weight;
  final String? time;
  final String? description;
  final bool isComplete;
  final Function()? onTapCheckbox;
  final Function()? onSwapLeft;
  final Function()? onSwapRight;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // key: ValueKey(index),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              onSwapRight?.call();
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Редактировать',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              onSwapLeft?.call();
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
          ),
        ],
      ),

      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return DecoratedBox(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
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
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Подходов: $sets',
                                style: TextStyle(fontSize: 16)),
                            Text('Повторений: $reps',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Вес: $weight кг',
                                style: TextStyle(fontSize: 16)),
                            Text('Время: $time мин',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          children: [
                            Text('Описание:', style: TextStyle(fontSize: 16)),
                            SizedBox(
                              height: 15,
                            ),
                            Text(description ?? '',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              context: context);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.fitness_center),
              Text(
                title ?? '',
                style: TextStyle(fontSize: 20),
              ),
              Row(children: [
                Checkbox(
                    value: isComplete,
                    onChanged: (value) {
                      onTapCheckbox?.call();
                    }),
                // Icon(Icons.keyboard_arrow_right)
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
