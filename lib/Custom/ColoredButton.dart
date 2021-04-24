import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ColoredButton extends StatelessWidget {
  const ColoredButton(
      {Key key, this.imagePath, this.onClick, this.text, this.iconData})
      : super(key: key);
  final String text;
  final String imagePath;
  final Function onClick;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width - 80,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Color(0xfffd746c),
              Color(0xffff9068),
              Color(0xfffd746c),
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
