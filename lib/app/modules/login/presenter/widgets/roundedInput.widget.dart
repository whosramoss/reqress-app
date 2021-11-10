import 'package:flutter/material.dart';
import 'package:reqresapp/app/app_theme.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String Function() errorText;
  const RoundedInputField({
    this.hintText,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xFFF1E6FF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        onChanged: onChanged,
        cursorColor: ThemeLoginApp.accentColor,
        decoration: InputDecoration(
          // hintText: hintText,
          labelText: hintText,
          border: InputBorder.none,
          errorText: errorText == null ? null : errorText(),
        ),
      ),
    );
  }
}
