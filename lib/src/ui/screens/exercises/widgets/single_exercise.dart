import 'package:flutter/material.dart';

class SingleExercise extends StatelessWidget {
  const SingleExercise(
      {super.key,
      required this.index,
      this.title,
      this.sets,
      this.reps,
      this.weight,
      this.time,
      this.description});

  final int index;
  final String? title;
  //подходы
  final int? sets;
  // повторения
  final int? reps;
  final int? weight;
  final String? time;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: const Icon(Icons.keyboard_arrow_right),
        leading: const Icon(Icons.fitness_center),
        tileColor: index % 2 == 0 ? Colors.amber : Colors.blue,
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
                            Text(sets.toString(),
                                style: TextStyle(fontSize: 16)),
                            Text(reps.toString(),
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(weight.toString(),
                                style: TextStyle(fontSize: 16)),
                            Text(time.toString(),
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(description ?? '', style: TextStyle(fontSize: 16)),
                        TextButton(
                            onPressed: () {}, child: Text('Добавить описание'))
                      ],
                    ),
                  ),
                );
              },
              context: context);
        },
        // height: 100,
        // decoration: BoxDecoration(color: Colors.yellow[700]),
        title: Text(title ?? ''),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     SizedBox(
        //       height: 5,
        //     ),
        //     Text(
        //       'Станова тяга',
        //       style: TextStyle(fontSize: 20),
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 25),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Row(
        //             children: [
        //               Icon(Icons.replay_circle_filled),
        //               SizedBox(
        //                 width: 5,
        //               ),
        //               Text('4', style: TextStyle(fontSize: 16)),
        //             ],
        //           ),
        //           Row(
        //             children: [
        //               Icon(Icons.scale),
        //               SizedBox(
        //                 width: 5,
        //               ),
        //               Text('65 кг', style: TextStyle(fontSize: 16)),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Text('Повторений: 8, 10, 12, 14', style: TextStyle(fontSize: 16)),
        //   ],
        // ),
      ),
    );
  }
}
