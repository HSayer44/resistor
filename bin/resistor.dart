import 'package:resistor/enums.dart';
import 'package:resistor/resistor.dart';

void main(List<String> arguments) {
  print(arguments);
  final resistor = Resistor.band5(
    firstDigit: Digit.blue,
    secondDigit: Digit.red,
    thirdDigit: Digit.orange,
    multiplier: Multiplier.green,
    tolerance: Tolerance.gold,
  );

  try {
    resistorFromArguments(arguments).calculateResistance();
  } on Exception catch (e) {
    print(e.toString());
  }

  // resistor.calculateResistance();
}


Resistor resistorFromArguments(List<String> arguments) {
  if(arguments.length > 4) {
    final resistor = Resistor.band5(firstDigit: arguments[0].toDigit(),
        secondDigit: arguments[1].toDigit(),
        thirdDigit: arguments[2].toDigit(),
        multiplier: Multiplier.fromString(arguments[3]),
        tolerance: Tolerance.fromString(arguments[4]));
    return resistor;
  } else if(arguments.length < 4) {
    throw Exception('please give all the arguments');
  } else {
    final resistor = Resistor.band4(firstDigit: arguments[0].toDigit(),
        secondDigit: arguments[1].toDigit(),
        multiplier: Multiplier.fromString(arguments[2]),
        tolerance: Tolerance.fromString(arguments[3]));
    return resistor;
  }

}
