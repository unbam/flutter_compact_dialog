import 'package:flutter/material.dart';

class AnimationIcon extends StatefulWidget {
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final int? durationMilliseconds;

  AnimationIcon({
    required this.iconData,
    required this.iconSize,
    required this.iconColor,
    this.durationMilliseconds,
  });

  @override
  _AnimationIconState createState() => _AnimationIconState();
}

class _AnimationIconState extends State<AnimationIcon>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.durationMilliseconds ?? 250),
    );

    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Icon(
        widget.iconData,
        size: widget.iconSize,
        color: widget.iconColor,
      ),
    );
  }
}
