enum Digit {
  black(0),
  brown(1),
  red(2),
  orange(3),
  yellow(4),
  green(5),
  blue(6),
  violet(7),
  grey(8),
  white(9);

  const Digit(this.value);

  final int value;

  static Digit fromString(String color) {
    color = color.toLowerCase();
    switch (color) {
      case 'black':
        return Digit.black;
      case 'brown':
        return Digit.brown;
      case 'red':
        return Digit.red;
      case 'orange':
        return Digit.orange;
      case 'yellow':
        return Digit.yellow;
      case 'green':
        return Digit.green;
      case 'blue':
        return Digit.blue;
      case 'violet':
        return Digit.violet;
      case 'grey':
        return Digit.grey;
      case 'white':
        return Digit.white;
      default:
        throw Exception('this is not a digit');
    }
  }
}

enum Multiplier {
  black(1),
  brown(10),
  red(100),
  orange(1000),
  yellow(10000),
  green(100000),
  blue(1000000),
  gold(0.1),
  silver(0.01);

  const Multiplier(this.value);

  final double value;

  static Multiplier fromString(String color) {
    color = color.toLowerCase();
    for (Multiplier multiplier in Multiplier.values) {
      print(multiplier);
      if (color == multiplier.name) {
        return multiplier;
      }
    }
    throw Exception('that is not a multiplier2');
  }
}

enum Tolerance {
  brown(1),
  red(2),
  green(0.5),
  blue(0.25),
  violet(0.1),
  gold(5),
  silver(10);

  const Tolerance(this.value);

  final double value;

  static Tolerance fromString(String color) {
    color = color.toLowerCase();
    for (Tolerance tolerance in Tolerance.values) {
      if (color == tolerance.name) {
        return tolerance;
      }
    }
    throw Exception('exception');
  }
}

extension StringExtension on String {
  Digit toDigit() {
    return Digit.fromString(this);
  }
}
