import 'dart:async';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/widgets/timerwidget.dart';
import 'package:quiver/async.dart';

import 'package:flutter/material.dart';
import 'package:meditation/widgets/responsive.dart';
import 'package:meditation/widgets/watery_giggle.dart';

class Playsound extends StatefulWidget {
  var index;

  Playsound(this.index, {Key key}) : super(key: key);

  _PlaysoundState createState() => _PlaysoundState();
}

class _PlaysoundState extends State<Playsound> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 360,height: 640);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "image${widget.index}",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                listofsounds[widget.index].getimage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: listofsounds[widget.index].getcolor,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                    top: 50.h,
                    left: 20.w,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        "${listofsounds[widget.index].gettitle}",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Color(0xfff2f3f4)),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
