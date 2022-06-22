import 'dart:math';

//* ___________ CUMULATIVVE CALCULATOR ______________________________________________
class GetRows {
  resultat(principle, timeDeltaInYears, periods, interestRate,
      additionalContributions, beforeAfterVal) {
    double raisedtopower2 = (periods * timeDeltaInYears);
    double dividend = interestRate / 100;

    List startPrincipleAfter = [principle];
    List startBalanceAfter = [principle];
    List interestAfter = [(principle * (dividend / periods))];
    List interestAccruedAfter = [(principle * (dividend / periods))];
    List endPrincipleAfter = [];
    List endBalanceAfter = [];

    //* _____ FinalValue [AFTER] _____________________________________
    for (var i = 1; i < raisedtopower2 + 1; i++) {
      double fva = (principle * (pow((1 + (dividend / periods)), (i)))) +
          (additionalContributions *
              (pow((1 + dividend / periods), (i)) - 1) /
              (dividend / periods));

      //? ___ End Balance ________
      endBalanceAfter.add(fva);

      //? ___ Start Principle ________
      startPrincipleAfter
          .add(principle + (additionalContributions * i)); //! MULIG OPMVENDT

      //? ___ End Principle ________
      endPrincipleAfter.add(
          principle + (additionalContributions * (i + 1))); //! MULIG OPMVENDT

      //? ___ Interest ________
      interestAfter.add(fva * (dividend / periods));

      //? ___ interest Accrued ________
      interestAccruedAfter
          .add((interestAccruedAfter[i - 1] + (fva * (dividend / periods))));
    }

    //? ___ End Balance ________
    for (var i = 0; i < endBalanceAfter.length - 1; i++) {
      startBalanceAfter.add(endBalanceAfter[i]);
    }

    //* _____ FinalValue [BEFORE] _____________________________________
    List startPrincipleBefore = [];
    List startBalanceBefore = [];
    List interestBefore = [];
    List interestAccruedBefore = [];
    List endPrincipleBefore = [];
    List endBalanceBefore = [];
    for (var i = 1; i < raisedtopower2 + 1; i++) {
      double fvb =
          (principle * (pow((1 + (dividend / periods)), (periods * i)))) +
              ((additionalContributions *
                      (pow((1 + dividend / periods), (periods * i)) - 1) /
                      (dividend / periods)) *
                  (1 + (dividend / periods)));
      endBalanceBefore.add(fvb);
      interestBefore.add(fvb - additionalContributions - principle);
      interestAccruedBefore
          .add(additionalContributions * i); //! WRONG CHECK _interestList
      startPrincipleBefore
          .add(principle + (additionalContributions * i)); //! MULIG OPMVENDT
      endPrincipleBefore.add(
          principle + (additionalContributions * (i + 1))); //! MULIG OPMVENDT
    }
    for (var i = 0; i < endBalanceBefore.length - 1; i++) {
      startBalanceBefore.add(endBalanceBefore[i]);
    }
    //* _____ Return [AFTER OR BEFORE] _________________________________

    if (beforeAfterVal == 0) {
      return [
        startPrincipleAfter,
        startBalanceAfter,
        interestAfter,
        interestAccruedAfter,
        endPrincipleAfter,
        endBalanceAfter,
      ];
    } else {
      return [
        startPrincipleBefore,
        startBalanceBefore,
        interestBefore,
        interestAccruedBefore,
        endPrincipleBefore,
        endBalanceBefore,
      ];
    }
  }
}
