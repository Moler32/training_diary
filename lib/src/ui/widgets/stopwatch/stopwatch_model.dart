import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:training_diary/core/generated/translations/locale_keys.g.dart';
import 'package:training_diary/src/ui/widgets/buttons/negative_button.dart';
import 'package:training_diary/src/ui/widgets/buttons/positive_button.dart';

class StopWatchModel with ChangeNotifier {
  final BuildContext _context;
  StopWatchModel(this._context);
  Timer? timer;
  int _countedSecond = 0;
  Duration timeDuration = Duration.zero;
  bool timerPaused = false;
  bool get canClose => timer?.isActive ?? false;

  void startTimer() {
    timerPaused = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countedSecond++;
      timeDuration = Duration(seconds: _countedSecond);
      notifyListeners();
    });
    notifyListeners();
  }

  void stopTimer() {
    timer?.cancel();

    showDialog(
        context: _context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              LocaleKeys.stopStopWatch.tr(),
            ),
            actions: <Widget>[
              NegativeButton(
                text: LocaleKeys.no.tr(),
                onTap: () {
                  Navigator.of(context).pop();
                  // startTimer();
                },
              ),
              PositiveButton(
                text: LocaleKeys.yes.tr(),
                onTap: () {
                  Navigator.of(context).pop();
                  timerPaused = false;
                  timer?.cancel();
                  timeDuration = Duration.zero;
                  _countedSecond = 0;
                  notifyListeners();
                },
              ),
            ],
          );
        });

    notifyListeners();
  }

  void pauseTimer() {
    timerPaused = true;
    timer?.cancel();
    notifyListeners();
  }
}
