import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:the_calculator_app/models/calculator_model.dart';

class CalculatorController extends GetxController {
  var calculatorModel = CalculatorModel();
  String lastSavedInput = "";

  List<String> operators = ['/', 'x', '-', '+', '='];

  /// This function runs everytime a button is clicked
  /// it sets and updates the Input text onChange
  /// when two operator pressed one after another it replaces the previous one
  /// initial decimal (.) and operators are skipped
  addNumberText(String buttonText) {
    int n = calculatorModel.inputText.value.length ?? 0;

    // replacing operators in input text field
    if (operators.contains(buttonText)) {
      if (n > 0 &&
          operators.contains(calculatorModel.inputText.value[n - 1].trim())) {
        //replacing operator
        calculatorModel.inputText.value =
            calculatorModel.inputText.value.substring(0, n - 1) + buttonText;
      } else if (n > 0) {
        calculatorModel.inputText.value =
            calculatorModel.inputText.value + buttonText;
      }
    } else {
      if (n > 0 &&
          buttonText == "." &&
          calculatorModel.inputText.value[n - 1] == ".") {
        return;
      }
      calculatorModel.inputText.value =
          calculatorModel.inputText.value + buttonText;
    }
  }

  /// it adds the preOperator (+/-) to any Number
  /// we check if we entered a valid numeric value and add the (-) sign in front of it
  /// when input is more than one number, we check for the last operator used and add (-) to the last number
  // serves the purpose, didn't test it for edge cases
  addPreOperator() {
    if (calculatorModel.inputText.value.length > 0 &&
        isNumeric(calculatorModel.inputText.value) &&
        !operators.contains(calculatorModel.inputText.value)) {
      calculatorModel.inputText.value = "-${calculatorModel.inputText.value}";
      return;
    }

    for (int i = calculatorModel.inputText.value.length - 1; i > 0; i--) {
      if (!isNumeric(calculatorModel.inputText.value[i])) {
        calculatorModel.inputText.value =
            calculatorModel.inputText.value.substring(0, i + 1) +
                "-${calculatorModel.inputText.value.substring(i + 1)}";
        break;
      }
    }

    // updating realtime calculation displayText
    calculateAll();
  }

  // clears/resets all values to default
  clearAll() {
    calculatorModel.displayText.value = '0';
    calculatorModel.inputText.value = "";
  }

  /// it calculates the full input text
  /// we dont start realtime calculation unless there is at least 3cahrs (considering the lowest math eqn as 1+1)
  /// we aslo dont calculate if the last char of the inputText is a operator (exception for = sign)
  /// we first change the (x) to (*) sign and then convert it to a math expression for calculation
  /// if EqyalButton is pressed we clear the inputText and replace it with the final answer to use it in new Calculation
  calculateAll() {
    bool equalBtnPressed = false;
    var calc = calculatorModel.inputText.value; //final user input

    if (calc.length < 3) {
      //waiting for at least 3 digit input
      return;
    }

    if (operators.contains(calc[calc.length - 1]) &&
        calc[calc.length - 1] != "=") {
      return;
    } else if (calc[calc.length - 1] == "=") {
      equalBtnPressed = true;
      calc = calc.substring(0, calc.length - 1);
    }

    var finaluserinput = calc.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);
    var res = eval.toString().split('.');
    calculatorModel.displayText.value = res.length > 1 && int.parse(res[1]) > 0
        ? eval.toString()
        : res[0].toString();

    if (equalBtnPressed) {
      calculatorModel.inputText.value = calculatorModel.displayText.value;
    }
  }

  // helper function to check if a string is a numeric value
  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }
}
