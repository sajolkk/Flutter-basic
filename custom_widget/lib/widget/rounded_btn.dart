import 'package:custom_widget/ui_helper/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnName;
  final Icon? btnIcon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;

  const RoundedButton({
    required this.btnName,
    this.btnIcon,
    this.bgColor = Colors.deepPurple,
    this.textStyle,
    this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          callback!();
        },
        child: btnIcon != null? Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: btnIcon!,
            ),
            Text(btnName, style: textStyle,)
          ],
        ):Text(btnName, style: textStyle,),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shadowColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
