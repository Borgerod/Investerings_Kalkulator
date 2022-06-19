import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputProvider extends ChangeNotifier {
  double _principleAmt = 20000.00;
  double _terms = 10.00;
  double _compoundsPerYear = 12.00;
  double _annualRate = 6.00;
  double _monthlyContribution = 100.00;

  double get principleAmt => _principleAmt;
  double get terms => _terms;
  double get compoundsPerYear => _compoundsPerYear;
  double get annualRate => _annualRate;
  double get monthlyContribution => _monthlyContribution;

  void changePrincipleAmt(double newValue) {
    _principleAmt = newValue;
    notifyListeners();
  }

  void changeTerms(double newValue) {
    _terms = newValue;
    notifyListeners();
  }

  void changeCompoundsPerYear(double newValue) {
    _compoundsPerYear = newValue;
    notifyListeners();
  }

  void changeAnnualRate(double newValue) {
    _annualRate = newValue;
    notifyListeners();
  }

  void changeMonthlyContribution(double newValue) {
    _monthlyContribution = newValue;
    notifyListeners();
  }
}

class InputCalcProvider extends ChangeNotifier {
  double _principleAmt = 20000.00;
  double _terms = 10.00;
  double _compoundsPerYear = 12.00;
  double _annualRate = 6.00;
  double _monthlyContribution = 100.00;

  double get principleAmt => _principleAmt;
  double get terms => _terms;
  double get compoundsPerYear => _compoundsPerYear;
  double get annualRate => _annualRate;
  double get monthlyContribution => _monthlyContribution;

  void changePrincipleAmt(double newValue) {
    _principleAmt = newValue;
    notifyListeners();
  }

  void changeTerms(double newValue) {
    _terms = newValue;
    notifyListeners();
  }

  void changeCompoundsPerYear(double newValue) {
    _compoundsPerYear = newValue;
    notifyListeners();
  }

  void changeAnnualRate(double newValue) {
    _annualRate = newValue;
    notifyListeners();
  }

  void changeMonthlyContribution(double newValue) {
    _monthlyContribution = newValue;
    notifyListeners();
  }
}

class BeforeAfterProvider extends ChangeNotifier {
  // 0 = før
  // 1 = etter
  int _groupValue = 0;

  void setButtonState(int groupValue) {
    _groupValue = groupValue;
    notifyListeners();
  }

  int get buttondata {
    return _groupValue;
  }
}
