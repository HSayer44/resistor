
import 'dart:math';

import 'package:resistor/enums.dart';

class Resistor {
  final List<Digit> digits;
  final Multiplier multiplier;
  final Tolerance tolerance;

  //this is private
  Resistor._({
    required Digit firstDigit,
    required Digit secondDigit,
    Digit? thirdDigit,
    required this.multiplier,
    required this.tolerance,
  }) : digits = [firstDigit, secondDigit, if (thirdDigit != null) thirdDigit]; //: assert(firstDigit.value != null, 'first digit can not be gold or silver');

  factory Resistor.band4({
    required Digit firstDigit,
    required Digit secondDigit,
    required Multiplier multiplier,
    required Tolerance tolerance,
  }) {
    return Resistor._(
      firstDigit: firstDigit,
      secondDigit: secondDigit,
      multiplier: multiplier,
      tolerance: tolerance,
    );
  }

  factory Resistor.band5({
    required Digit firstDigit,
    required Digit secondDigit,
    required Digit thirdDigit,
    required Multiplier multiplier,
    required Tolerance tolerance,
  }) {
    return Resistor._(
      firstDigit: firstDigit,
      secondDigit: secondDigit,
      thirdDigit: thirdDigit,
      multiplier: multiplier,
      tolerance: tolerance,
   );
  }


  void calculateResistance() {

    double resistance = 0;
    for (int zaehler = 0; zaehler < digits.length; zaehler++)
    {
       resistance = digits[zaehler].value * pow(10, digits.length - zaehler) + resistance;
    }
    resistance *= multiplier.value;

    print('${resistance} Ohm ± ${tolerance.value}');
  }

  static double _calc5Band({
    required Digit firstDigit,
    required Digit secondDigit,
    required Digit thirdDigit,
    required Multiplier multiplier,
    required Tolerance tolerance,
  }) {
    return (firstDigit.value * 100 + secondDigit.value * 10 + thirdDigit.value) * multiplier.value;
  }
}
