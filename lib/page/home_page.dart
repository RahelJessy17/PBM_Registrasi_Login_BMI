import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  double _bmiResult = 0.0;
  String _resultCategory = "";

  void _calculateBMI() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100.0;
    double bmi = weight / (height * height);
    setState(() {
      _bmiResult = bmi;
      if (bmi < 18.5) {
        _resultCategory = "Underweight";
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        _resultCategory = "Normal";
      } else if (bmi >= 25.0 && bmi <= 29.9) {
        _resultCategory = "Overweight";
      } else {
        _resultCategory = "Obesitas";
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.amber,
      child : SafeArea (
        child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 241, 119),
        body: Container(
          margin: EdgeInsets.only(top: 50, left: 25, right: 25),
          child: Center(
            child: Column(
              children: <Widget> [ 
                Text(" BMI Calculator",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 145, 0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Input Your Name"),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Weight (kg)",
                          hintText: "Input Your Weight (kg)"),
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Height (kg)",
                          hintText: "Input Your Height (cm)"),
                      ),
                      SizedBox(
                        height: 16, 
                        ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 255, 145, 0)),
                          onPressed: _calculateBMI,
                          child: Text("Count Now",
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Name: ${_usernameController.text}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),),
                      SizedBox(height: 16),
                      Text(
                        "Your BMI: ${_bmiResult.toStringAsFixed(1)}",
                        style: TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Category: $_resultCategory",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          ),
                      ),

                    ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                    ],
                  ),
                ),
                // Container(
                //   child: Column(
                //     children: [
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
