import 'package:flutter/material.dart' hide Tolerance;
import 'package:resistor_package/resistor_package.dart';

import 'drop_down_widget.dart';
import 'lists.dart';

class ResistorConfig extends StatelessWidget {
  final Digit firstDigit;
  final Digit secondDigit;
  final Digit thirdDigit;
  final Multiplier multiplier;
  final Tolerance tolerance;

  final bool showThirdDigit;

  final void Function(Digit?)? onChangedFirstDigit;
  final void Function(Digit?)? onChangedSecondDigit;
  final void Function(Digit?)? onChangedThirdDigit;
  final void Function(Multiplier?)? onChangedMultiplier;
  final void Function(Tolerance?)? onChangedTolerance;
  final void Function(bool?)? onChangedShowThirdDigit;

  ResistorConfig({
    super.key,
    required this.firstDigit,
    required this.secondDigit,
    required this.thirdDigit,
    required this.multiplier,
    required this.tolerance,
    required this.showThirdDigit,
    this.onChangedShowThirdDigit,
    this.onChangedFirstDigit,
    this.onChangedSecondDigit,
    this.onChangedThirdDigit,
    this.onChangedMultiplier,
    this.onChangedTolerance,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: CheckboxListTile(
          value: showThirdDigit,
          title: Text('Five bands'),
          contentPadding: EdgeInsets.zero,
          onChanged: onChangedShowThirdDigit,
        ),
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropDownWidget<Digit>(
              value: firstDigit,
              items: digitList(),
              onChanged: onChangedFirstDigit,
              text: 'First Digit',
            ),
            DropDownWidget<Digit>(
              value: secondDigit,
              items: digitList(),
              onChanged: onChangedSecondDigit,
              text: 'Second Digit',
            ),
            Visibility(
              visible: showThirdDigit,
              child: DropDownWidget<Digit>(
                value: thirdDigit,
                text: 'Third Digit',
                items: digitList(),
                onChanged: onChangedThirdDigit,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DropDownWidget<Multiplier>(
            value: multiplier,
            text: 'Multiplier',
            items: multiplierList(),
            onChanged: onChangedMultiplier,
          ),
          DropDownWidget<Tolerance>(
            value: tolerance,
            text: 'Tolerance',
            items: toleranceList(),
            onChanged: onChangedTolerance,
          ),
        ],
      ),
    ]);
  }
}
