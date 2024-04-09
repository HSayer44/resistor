import 'package:flutter/material.dart' hide Tolerance;
import 'package:resistor/home_screen.dart';
import 'package:resistor_package/resistor_package.dart';

List<DropdownMenuItem<Digit>> digitList() {
  List<DropdownMenuItem<Digit>> items = [];
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
        value: d.name.toDigit(),
      ),
    );
  }
  return items;
}

List<DropdownMenuItem<Multiplier>> multiplierList() {
  List<DropdownMenuItem<Multiplier>> items = [];
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
        value: Multiplier.fromString(d.name),
      ),
    );
  }
  return items;
}

List<DropdownMenuItem<Tolerance>> toleranceList() {
  List<DropdownMenuItem<Tolerance>> items = [];
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
        value: Tolerance.fromString(d.name),
      ),
    );
  }
  return items;
}

List<DropdownMenuItem<Resistor>> resistorDropDownList(List<Resistor> resistorList) {
  List<DropdownMenuItem<Resistor>> items = [];
  for (int i = 0; i < resistorList.length; i++) {
    items.add(
      DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Resistor $i'),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
        value: resistorList[i],
      ),
    );
  }
  return items;
}
