import 'package:resistor/component.dart';

class VoltageSource extends Component {
  final double voltage;
  VoltageSource({required this.voltage});

  @override
  double getResistance() {
    return 0;
  }

  @override
  double getVoltage() {
    return voltage;
  }
}