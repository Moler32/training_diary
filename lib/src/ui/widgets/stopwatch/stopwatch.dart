import 'package:flutter/material.dart';
import 'package:training_diary/src/ui/widgets/stopwatch/stopwatch_model.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key, required this.stopWatchModel});
  final StopWatchModel stopWatchModel;

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.stopWatchModel.timeDuration.inHours
              .remainder(60)
              .toString()
              .padLeft(2, '0'),
          style: TextStyle(color: Colors.amber),
        ),
        const Text(
          ':',
          style: TextStyle(color: Colors.amber),
        ),
        Text(
          widget.stopWatchModel.timeDuration.inMinutes
              .remainder(60)
              .toString()
              .padLeft(2, '0'),
          style: TextStyle(color: Colors.amber),
        ),
        const Text(
          ':',
          style: TextStyle(color: Colors.amber),
        ),
        Text(
          widget.stopWatchModel.timeDuration.inSeconds
              .remainder(60)
              .toString()
              .padLeft(2, '0'),
          style: TextStyle(color: Colors.amber),
        ),
        widget.stopWatchModel.canClose
            ? IconButton(
                icon: const Icon(
                  Icons.pause,
                  color: Colors.amber,
                ),
                onPressed: () {
                  widget.stopWatchModel.pauseTimer();
                },
              )
            : IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.amber,
                ),
                onPressed: () {
                  widget.stopWatchModel.startTimer();
                },
              ),
        IconButton(
          icon: const Icon(
            Icons.stop,
            color: Colors.amber,
          ),
          onPressed: () {
            widget.stopWatchModel.stopTimer();
          },
        ),
      ],
    );
  }
}
