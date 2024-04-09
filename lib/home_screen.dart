import 'package:flutter/material.dart' hide Tolerance;
import 'package:resistor_package/resistor_package.dart';
import 'lists.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstDigit = 'black';
  String secondDigit = 'black';
  String thirdDigit = 'black';
  String multiplier = 'black';
  String tolerance = 'brown';

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
                    Column(
                      children: [
                        Text('First Digit'),
                        DropdownButton(
                          value: firstDigit,
                          items: digitList(),
                          onChanged: (newValue) {
                            setState(() {
                              firstDigit = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Second Digit'),
                        DropdownButton(
                          value: secondDigit,
                          items: digitList(),
                          onChanged: (newValue) {
                            setState(() {
                              secondDigit = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                    Visibility(
                      visible: showThirdDigit,
                      child: Column(
                        children: [
                          Text('Third Digit'),
                          DropdownButton(
                            value: thirdDigit,
                            items: digitList(),
                            onChanged: (newValue) {
                              setState(() {
                                thirdDigit = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Multiplier'),
                      DropdownButton(
                        value: multiplier,
                        items: multiplierList(),
                        onChanged: (newValue) {
                          setState(() {
                            multiplier = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Tolerance'),
                      DropdownButton(
                        borderRadius: BorderRadius.circular(12),
                        value: tolerance,
                        items: multiplierList(),
                        onChanged: (newValue) {
                          setState(() {
                            tolerance = newValue!;
                          });
                        },
                      ),
                    ],
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
              )
            ],
          ),
        ),
      ),
    );
  }

  String claculateResistance() {
    Resistor resistor = Resistor.band4(
      firstDigit: firstDigit.toDigit(),
      secondDigit: secondDigit.toDigit(),
      multiplier: Multiplier.fromString(multiplier),
      tolerance: Tolerance.fromString(tolerance),
    );

    Resistor resistor5band = Resistor.band5(
      firstDigit: firstDigit.toDigit(),
      secondDigit: secondDigit.toDigit(),
      thirdDigit: thirdDigit.toDigit(),
      multiplier: Multiplier.fromString(multiplier),
      tolerance: Tolerance.fromString(tolerance),
    );

    final resistance = showThirdDigit ? '${resistor5band.getResistance()} Ω' : '${resistor.getResistance()} Ω';

    return resistance;
  }
}
