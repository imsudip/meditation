import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/widgets/responsive.dart';

class PlayAnim extends StatefulWidget {
  Function onclk;

  var totaltime;

  PlayAnim( {Key key,this.onclk,this.totaltime}) : super(key: key);
  @override
  _PlayAnimState createState() => _PlayAnimState();
  
}

class _PlayAnimState extends State<PlayAnim> {
  String _animstate = "go";
  IconData _icon = Icons.pause;
  void onclick() {
    widget.onclk();
    setState(() {
      if (_animstate == "go") {
        _animstate = "stop";
        _icon = Icons.play_arrow;
      } else {
        _animstate = "start";
        _icon = Icons.pause;
        Future.delayed(Duration(milliseconds: 1500),(){
      setState(() {
        _animstate = "go";
      });
    });
      }
    });
    
  }
  @override
  void initState() {
    Future.delayed(Duration(seconds: widget.totaltime),(){
      onclick();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 360,height: 640);
    return Container(
      color: Colors.transparent,
       height: 300.h,
            width: 300.h,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: 300.h,
            width: 300.h,
            color: Colors.transparent,
            child: FlareActor(
              "assets/loading_1.flr",
              animation: _animstate,
            ),
          ),
          Center(
            child: InkWell(
              splashColor: Color(0x00ffffff),
              focusColor:Colors.transparent ,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () {
                onclick();
              },
              child: Container(
                height: 150.h,
            width: 150.h,
                color: Colors.transparent,
                child: Icon(
                  _icon,
                  color: Colors.orange,
                  size: 50.h,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
