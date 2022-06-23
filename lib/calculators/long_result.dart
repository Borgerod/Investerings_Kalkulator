import 'dart:math';

//* ___________ CUMULATIVVE CALCULATOR ______________________________________________
class GetRows {
  resultat(principle, timeDeltaInYears, periods, interestRate,
      additionalContributions, beforeAfterVal) {
    double raisedtopower2 = (periods * timeDeltaInYears);
    double dividend = interestRate / 100;

    //* _____ NEW AFTER _____________________________________
    List startPrincipleAfter = [principle];
    List startBalanceAfter = [principle];
    List interestAfter = [(principle * (dividend / periods))];
    List interestAccruedAfter = [(principle * (dividend / periods))];
    List endPrincipleAfter = [principle + (additionalContributions)];
    List endBalanceAfter = [];
// // # PRESENT VALUE OF INVESTMENT
//     double PV = (principle *
//         (pow((1 + (dividend / periods)), (periods * timeDeltaInYears))));

// // # VALUE OF CONTRIBUTION - END OF MONTH (AFTER)
//     double pmt_a = (additionalContributions *
//         (pow((1 + dividend / periods), (periods * timeDeltaInYears)) - 1) /
//         (dividend / periods));
// double FVa = pmt_a + PV;
// # FINAL VALUE AFTER

    for (var i = 1; i < raisedtopower2 + 1; i++) {
      double fva = (additionalContributions *
              (pow((1 + dividend / periods), (i)) - 1) /
              (dividend / periods)) +
          (principle * (pow((1 + (dividend / periods)), (i))));

      //? ___ End Balance ________
      endBalanceAfter.add(fva);

      //? ___ Start Principle ________
      startPrincipleAfter.add(principle + (additionalContributions * i));

      //? ___ End Principle ________
      endPrincipleAfter.add(principle + (additionalContributions * (i + 1)));

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
// double fva = (principle *
    //         (pow((1 + (dividend / periods)), (periods * timeDeltaInYears)))) +
    //     (additionalContributions *
    //         (pow((1 + dividend / periods), (periods * timeDeltaInYears)) - 1) /
    //         (dividend / periods));

    //* _____ NEW BEFORE _____________________________________
    List startPrincipleBefore = [];
    List startBalanceBefore = [principle + (additionalContributions)];
    List interestBefore = [];
    List interestAccruedBefore = [(principle * (dividend / periods))];
    List endPrincipleBefore = [principle + (additionalContributions)];
    List endBalanceBefore = [];
    // double extra = (1 + (dividend / periods));

    for (var i = 1; i < raisedtopower2 + 2; i++) {
      double fvb = (principle * (pow((1 + (dividend / periods)), (i)))) +
          ((additionalContributions *
                  (pow((1 + dividend / periods), (i)) - 1) /
                  (dividend / periods)) *
              (1 + dividend / periods));

      //? ___ End Balance ________
      endBalanceBefore.add(fvb);

      //? ___ Start Principle ________
      startPrincipleBefore.add(principle + (additionalContributions * i));

      //? ___ End Principle ________
      endPrincipleBefore.add(principle + (additionalContributions * (i + 1)));

      //? ___ interest Accrued ________
      interestAccruedBefore
          .add((interestAccruedBefore[i - 1] + (fvb * (dividend / periods))));
    }

    //? ___ End Balance ________
    for (var i = 0; i < endBalanceBefore.length - 1; i++) {
      startBalanceBefore.add(endBalanceBefore[i] + additionalContributions);
    }

    //? ___ Interest ________
    for (var i = 0; i < endBalanceBefore.length - 1; i++) {
      interestBefore.add(endBalanceBefore[i] - startBalanceBefore[i]);
    }

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
