import 'package:flutter/material.dart';

/// Button Widget template
class CalcButton extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color txtColor;
  final Function onPress;

  const CalcButton(
      {Key key, this.btnText, this.btnColor, this.txtColor, this.onPress})
      : super(key: key);

  String get buttonText {
    return btnText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: onPress,
        child: Text(
          '$btnText',
          style: TextStyle(
            fontSize: 30,
            color: txtColor,
          ),
        ),
        shape: CircleBorder(),
        color: btnColor,
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
