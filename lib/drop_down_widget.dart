import 'package:flutter/material.dart';

class DropDownWidget<T> extends StatelessWidget {
  final String text;
  final T value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;

   DropDownWidget({
    super.key,
    required this.value,
    this.items,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        DropdownButton<T>(
          value: value,
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
