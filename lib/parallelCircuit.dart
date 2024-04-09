import 'package:resistor/component.dart';

class ParallelCircuit extends Component {
  final List<Component> components;

  ParallelCircuit({this.components = const []});

  @override
  double getResistance() {
    double sum = 0;
    for (Component component in components) {
      sum += 1 / (component.getResistance());
    }
    return 1 / sum;
  }

  @override
  double getVoltage() {
    double voltage = 0;
    double currentVoltage = 0;
    for(Component component in components) {
      voltage = component.getVoltage();
      if(voltage > currentVoltage) currentVoltage = voltage;
    }
    return currentVoltage;
  }
}
