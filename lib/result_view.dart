import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

showResultDiloug(context, height, weight, age, gender) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ResultView(height, weight, age, gender);
      });
}

class ResultView extends StatefulWidget {
  var weight;
  var height;
  var age;
  var gender;

  ResultView(this.height, this.weight, this.age, this.gender, {super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  dialogContent(BuildContext context) {
    double heightInMeters =
        height / 100; // Convert height from centimeters to meters
    double bmi = weight / (heightInMeters * heightInMeters);
    int bmiResult = bmi.toInt();

    String getBMICategory(double bmi) {
      if (bmi < 18.5) {
        return 'UNDERWEIGHT';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        return 'NORMAL';
      } else if (bmi >= 25 && bmi < 29.9) {
        return 'OVERWEIGHT';
      } else {
        return 'OBESE';
      }
    }

    String bmiCategory = getBMICategory(bmi);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    "Your Result",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    bmiCategory,
                    style: TextStyle(
                        fontSize: 18,
                        color: bmiCategory == 'NORMAL'
                            ? const Color(0xFF00BFA5)
                            : bmiCategory == 'OVERWEIGHT'
                                ? const Color(0xFFFFC400)
                                : bmiCategory == 'UNDERWEIGHT'
                                    ? const Color(0xFFF57C00)
                                    : const Color(0xFFD32F2F)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    '$bmiResult',
                    style: TextStyle(
                        color: bmiCategory == 'NORMAL'
                            ? const Color(0xFF00BFA5)
                            : bmiCategory == 'OVERWEIGHT'
                                ? const Color(0xFFFFC400)
                                : bmiCategory == 'UNDERWEIGHT'
                                    ? const Color(0xFFF57C00)
                                    : const Color(0xFFD32F2F),
                        fontSize: 80,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 15),
                const Center(
                  child: Text(
                    'Normal BMI range:',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ),
                const Center(
                  child: Text(
                    '18.5 - 25kg/m2',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(bmiCategory == 'NORMAL'
                      ? ' Maintain a balanced diet and regular \n             exercise to stay healthy.'
                      : bmiCategory == 'OVERWEIGHT'
                          ? 'Make healthier food choices and engage \n               in regular physical activity.'
                          : bmiCategory == 'UNDERWEIGHT'
                              ? 'Focus on nutrient-dense foods and consult a \n        healthcare professional for guidance.'
                              : 'Seek professional support for a personalized \n                  weight management plan.'),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shape: const StadiumBorder(),
                        backgroundColor: bmiCategory == 'NORMAL'
                            ? const Color(0xFF00BFA5)
                            : bmiCategory == 'OVERWEIGHT'
                                ? const Color(0xFFFFC400)
                                : bmiCategory == 'UNDERWEIGHT'
                                    ? const Color(0xFFF57C00)
                                    : const Color(0xFFD32F2F),
                      ),
                      child: const Text('RE-CALCULATE YOUR BMI')),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.0,
      insetPadding: const EdgeInsets.only(left: 10, right: 10),
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }
}
