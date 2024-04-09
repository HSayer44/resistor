import 'package:flutter/material.dart' hide Tolerance;
import 'package:resistor/drop_down_widget.dart';
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

  final resistorList = [];

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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: CheckboxListTile(
                  value: showThirdDigit,
                  title: Text('Five bands'),
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      showThirdDigit = value!;
                    });
                  },
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropDownWidget<Digit>(
                        value: firstDigit,
                        items: digitList(),
                        onChanged: (newValue) {
                          setState(() {
                            firstDigit = newValue!;
                          });
                        },
                        text: 'First Digit'),
                    DropDownWidget<Digit>(
                        value: secondDigit,
                        items: digitList(),
                        onChanged: (newValue) {
                          setState(() {
                            secondDigit = newValue!;
                          });
                        },
                        text: 'Second Digit'),
                    Visibility(
                      visible: showThirdDigit,
                      child: DropDownWidget<Digit>(
                        value: thirdDigit,
                        text: 'Third Digit',
                        items: digitList(),
                        onChanged: (newValue) {
                          setState(() {
                            thirdDigit = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropDownWidget<Multiplier>(
                    value: multiplier,
                    text: 'Multiplier',
                    items: multiplierList(),
                    onChanged: (newValue) {
                      setState(() {
                        multiplier = newValue!;
                      });
                    },
                  ),
                  DropDownWidget<Tolerance>(
                    value: tolerance,
                    text: 'Tolerance',
                    items: toleranceList(),
                    onChanged: (newValue) {
                      setState(() {
                        tolerance = newValue!;
                      });
                    },
                  ),
                ],
              ),
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
                child: Text('Claculate Resistance'),
              ),
              ElevatedButton(
                onPressed: () {},
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

    showThirdDigit ? resistorList.add(resistor5band) : resistorList.add(resistor4band);
  }
}
