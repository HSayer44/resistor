import 'package:resistor/enums.dart';
import 'package:resistor/resistor.dart';

void main(List<String> arguments) {
  final resistor = Resistor.band5(
    firstDigit: Digit.blue,
    secondDigit: Digit.red,
    thirdDigit: Digit.orange,
    multiplier: Multiplier.green,
    tolerance: Tolerance.gold,
  );

  resistor.calculateResistance();
}
