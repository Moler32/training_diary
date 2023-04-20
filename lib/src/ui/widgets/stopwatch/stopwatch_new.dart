import 'package:flutter/material.dart';
import 'package:training_diary/src/models/stopwatch/stopwatch_model.dart';

class StopwatchNew extends StatefulWidget {
  const StopwatchNew({super.key});

  @override
  State<StopwatchNew> createState() => _StopwatchNewState();
}

class _StopwatchNewState extends State<StopwatchNew> {
  final StopwatchModel _stopwatchModel = StopwatchModel();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _stopwatchModel.timeStream,
      initialData: 0,
      builder: (context, snapshot) {
        return Column(
          children: [
            Text('${snapshot.data} секунд'),
            ElevatedButton(
              child: const Text('go'),
              onPressed: () {
                _stopwatchModel.start();
              },
            ),
            ElevatedButton(
              child: const Text('stop'),
              onPressed: () {
                _stopwatchModel.stop();
              },
            )
          ],
        );
      },
    );

    // Row(
    //   children: [
    //     Text(_stopwatchModel.stopwatch.elapsed.inMinutes.toString()),
    //     Text(':'),
    //     Text(_stopwatchModel.stopwatch.elapsed.inSeconds
    //         .remainder(60)
    //         .toString()
    //         .padLeft(2, '0')),
    //     IconButton(
    //       icon: Icon(Icons.volume_up),
    //       onPressed: () {
    //         _stopwatchModel.start();
    //       },
    //     ),
    //     IconButton(
    //       icon: Icon(Icons.volume_down),
    //       onPressed: () {
    //         _stopwatchModel.stop();
    //       },
    //     ),
    //   ],
    // );
  }
}
