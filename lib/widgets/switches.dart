import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:investerings_kalkulator/utilities/color_variables.dart';
import 'package:investerings_kalkulator/state_provider.dart';

//* ___________ BUTTON CONTAINER _______________________________________________
class ButtonContainer extends StatefulWidget {
  const ButtonContainer({Key key}) : super(key: key);
  @override
  State<ButtonContainer> createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(237, 247, 238, 1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            BeforAfterSwitch(),
            SizedBox(height: 20),
            StartButton(),
          ],
        ));
  }
}

//* ___________ BEFORE/AFTER SWITCH ____________________________________________
class BeforAfterSwitch extends StatefulWidget {
  const BeforAfterSwitch({Key key}) : super(key: key);
  @override
  State<BeforAfterSwitch> createState() => _BeforAfterSwitchState();
}

class _BeforAfterSwitchState extends State<BeforAfterSwitch> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: colorBackground2,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                  'Skal tilleggsbidragene betales før eller etter hver periode?  ',
                  style: TextStyle(color: colorTextblack)),
            )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: CupertinoSlidingSegmentedControl<int>(
                backgroundColor: colorLightBackgroundGray,
                thumbColor: colorWhite,
                padding: EdgeInsets.all(2),
                groupValue: groupValue,
                children: {
                  0: buildSegment("før"),
                  1: buildSegment("etter"),
                },
                onValueChanged: (value) {
                  context
                      .read<BeforeAfterProvider>()
                      .setButtonState(groupValue);
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
            ),
          ],
        ));
  }

  Widget buildSegment(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: colorCharcoal),
      ),
    );
  }
}

//* ___________ START BUTTON ___________________________________________________
class StartButton extends StatefulWidget {
  const StartButton({Key key}) : super(key: key);
  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(BuildContext context) {
    double newPrincipleAmt = context.watch<InputProvider>().principleAmt;
    double newTerms = context.watch<InputProvider>().terms;
    double newCompoundsPerYear =
        context.watch<InputProvider>().compoundsPerYear;
    double newAnnualRate = context.watch<InputProvider>().annualRate;
    double newMonthlyContribution =
        context.watch<InputProvider>().monthlyContribution;

    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minWidth: 300,
      height: 50,
      color: colorHazyGreen,
      onPressed: () {
        context.read<InputCalcProvider>().changePrincipleAmt(newPrincipleAmt);
        context.read<InputCalcProvider>().changeTerms(newTerms);
        context
            .read<InputCalcProvider>()
            .changeCompoundsPerYear(newCompoundsPerYear);
        context.read<InputCalcProvider>().changeAnnualRate(newAnnualRate);
        context
            .read<InputCalcProvider>()
            .changeMonthlyContribution(newMonthlyContribution);
      },
      child: Text("Regn Ut", style: TextStyle(color: colorWhite)),
    );
  }
}
