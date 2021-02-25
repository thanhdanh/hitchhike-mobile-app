import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String errorText;
  final TextInputType inputType;
  final EdgeInsets padding;
  final ValueChanged onFieldSubmitted;
  final ValueChanged onChanged;
  final bool autoFocus;
  final bool isIcon;
  final bool isObscure;
  final Color hintColor;
  final Color iconColor;
  final TextInputAction inputAction;

  const TextFieldWidget({
    Key key,
    this.icon,
    this.hint,
    this.errorText,
    this.inputType,
    this.padding = const EdgeInsets.all(0),
    this.onFieldSubmitted,
    this.onChanged,
    this.autoFocus = false,
    this.isObscure = false,
    this.isIcon = true,
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.inputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        maxLength: 25,
        keyboardType: this.inputType,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: this.hint,
            errorText: errorText,
            icon: this.isIcon ? Icon(this.icon, color: iconColor) : null),
      ),
    );
  }
}
