import 'package:bmi_calculator/height_slider.dart';
import 'package:bmi_calculator/result_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BmiCalculator(),
  ));
}

bool gender = false;
int height = 170;
int age = 18;
int weight = 40;

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "BMI CALCULATOR",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      height: 120,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Column(children: [
                        const Center(
                          child: Text(
                            "Gender",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 20),
                          child: Row(children: [
                            const Text(
                              'i\'m',
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Text(
                              'Female',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Switch(
                              trackColor: gender
                                  ? MaterialStateProperty.all(
                                      Colors.blue.shade200)
                                  : MaterialStateProperty.all(
                                      Colors.pink.shade200),
                              activeColor: Colors.white.withOpacity(0.4),
                              inactiveThumbColor: Colors.white.withOpacity(0.4),
                              activeThumbImage:
                                  const AssetImage('assets/male.png'),
                              inactiveThumbImage:
                                  const AssetImage('assets/female.png'),
                              value: gender,
                              onChanged: (value) => setState(() {
                                gender = !gender;
                              }),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text('Male')
                          ]),
                        ),
                      ])),
                ]),
                Row(children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        height: 190,
                        width: 170,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Age',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$age',
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (age > 0) {
                                              age--;
                                            }
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: gender
                                                ? Colors.blue.shade200
                                                : Colors.pink.shade200,
                                            shape: const CircleBorder(),
                                            elevation: 7),
                                        child: const Text('-',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: gender
                                                ? Colors.blue.shade200
                                                : Colors.pink.shade200,
                                            shape: const CircleBorder(),
                                            elevation: 7),
                                        child: const Text('+',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold))),
                                  )
                                ],
                              )
                            ]),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        height: 190,
                        width: 170,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$weight',
                                    style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            if (weight > 0) {
                                              weight--;
                                            }
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: gender
                                                ? Colors.blue.shade200
                                                : Colors.pink.shade200,
                                            shape: const CircleBorder(),
                                            elevation: 7),
                                        child: const Text('-',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: gender
                                                ? Colors.blue.shade200
                                                : Colors.pink.shade200,
                                            shape: const CircleBorder(),
                                            elevation: 7),
                                        child: const Text('+',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold))),
                                  )
                                ],
                              )
                            ]),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        height: 400,
                        width: MediaQuery.of(context).size.width - 240,
                        child: Column(children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Height',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'cm',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 320,
                                  width:
                                      MediaQuery.of(context).size.width - 240,
                                  child: HeightSlider(
                                    numberLineColor: gender
                                        ? Colors.blue.shade200
                                        : Colors.pink.shade200,
                                    sliderCircleColor: gender
                                        ? Colors.blue.shade200
                                        : Colors.pink.shade200,
                                    accentColor: gender
                                        ? Colors.blue.shade200
                                        : Colors.pink.shade200,
                                    primaryColor: gender
                                        ? Colors.blue.shade200
                                        : Colors.pink.shade200,
                                    currentHeightTextColor: gender
                                        ? Colors.blue.shade200
                                        : Colors.pink.shade200,
                                    personImagePath: gender
                                        ? 'assets/male.png'
                                        : 'assets/female.png',
                                    height: height,
                                    onChange: (val) =>
                                        setState(() => height = val),
                                    unit: 'cm',
                                  ))
                            ],
                          )
                        ]),
                      )
                    ],
                  ),
                ]),
                Center(
                    child: SizedBox(
                  height: 70,
                  width: 70,
                  child: ElevatedButton(
                      onPressed: () {
                        showResultDiloug(context, height, weight, age, gender);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: gender
                              ? Colors.blue.shade200
                              : Colors.pink.shade200,
                          shape: const CircleBorder(),
                          elevation: 7),
                      child: Image.asset('assets/heart.png')),
                )),
              ],
            ),
          )),
    );
  }
}
