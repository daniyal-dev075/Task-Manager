import 'package:flutter/material.dart';
import 'package:task_manager/res/app_colors.dart';

class TextfieldContainer extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  const TextfieldContainer({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLines=1,
    this.prefixIcon,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  State<TextfieldContainer> createState() => _TextfieldContainerState();
}

class _TextfieldContainerState extends State<TextfieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        obscuringCharacter: '*',style: TextStyle(color: Colors.black),
        cursorColor: Colors.grey.shade600,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            fillColor: AppColours.textfieldColour,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8)
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            )
        ),
      ),
    );
  }
}
