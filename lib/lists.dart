
import 'package:flutter/material.dart' hide Tolerance;
import 'package:resistor_package/resistor_package.dart';

List<DropdownMenuItem<String>> digitList() {
  List<DropdownMenuItem<String>> items = [];
  for (Digit d in Digit.values) {
    items.add(
      DropdownMenuItem(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(d.name),
              SizedBox(width: 10),
              Text(d.value.toString()),
            ],
          ),
        ),
        value: d.name,
      ),
    );
  }
  return items;
}

List<DropdownMenuItem<String>> multiplierList() {
  List<DropdownMenuItem<String>> items = [];
  for (Multiplier d in Multiplier.values) {
    items.add(
      DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(d.name),
            SizedBox(width: 10),
            Text(d.value.toString()),
          ],
        ),
        value: d.name,
      ),
    );
  }
  return items;
}

List<DropdownMenuItem<String>> toleranceList() {
  List<DropdownMenuItem<String>> items = [];
  for (Tolerance d in Tolerance.values) {
    items.add(
      DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(d.name),
            SizedBox(width: 10),
            Text(d.value.toString()),
          ],
        ),
        value: d.name,
      ),
    );
  }
  return items;
}