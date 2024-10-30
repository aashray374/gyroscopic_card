import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopicCard extends StatefulWidget {
  const GyroscopicCard({
    super.key,
    required this.sensitivity,
    required this.maxAngleRadians,
    required this.child,
    this.cardProperties = const Card(),
  });

  final double sensitivity;
  final double maxAngleRadians;
  final Widget child;
  final Card cardProperties; // User-defined Card properties

  @override
  State<GyroscopicCard> createState() => _GyroscopicCardState();
}

class _GyroscopicCardState extends State<GyroscopicCard> {
  double _rotationY = 0.0;
  late final StreamSubscription<GyroscopeEvent> _gyroscopeSubscription;

  @override
  void initState() {
    super.initState();
    _gyroscopeSubscription = gyroscopeEvents.listen(_updateRotation);
  }

  void _updateRotation(GyroscopeEvent event) {
    setState(() {
      _rotationY += event.y * widget.sensitivity * -1;
      _rotationY = _rotationY.clamp(-widget.maxAngleRadians, widget.maxAngleRadians);
    });
  }

  @override
  void dispose() {
    _gyroscopeSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(_rotationY),
      alignment: Alignment.center,
      child: Card(
        color: widget.cardProperties.color,
        shadowColor: widget.cardProperties.shadowColor,
        elevation: widget.cardProperties.elevation ?? 8.0,
        shape: widget.cardProperties.shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: widget.cardProperties.margin,
        clipBehavior: widget.cardProperties.clipBehavior,
        child: widget.child,
      ),
    );
  }
}
