import 'package:flutter/material.dart';
import 'package:task_manager/res/app_colors.dart';

class ButtonContainer extends StatefulWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const ButtonContainer({
    super.key,
    required this.title,
    required this.onPress,
    this.loading = false
  });

  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Container(
          height: 50,
          width: 400,
          decoration: BoxDecoration(
            color: AppColours.buttonColour,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text(widget.title,style: TextStyle(color: Colors.white,fontSize: 16),)),
        ),
      ),
    );
  }
}
