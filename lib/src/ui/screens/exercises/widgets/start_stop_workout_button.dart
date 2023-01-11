import 'package:flutter/material.dart';

class StartStopWorkoutButton extends StatelessWidget {
  const StartStopWorkoutButton({
    super.key,
    this.onStartTap,
    this.onStopTap,
    this.title,
    this.icon,
    this.isStarting,
    this.height,
  });

  final void Function()? onStartTap;
  final void Function()? onStopTap;
  final String? title;
  final Widget? icon;
  final bool? isStarting;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const BeveledRectangleBorder()),
          backgroundColor: isStarting ?? false
              ? const MaterialStatePropertyAll<Color>(Colors.red)
              : const MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 0, 255, 8)),
        ),
        onPressed: isStarting ?? false ? onStopTap : onStartTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isStarting ?? false ? Icons.stop : Icons.play_arrow,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(isStarting ?? false
                ? 'Остановить тренировку'
                : 'Начать тренировку'),
          ],
        ),
      ),
    );
  }
}
