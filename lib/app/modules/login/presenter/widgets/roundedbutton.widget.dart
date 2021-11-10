import 'package:flutter/material.dart';
import 'package:reqresapp/app/app_theme.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    this.text,
    this.press,
    this.color,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: ElevatedButton(
        child: Text(text, style: TextStyle(color: textColor)),
        onPressed: press,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(7),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                  color: Colors.purple,
                ),
              ),
            )),
      ),
    );
  }
}
