import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:quiver/iterables.dart';
import 'package:investerings_kalkulator/utilities/color_variables.dart';
import 'package:provider/provider.dart';
import 'package:investerings_kalkulator/state_provider.dart';
import 'package:investerings_kalkulator/utilities/custom_box_shadow.dart';
import 'package:investerings_kalkulator/calculators/long_result.dart';

//* ___________ DATAFRAME DISPLAY ______________________________________________
class DataTableDisplay extends StatefulWidget {
  const DataTableDisplay({Key key}) : super(key: key);
  @override
  State<DataTableDisplay> createState() => _DataTableDisplayState();
}

class _DataTableDisplayState extends State<DataTableDisplay> {
  @override
  Widget build(BuildContext context) {
    double principleAmt = context.watch<InputCalcProvider>().principleAmt;
    double timeDeltaInYears = context.watch<InputCalcProvider>().terms;
    double periods = context.watch<InputCalcProvider>().compoundsPerYear;
    double interestRate = context.watch<InputCalcProvider>().annualRate;
    double additionalContributions =
        context.watch<InputCalcProvider>().monthlyContribution;
    int beforeAfterVal = context.watch<BeforeAfterProvider>().buttondata;
    List seriesList = GetRows().resultat(principleAmt, timeDeltaInYears,
        periods, interestRate, additionalContributions, beforeAfterVal);

    return Container(
      decoration: BoxDecoration(
        boxShadow: customBoxShadow(),
        color: colorSection,
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                boxShadow: customBoxShadow(),
                color: colorDarkGreen,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'Kontantstrøm',
                textAlign: TextAlign.center,
                style: TextStyle(color: colorHeadline, fontSize: 30),
              ),
            ),
          ]),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(),
            child: BuildMap()._createDataTable(seriesList),
          ),
        ],
      ),
    );
  }
}

class BuildMap {
  // CREATE DATATABLE (as ScrollView)
  SingleChildScrollView _createDataTable(seriesList) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FittedBox(
                child: DataTable(
                    columnSpacing: 30,
                    horizontalMargin: 10,
                    columns: _createColumns(),
                    rows: _createRows(seriesList)))));
  }

  // COLUMNS for DATATABLE
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: SizedBox(
          width: 50,
          child: Text(
            'termin',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: colorTextblack),
          ),
        ),
      ),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Start prinsipp',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Start Balanse',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Rente',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Løpende Rente',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Slutt Balanse',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
      DataColumn(
          label: SizedBox(
              width: 60,
              child: Text(
                'Slutt Prinsipp',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: colorTextblack),
              ))),
    ];
  }

  List<DataRow> _createRows(seriesList) {
    List datatableList = DataTableMapper().mapBuilder(seriesList);
    return datatableList
        .map((results) => DataRow(cells: [
              DataCell(SizedBox(
                  width: 25,
                  child: Text(
                    results['index'].toString(),
                    style: TextStyle(color: colorTextblack),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ))),
              DataCell(Text(results['startPrinciple'].text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(results['startBalance'].text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(results['interest'].text,
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(results['interestAccrued'].text,
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(results['endBalance'].text,
                  style: TextStyle(color: colorTextblack))),
              DataCell(Text(results['endPrinciple'].text,
                  style: TextStyle(color: colorTextblack))),
            ]))
        .toList();
  }
}

class DataTableMapper {
  mapBuilder(seriesList) {
    List<dynamic> startPrinciple = seriesList[0];
    List<dynamic> startBalance = seriesList[1];
    List<dynamic> interest = seriesList[2];
    List<dynamic> interestAccrued = seriesList[3];
    List<dynamic> endPrinciple = seriesList[4];
    List<dynamic> endBalance = seriesList[5];
    List index = [for (var i = 1; i <= startPrinciple.length; i++) i];

    // REORGANISERING AV DATA STRUKTUREN (COLUMN BASED LIST -> ROW BASED MAP/DICT):
    List datatableList = [];
    for (final i in zip([
      index,
      startPrinciple,
      startBalance,
      interest,
      interestAccrued,
      endBalance,
      endPrinciple,
    ])) {
      var iterationMap = {
        'datatableMap': i,
      };
      // ignore: unused_local_variable
      var startPrinciple = iterationMap['datatableMap'][0];

      final ctrl1 = MoneyMaskedTextController(
          decimalSeparator: ',',
          thousandSeparator: ' ',
          initialValue: iterationMap['datatableMap'][1]);
      final ctrl2 = MoneyMaskedTextController(
          decimalSeparator: ',',
          thousandSeparator: ' ',
          initialValue: iterationMap['datatableMap'][2]);
      final ctrl3 = MoneyMaskedTextController(
          decimalSeparator: ',',
          thousandSeparator: ' ',
          initialValue: iterationMap['datatableMap'][3]);
      final ctrl4 = MoneyMaskedTextController(
          decimalSeparator: ',',
          thousandSeparator: ' ',
          initialValue: iterationMap['datatableMap'][4]);
      final ctrl5 = MoneyMaskedTextController(
          decimalSeparator: ',',
          thousandSeparator: ' ',
          initialValue: iterationMap['datatableMap'][5]);
      final ctrl6 = MoneyMaskedTextController(
          decimalSeparator: ',',
          thousandSeparator: ' ',
          initialValue: iterationMap['datatableMap'][6]);
      var datatableMap = {
        'index': iterationMap['datatableMap'][0],
        'startPrinciple': ctrl1,
        'startBalance': ctrl2,
        'interest': ctrl3,
        'interestAccrued': ctrl4,
        'endBalance': ctrl5,
        'endPrinciple': ctrl6,
      };
      datatableList.add(datatableMap);
    }
    // RETURNING "DATA TABLE LIST" to --> "_createDataTable()"
    return datatableList;
  }
}
