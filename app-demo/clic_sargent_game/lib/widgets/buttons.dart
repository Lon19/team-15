import 'package:flutter/material.dart';
import 'package:clic_sargent_game/values/colours.dart';
import 'package:clic_sargent_game/values/strings.dart';


class PrimaryButton extends StatelessWidget {
  const PrimaryButton(this.text, this.onClick);
  final String text;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 60,
      child: OutlineButton(
        onPressed: onClick,
        child: Text(
          text,
          style: TextStyle(
            color: materialBlack,
            fontFamily: BODY_FONT,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        color: materialBlue,
        splashColor: Colors.grey[300],
      )
    );
  }
}