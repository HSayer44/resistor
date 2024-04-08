import 'package:resistor/component.dart';

class Circuit extends Component {

  final List<Component> components;

  Circuit({this.components = const []});

  @override
  double getResistance() {
    double sum = 0;
    for(Component component in components){
      sum += component.getResistance();
    }
    return sum;

  }

  @override
  double getVoltage() {
    double sum = 0;
    for(Component component in components){
      sum += component.getVoltage();
    }
    return sum;
  }
}