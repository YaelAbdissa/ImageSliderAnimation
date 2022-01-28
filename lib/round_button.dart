import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final VoidCallback onPressed;

  RoundButton.large({
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : size = 60.0;

  RoundButton.small({
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : size = 60.0;

  const RoundButton(
      {Key? key,
      required this.icon,
      required this.color,
      required this.onPressed,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            new BoxShadow(color: Color(0x11000000), blurRadius: 10.0)
          ]),
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: CircleBorder(),
        elevation: 0.0,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
