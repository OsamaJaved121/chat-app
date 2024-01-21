import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final Function onPressed;
  final shape = const StadiumBorder();

  const RoundedButton(this.name, this.height, this.width, this.onPressed,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 0.250),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
