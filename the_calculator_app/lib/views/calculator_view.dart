import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_calculator_app/controllers/calculator_controller.dart';

import 'calc_button.dart';

/// we are using the GetX to manage states and routes

class Calculator extends StatelessWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorController calculatorController = Get.put(CalculatorController());

    /// we invoke this function everytime the specific buttons are pressed
    /// it includes the realtime calculation
    UpdateCalculation(String buttonText) {
      // update input text in realtime
      calculatorController.addNumberText(buttonText);
      // update calculation in realtime
      calculatorController.calculateAll();
    }

    /// any changes to the observable variables will
    /// update all Widgets inside `Obx` in this UI/view who is using those observable variables

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text('THE CALCULATOR APP')),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Obx(
                          () => Text(
                            '${calculatorController.calculatorModel.inputText}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              // Calculator display
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(
                        () => Text(
                          '${calculatorController.calculatorModel.displayText}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 100,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    btnText: '',
                    btnColor: Colors.transparent,
                    txtColor: Colors.transparent,
                    onPress: () {},
                  ),
                  CalcButton(
                    btnText: 'AC',
                    btnColor: Colors.grey,
                    txtColor: Colors.black,
                    onPress: () {
                      calculatorController.clearAll();
                    },
                  ),
                  CalcButton(
                    btnText: '+/-',
                    btnColor: Colors.grey,
                    txtColor: Colors.black,
                    onPress: () {
                      calculatorController.addPreOperator();
                    },
                  ),
                  CalcButton(
                    btnText: '/',
                    btnColor: Colors.orange.shade700,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('/');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    btnText: '7',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('7');
                    },
                  ),
                  CalcButton(
                    btnText: '8',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('8');
                    },
                  ),
                  CalcButton(
                    btnText: '9',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('9');
                    },
                  ),
                  CalcButton(
                    btnText: 'x',
                    btnColor: Colors.orange.shade700,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('x');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    btnText: '4',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('4');
                    },
                  ),
                  CalcButton(
                    btnText: '5',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('5');
                    },
                  ),
                  CalcButton(
                    btnText: '6',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('6');
                    },
                  ),
                  CalcButton(
                    btnText: '-',
                    btnColor: Colors.orange.shade700,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('-');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    btnText: '1',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('1');
                    },
                  ),
                  CalcButton(
                    btnText: '2',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('2');
                    },
                  ),
                  CalcButton(
                    btnText: '3',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('3');
                    },
                  ),
                  CalcButton(
                    btnText: '+',
                    btnColor: Colors.orange.shade700,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('+');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //this is button Zero
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                    onPressed: () {
                      UpdateCalculation('0');
                    },
                    shape: StadiumBorder(),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    color: Colors.grey[850],
                  ),
                  CalcButton(
                    btnText: '.',
                    btnColor: Colors.grey.shade800,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('.');
                    },
                  ),
                  CalcButton(
                    btnText: '=',
                    btnColor: Colors.orange.shade700,
                    txtColor: Colors.white,
                    onPress: () {
                      UpdateCalculation('=');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
