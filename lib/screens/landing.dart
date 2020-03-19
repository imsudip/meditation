import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/widgets/meditate_item.dart';
import 'package:meditation/widgets/responsive.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  
  var greetings = "Good\nMorning";
  @override
  void initState() {
    var now = DateTime.now();
    var state = now.hour;
    greetings = (state >= 6 && state <= 12)
        ? "Good\nMorning"
        : (state > 12 && state <= 16) ? "Good\nAfternoon" : "Good\nNight";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
   print(MediaQuery.of(context).size.width);
    ScreenUtil.init(context,width: 360,height: 640);
    
    return Container(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
            size: 35,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 5,
              left: 25,
              child: Container(
                width: MediaQuery.of(context).size.width*0.7,
                child: RichText(
                  text: TextSpan(
                      text: greetings + " !",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      )),
                      softWrap: true,
                ),
              ),
            ),
            Positioned(
              top: 120.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 230.h,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomRoundedListItem(listofsounds[index].getimage,
                        listofsounds[index].gettitle,index);
                  },
                ),
              ),
            ),
            SlidingUpPanel(
              backdropEnabled: false,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: white,
              parallaxEnabled: true,
              parallaxOffset: 1.0,
              minHeight: MediaQuery.of(context).size.height * 0.33,
              maxHeight: MediaQuery.of(context).size.height * 0.8,
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
                        "Reccomended For You",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
