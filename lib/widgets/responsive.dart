import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color white = const Color(0xfff2f3f4);


class SoundType {
  String _image;
  String _title;

  String description;

  Color maincolor = Colors.black;

  SoundType(String image, String title, {this.description, this.maincolor}) {
    _image = "assets/" + image + ".jpg";
    _title = title;
  }
  String get getimage => _image;
  String get gettitle => _title;
  String get getdesc => description;
  Color get getcolor => maincolor.withOpacity(0.12);
}

List<SoundType> listofsounds = [
  SoundType("breathe", "Breathe",
      description:
          "Practice the following meditation technique to help calm your breath, your mind, and your whole being. Inhale deeply, and then slowly exhale. Wait for the breath to come in of its own accord, and watch its flow. As the breath flows out naturally, again observe the movement",
      maincolor: Colors.greenAccent),
  SoundType("sleep", "Sleep",
  maincolor: Colors.redAccent,
      description:
          "Sleep Sounds lets you play ambient sounds to help you sleep peacefully or block out unwanted noise at work or home."),
  SoundType("relax", "Relax",
  maincolor: Colors.amber,
      description:
          "Relax your body & mind with the beautiful high quality music. We have carefully selected music types that are perfect for relaxation "),
  SoundType("nature", "Nature",maincolor: Colors.white),
];
