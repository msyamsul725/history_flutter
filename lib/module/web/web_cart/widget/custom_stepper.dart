// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  final int stepValue;
  final int lowerLimit;
  final int upperLimit;
  int value;
  final Function(int) onChanged;

  CustomStepper({
    super.key,
    required this.stepValue,
    required this.lowerLimit,
    required this.upperLimit,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(30),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Padding(
              padding: EdgeInsets.all(1.0),
              child: Icon(
                Icons.remove,
                size: 12,
              ),
            ),
          ),
          onTap: () {
            widget.value = widget.value == widget.lowerLimit
                ? widget.lowerLimit
                : widget.value -= widget.stepValue;
            widget.onChanged(widget.value);
            setState(() {});
          },
        ),
        Text(
          "${widget.value}",
          style: const TextStyle(fontSize: 10),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            widget.value = widget.value == widget.upperLimit
                ? widget.upperLimit
                : widget.value += widget.stepValue;
            widget.onChanged(widget.value);
            setState(() {});
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Padding(
              padding: EdgeInsets.all(1.0),
              child: Icon(
                Icons.add,
                size: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
