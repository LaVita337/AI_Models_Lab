import 'dart:async';

class PomodoroStopwatch {
  int workSeconds = 25 * 60; // 25분
  int shortBreakSeconds = 5 * 60; // 5분
  int longBreakSeconds = 15 * 60; // 15분
  int cycleCount = 0;
  Timer? _timer;

  void _printTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    print(
        '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}');
  }

  void _startWork() {
    cycleCount++;
    print("Pomodoro 타이머를 시작합니다.");
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (workSeconds > 0) {
        workSeconds--;
        _printTime(workSeconds);
      } else {
        _timer!.cancel();
        if (cycleCount < 4) {
          _startShortBreak();
        } else {
          _startLongBreak();
          cycleCount = 0;
        }
      }
    });
  }

  void _startShortBreak() {
    print("작업 시간이 종료되었습니다. 5분간 휴식하세요.");
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (shortBreakSeconds > 0) {
        shortBreakSeconds--;
        _printTime(shortBreakSeconds);
      } else {
        _timer!.cancel();
        workSeconds = 25 * 60;
        shortBreakSeconds = 5 * 60;
        _startWork();
      }
    });
  }

  void _startLongBreak() {
    print("작업 시간이 종료되었습니다. 15분간 휴식하세요.");
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (longBreakSeconds > 0) {
        longBreakSeconds--;
        _printTime(longBreakSeconds);
      } else {
        _timer!.cancel();
        workSeconds = 25 * 60;
        longBreakSeconds = 15 * 60;
        _startWork();
      }
    });
  }

  void start() {
    _startWork();
  }

  void stop() {
    _timer?.cancel();
    print('타이머가 중지되었습니다.');
  }
}

void main() {
  var pomodoro = PomodoroStopwatch();
  pomodoro.start();
}
