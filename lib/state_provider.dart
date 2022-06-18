import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

// double _finalValue = 0.00;
// double _principleAmt = 0.00;
// double _totalContributions = 0.00;
// double _interestAccrued = 0.00;
// double _roi = 0.00;
// double _annualizedRoi = 0.00;
// double _totalGrowth = 0.00;

// double get finalValue => _finalValue;
// double get principleAmt => _principleAmt;
// double get totalContributions => _totalContributions;
// double get interestAccrued => _interestAccrued;
// double get roi => _roi;
// double get annualizedRoi => _annualizedRoi;
// double get totalGrowth => _totalGrowth;

class SeriesProvider extends ChangeNotifier {
  // List<dynamic> principleList = [];
  // List<dynamic> interestList = [];
  // List<dynamic> balanceList = [];
  List<dynamic> startPrincipleList = [];
  List<dynamic> startBalanceList = [];
  List<dynamic> interestList = [];
  List<dynamic> interestAccruedList = [];
  List<dynamic> endPrincipleList = [];
  List<dynamic> endBalanceList = [];
  // List<dynamic> _contributionsAccruedList = [];

  // //! Litt usikker på om jeg trenger å gjøre dette..
  // List<dynamic> get startPrincipleList => _startPrincipleList;
  // List<dynamic> get startBalanceList => _startBalanceList;
  // List<dynamic> get interestList => _interestList;
  // List<dynamic> get interestAccruedList => _interestAccruedList;
  // List<dynamic> get endPrincipleList => _endPrincipleList;
  // List<dynamic> get endBalanceList => _endBalanceList;

  //   // List<dynamic> principleList = [];
  // // List<dynamic> interestList = [];
  // // List<dynamic> balanceList = [];
  // List<dynamic> _startPrincipleList = [];
  // List<dynamic> _startBalanceList = [];
  // List<dynamic> _interestList = [];
  // List<dynamic> _interestAccruedList = [];
  // List<dynamic> _endPrincipleList = [];
  // List<dynamic> _endBalanceList = [];
  // // List<dynamic> _contributionsAccruedList = [];

  // //! Litt usikker på om jeg trenger å gjøre dette..
  // List<dynamic> get startPrincipleList => _startPrincipleList;
  // List<dynamic> get startBalanceList => _startBalanceList;
  // List<dynamic> get interestList => _interestList;
  // List<dynamic> get interestAccruedList => _interestAccruedList;
  // List<dynamic> get endPrincipleList => _endPrincipleList;
  // List<dynamic> get endBalanceList => _endBalanceList;
  // List<dynamic> get contributionsAccruedList => _contributionsAccruedList;

  void appendStartPrincipleList(List item) {
    //* TIL: DATAFRAME
    // startPrincipleList.clear();
    startPrincipleList.add(item);
    notifyListeners();
  }

  void appendStartBalanceList(List item) {
    //* TIL: DATAFRAME
    startBalanceList.clear();
    startBalanceList.add(item);
    notifyListeners();
  }

  void appendInterestList(List item) {
    //* TIL: DATAFRAME
    interestList.clear();
    interestList.add(item);
    notifyListeners();
  }

  void appendInterestAccruedList(List item) {
    //* TIL: DATAFRAME & LINECHART & RESULTS
    interestAccruedList.clear();
    interestAccruedList.add(item);
    notifyListeners();
  }

  void appendEndPrincipleList(List item) {
    //* TIL: DATAFRAME & LINECHART & RESULTS
    endPrincipleList.clear();
    endPrincipleList.add(item);
    notifyListeners();
  }

  void appendEndBalanceList(List item) {
    //* TIL: DATAFRAME & LINECHART & RESULTS
    endBalanceList.clear();
    endBalanceList.add(item);
    notifyListeners();
  }

  // void appendContributionsAccruedList(double item) { //* TIL: DATAFRAME & LINECHART & RESULTS
  //   contributionsAccruedList.clear();
  //   contributionsAccruedList.add(item);
  //   notifyListeners();
  // }

}

class OutputProvider extends ChangeNotifier {
  double _finalValue = 0.00;
  double _principleAmt = 0.00;
  double _totalContributions = 0.00;
  double _interestAccrued = 0.00;
  double _roi = 0.00;
  double _annualizedRoi = 0.00;
  double _totalGrowth = 0.00;

  double get finalValue => _finalValue;
  double get principleAmt => _principleAmt;
  double get totalContributions => _totalContributions;
  double get interestAccrued => _interestAccrued;
  double get roi => _roi;
  double get annualizedRoi => _annualizedRoi;
  double get totalGrowth => _totalGrowth;

  void changeFinalValue(double newValue) {
    _finalValue = newValue;
    notifyListeners();
  }

//*Tror ikke denne blir strengt tatt nødvendig
  void changePrincipleAmt(double newValue) {
    _principleAmt = newValue;
    notifyListeners();
  }

  void changeTotalContributions(double newValue) {
    _totalContributions = newValue;
    notifyListeners();
  }

  void changeInterestAccrued(double newValue) {
    _interestAccrued = newValue;
    notifyListeners();
  }

  void changeRoi(double newValue) {
    _roi = newValue;
    notifyListeners();
  }

  void changeAnnualizedRoi(double newValue) {
    _annualizedRoi = newValue;
    notifyListeners();
  }

  void changeTotalGrowth(double newValue) {
    _totalGrowth = newValue;
    notifyListeners();
  }
}

// class DataFrameProvider extends ChangeNotifier {
//   List<dynamic> dataTableList = [];

//   void addItem(String item) {
//     dataTableList.add(item);
//     notifyListeners();
//   }

//   void appendItems(Map item) {
//     dataTableList.add(item);
//     notifyListeners();
//   }

//   void clearList() {
//     dataTableList.clear();
//     notifyListeners();
//   }
// }

class LineChartProvier extends ChangeNotifier {
  List<dynamic> principleList = [];
  List<dynamic> interestList = [];
  List<dynamic> balanceList = [];

  void appendPrincipleList(double item) {
    principleList.add(item);
    notifyListeners();
  }

  void appendInterestList(double item) {
    interestList.add(item);
    notifyListeners();
  }

  void appendBalanceList(double item) {
    balanceList.add(item);
    notifyListeners();
  }

  void clearLists() {
    principleList.clear();
    interestList.clear();
    balanceList.clear();
    notifyListeners();
  }
}

//* Disse er vel heller ikke så nødvendig
class PieChartProvier extends ChangeNotifier {
  double principleAmt;
  double totalContributions;
  double interestAccrued;

  PieChartProvier({
    this.principleAmt = 0.00,
    this.totalContributions = 0.00,
    this.interestAccrued = 0.00,
  });

  void changePrincipleAmt(double newValue) {
    notifyListeners();
  }

  void changeTotalContributions(double newValue) {
    notifyListeners();
  }

  void changeInterestAccrued(double newValue) {
    notifyListeners();
  }
}


//! ________________________________  OLD CODE  ________________________________

// ALTERNATIVT KAN DU ENDRE ALLE SAMTIDIG
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// class InputProvider extends ChangeNotifier {
//   double principleAmt;
//   double terms;
//   double compoundsPerYear;
//   double annualRate;
//   double monthlyContribution;
//   InputProvider({
//     this.principleAmt = 20000.00,
//     this.terms = 5.00,
//     this.compoundsPerYear = 12.00,
//     this.annualRate = 5.00,
//     this.monthlyContribution = 1000.00,
//   });
//   void changeInput(
//     double newprinciple,
//     double newTerms,
//     double newCompoundsPerYear,
//     double newAnnualRate,
//     double newMonthlyContribution,
//   ) {
//     notifyListeners();
//   }
// }

// class PrincipleProvider extends ChangeNotifier {
//   double _principleAmt = 0.00;
//   double get principleAmt => _principleAmt;
//   // PrincipleProvider({
//   //   this.principleAmt = 0.00,
//   // });
//   void changePrincipleAmt(double newValue) {
//     _principleAmt = newValue;
//     notifyListeners();
//   }
// }
//
// InputProvider({
//   this.principleAmt = 0.00,
//   this.terms = 5.00,
//   this.compoundsPerYear = 12.00,
//   this.annualRate = 5.00,
//   this.monthlyContribution = 1000.00,
// });
