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
}
