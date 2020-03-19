import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/screens/description.dart';
import 'package:meditation/widgets/responsive.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class CustomRoundedListItem extends StatefulWidget {
  String image;
  String title;

  int index;
  CustomRoundedListItem(this.image, this.title,this.index, {Key key}) : super(key: key);

  _CustomRoundedListItemState createState() => _CustomRoundedListItemState();
}

class _CustomRoundedListItemState extends State<CustomRoundedListItem> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 360,height: 640);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      alignment: Alignment.center,
     // height: setheight(260),
      width: 160.w,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, PageRouteBuilder(transitionDuration: Duration(milliseconds: 700),pageBuilder: (_,__,___)=>Description(widget.index)));
        },
        child: Hero(
          tag: "image${widget.index}",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 15,
                  bottom: 15,
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: GestureDetector(
                        onTap: () {
                          print('clicked');
                        },
                        
                        child: Container(
                          height: 45.h,
                          width: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                          child: Center(
                            child: Icon(OMIcons.playArrow,
                                size: 25.h, color: Color(0xfff2f3f4)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 15,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      "${widget.title}",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900,color: Color(0xfff2f3f4)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
