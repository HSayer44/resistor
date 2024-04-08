import 'package:resistor/circuit.dart';
import 'package:resistor/enums.dart';
import 'package:resistor/parallelCircuit.dart';
import 'package:resistor/resistor.dart';

void main(List<String> arguments) {
  // print(arguments);
  final resistor1 = Resistor.band5(
    firstDigit: Digit.brown,
    secondDigit: Digit.black,
    thirdDigit: Digit.black,
    multiplier: Multiplier.black,
    tolerance: Tolerance.brown,
  );
  print(resistor1.getResistance());

  final resistor2 = Resistor.band5(
    firstDigit: Digit.brown,
    secondDigit: Digit.black,
    thirdDigit: Digit.black,
    multiplier: Multiplier.black,
    tolerance: Tolerance.brown,
  );

  final resistor3 = Resistor.band5(
    firstDigit: Digit.brown,
    secondDigit: Digit.black,
    thirdDigit: Digit.black,
    multiplier: Multiplier.black,
    tolerance: Tolerance.brown,
  );

  try {
    final parallelCircuit = ParallelCircuit(
      components: [resistor1, resistor2, resistor3],
    );
    final r = parallelCircuit.getResistance();
    print(r);
  } on Exception catch (e) {
    print(e.toString());
  }

  // resistor.calculateResistance();
}

Resistor resistorFromArguments(List<String> arguments) {
  if (arguments.length > 4) {
    final resistor = Resistor.band5(
        firstDigit: arguments[0].toDigit(),
        secondDigit: arguments[1].toDigit(),
        thirdDigit: arguments[2].toDigit(),
        multiplier: Multiplier.fromString(arguments[3]),
        tolerance: Tolerance.fromString(arguments[4]));
    return resistor;
  } else if (arguments.length < 4) {
    throw Exception('please give all the arguments');
  } else {
    final resistor = Resistor.band4(
        firstDigit: arguments[0].toDigit(),
        secondDigit: arguments[1].toDigit(),
        multiplier: Multiplier.fromString(arguments[2]),
        tolerance: Tolerance.fromString(arguments[3]));
    return resistor;
  }
}
