import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StopWatch> {
  Timer? _timer;
  int _countedSecond = 0;
  Duration timeDuration = Duration.zero;
  bool timerRunning = false;

  void startTimer() {
    timerRunning = true;
    // _timer?.cancel();
    // _countedSecond = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _countedSecond++;
        timeDuration = Duration(seconds: _countedSecond);
      });
    });
    // int date = DateTime.now().millisecondsSinceEpoch;
    // final dateNow = DateTime.fromMillisecondsSinceEpoch(date);
  }

  void stopTimer() {
    timerRunning = false;
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(timeDuration.inMinutes.toString()),
        const Text(':'),
        Text(timeDuration.inSeconds.remainder(60).toString().padLeft(2, '0')),
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {
            startTimer();
          },
        ),
        IconButton(
          icon: const Icon(Icons.volume_down),
          onPressed: () {
            stopTimer();
          },
        ),
      ],
    );
  }
}
