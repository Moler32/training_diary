import 'dart:async';

class StopwatchModel {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;
  final StreamController<int> _timeController = StreamController<int>();
  Stream<int> get timeStream => _timeController.stream;

  void start() {
    stopwatch.start();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timeController.add(stopwatch.elapsed.inSeconds);
    });
  }

  void stop() {
    stopwatch.stop();
    timer?.cancel();
  }
}
