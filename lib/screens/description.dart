import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/screens/musicplay.dart';

import 'package:meditation/widgets/responsive.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class Description extends StatefulWidget {
  int index;
  Description(this.index, {Key key}) : super(key: key);

  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 360,height: 640);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    child: GestureDetector(
                      
                      onTap: (){
                        Navigator.push(context, PageRouteBuilder(transitionDuration: Duration(milliseconds: 700),pageBuilder: (_,__,___)=>Playsound(widget.index)));
                      },
                      child: Hero(
                        tag: "image${widget.index}",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.asset(
                                listofsounds[widget.index].getimage,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    "${listofsounds[widget.index].gettitle}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xfff2f3f4)),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                bottom: 15,
                                child: ClipOval(
                                  child: BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                    child: Container(
                                      height: 55.h,
                                      width: 55.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.18),
                                        borderRadius: BorderRadius.circular(60.0),
                                      ),
                                      child: Center(
                                        child: Icon(OMIcons.playArrow,
                                            size: 35.h,
                                            color: Color(0xfff2f3f4)),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15,horizontal: 12),
                    child: RichText(
                      text: TextSpan(
                          text: "${listofsounds[widget.index].getdesc}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black)),
                    ),
                  ),
                )
              ],
            ),
          ),
          SlidingUpPanel(
            backdropEnabled: false,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: white,
            parallaxEnabled: true,
            parallaxOffset: 1.0,
            minHeight: MediaQuery.of(context).size.height * 0.12,
            maxHeight: MediaQuery.of(context).size.height * 0.6,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, -5),
                  blurRadius: 5)
            ],
            panel: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 15.h),
                    height: 5.h,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 25.h, left: 10.h),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Related Sounds",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
