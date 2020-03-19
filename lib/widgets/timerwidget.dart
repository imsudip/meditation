import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/widgets/responsive.dart';
import 'package:quiver/async.dart';
import 'package:flutter/material.dart';
import 'package:meditation/widgets/watery_giggle.dart';

class TimerCountWidget extends StatefulWidget {
 static int totaltime;
  double width_;

  double height_;
  TimerCountWidget({int xtotaltime,this.width_,this.height_, Key key}) : super(key: key){
    totaltime=xtotaltime;
  }
  int get getotatime=>totaltime;
  _TimerCountWidgetState createState() => _TimerCountWidgetState();
}

class _TimerCountWidgetState extends State<TimerCountWidget> {
   bool isstop = false;
   
   @override
  void dispose() {
   isstop=true;
    super.dispose();
  }
 static CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: TimerCountWidget.totaltime),
      new Duration(seconds: 1),
    );

  var sub = countDownTimer.listen(null);
   String _current = "00:00";
    bool ispaused = false;
  @override
  void initState() {
  
   

    

    sub.onData((duration) {
      if (isstop == false) {
       
        setState(() {
          _current = duration.elapsed.toString().substring(2, 7);
        });
      } else if (isstop == true) {
        print("cancelled");
        sub.cancel();
      }
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 360,height: 640);

    return Container(
      width: widget.width_,
      height: widget.height_,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Material(
              type: MaterialType.transparency,
              child: Center(
                child: PlayAnim(
                  totaltime: TimerCountWidget.totaltime,
                  onclk: () {
                    if (sub.isPaused) {
                      sub.resume();
                    } else {
                      sub.pause();
                    }
                  },
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Material(
              type: MaterialType.transparency,
              child: Center(
                child: Container(
                    margin: EdgeInsets.only(top: 400.h),
                    child: Text(
                      "$_current",
                      style: TextStyle(
                          fontSize: 32,
                          color: white,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
