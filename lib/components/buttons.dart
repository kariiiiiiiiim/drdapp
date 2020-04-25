import 'package:flutter/material.dart';


class RoundButtonSpecial extends StatelessWidget {
  final Color maColor ;
  final Function func;
  final Text txt;

  RoundButtonSpecial({this.maColor,this.func  ,this.txt});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: maColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed:func,
          minWidth: 200.0,
          height: 42.0,
          child: txt,
        ),
      ),
    );
  }
}
