import 'package:flutter/material.dart' hide Tolerance;
import 'package:resistor/drop_down_widget.dart';
import 'package:resistor/resitor_config.dart';
import 'package:resistor_package/resistor_package.dart';
import 'lists.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Digit firstDigit = Digit.black;
  Digit secondDigit = Digit.black;
  Digit thirdDigit = Digit.black;
  Multiplier multiplier = Multiplier.black;
  Tolerance tolerance = Tolerance.brown;

  final List<Resistor> resistorList = [];
  Resistor? currentResistor;

  bool showThirdDigit = false;

  TextEditingController resistanceController = TextEditingController();

  @override
  void dispose() {
    resistanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resistor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              ResistorConfig(
                firstDigit: firstDigit,
                secondDigit: secondDigit,
                thirdDigit: thirdDigit,
                multiplier: multiplier,
                tolerance: tolerance,
                showThirdDigit: showThirdDigit,
                onChangedShowThirdDigit: (value) {
                  setState(() {
                    showThirdDigit = value!;
                  });
                },
                onChangedFirstDigit: (newValue) {
                  setState(() {
                    firstDigit = newValue!;
                  });
                },
                onChangedSecondDigit: (newValue) {
                  setState(() {
                    secondDigit = newValue!;
                  });
                },
                onChangedThirdDigit: (newValue) {
                  setState(() {
                    thirdDigit = newValue!;
                  });
                },
                onChangedMultiplier: (newValue) {
                  setState(() {
                    multiplier = newValue!;
                  });
                },
                onChangedTolerance: (newValue) {
                  setState(() {
                    tolerance = newValue!;
                  });
                },
              ),
              SizedBox(height: 20),
              DropDownWidget<Resistor?>(
                  value: currentResistor,
                  items: resistorDropDownList(resistorList),
                  onChanged: (newValue) {
                    setState(() {
                      print(newValue);
                      currentResistor = newValue;
                      resistanceController.clear();
                      if (newValue != null) {
                        updateDropDownsFromResistor(newValue, isFiveBands: newValue.digits.length > 2);
                      }
                    });
                  },
                  text: 'Resistors'),
              SizedBox(height: 20),
              TextField(
                controller: resistanceController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final resistance = claculateResistance();
                  setState(() {
                    resistanceController.text = resistance;
                  });
                },
                child: Text('Calaculate Resistance'),
              ),
              ElevatedButton(
                onPressed: () {
                  final totlaResistance = calculateAllResistances();
                  setState(() {
                    resistanceController.text = totlaResistance;
                  });
                },
                child: Text('Calaculate All Resistances'),
              ),
              ElevatedButton(
                onPressed: () {
                  addResistance();
                },
                child: Text('Add Resistance'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String claculateResistance() {
    Resistor resistor4band = Resistor.band4(
      firstDigit: firstDigit,
      secondDigit: secondDigit,
      multiplier: multiplier,
      tolerance: tolerance,
    );

    Resistor resistor5band = Resistor.band5(
      firstDigit: firstDigit,
      secondDigit: secondDigit,
      thirdDigit: thirdDigit,
      multiplier: multiplier,
      tolerance: tolerance,
    );

    final resistance = showThirdDigit ? '${resistor5band.getResistance()} Ω' : '${resistor4band.getResistance()} Ω';

    return resistance;
  }

  String calculateAllResistances() {
    Circuit circuit = Circuit(
      components: resistorList,
    );
    final totalResistance = circuit.getResistance();
    return '$totalResistance Ω';
  }

  void addResistance() {
    Resistor resistor4band = Resistor.band4(
      firstDigit: firstDigit,
      secondDigit: secondDigit,
      multiplier: multiplier,
      tolerance: tolerance,
    );

    Resistor resistor5band = Resistor.band5(
      firstDigit: firstDigit,
      secondDigit: secondDigit,
      thirdDigit: thirdDigit,
      multiplier: multiplier,
      tolerance: tolerance,
    );

    // print(resistorList);
    setState(() {
      showThirdDigit ? resistorList.add(resistor5band) : resistorList.add(resistor4band);
    });
  }


  void updateDropDownsFromResistor(Resistor? resistor, {required bool isFiveBands}) {
    if (resistor != null) {
      setState(() {
        firstDigit = resistor.digits[0];
        secondDigit = resistor.digits[1];
        if (isFiveBands) {
          thirdDigit = resistor.digits[2];
        }
        multiplier = resistor.multiplier;
        tolerance = resistor.tolerance;
        showThirdDigit = isFiveBands;
      });
    }
  }
}
