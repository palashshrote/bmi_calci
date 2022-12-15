import 'dart:math';

class calculatorBrain{
  calculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25)  return "Overweight";
    else if(_bmi >= 18.5)  return "Normal";
    else return "Under-weight";
  }

  String getInterpretation(){
    if(_bmi >= 25)  return "Exercise more!";
    else if(_bmi >= 18.5)  return "Keep it up";
    else return "Build muscles";
  }
}