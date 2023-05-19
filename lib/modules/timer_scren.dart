import 'package:flutter/material.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
   

   class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  bool _isRunning = true;
  final _controller = CountDownController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Parking Timer'
            ),
       ),
       body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*.5,
                  width: MediaQuery.of(context).size.height*.5,
                  child: CountDownProgressIndicator(
                    controller: _controller,
                    valueColor: Colors.black,
                    backgroundColor: Colors.grey,
                    initialPosition: 0,
                    duration: 120,
                    timeFormatter: (seconds,) {
                      return Duration(seconds: seconds)
                          .toString()
                          .split('.')[0]
                          .padLeft(8, '0');
                    },
                    timeTextStyle: TextStyle(fontSize: 50),
                    text: 'Hours  :Minutes  :  Seconds',
                    labelTextStyle: TextStyle(color: Colors.grey[380]),
                  
                    strokeWidth: 20,
                    onComplete: () => null,
                  ),
                ),
               
               /* const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => setState(() {
                    if (_isRunning) {
                      _controller.pause();
                     
                    } else {
                      _controller.resume();
                     
                    }

                    _isRunning = !_isRunning;
                  }),
                  child: Text(_isRunning ? 'Pause' : 'Resume'),
                )*/
              ],
            ),
          ),
        ),
    );
  }
}