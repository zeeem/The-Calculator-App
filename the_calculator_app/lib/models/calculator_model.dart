import 'package:get/get.dart';

class CalculatorModel {
  /// we made the values observable so that
  /// we can listen to these values in realtime
  /// and update all the UI elements that is using the updated variable

  var displayText = '0'.obs; //can be int or double
  var inputText = "".obs;
}
