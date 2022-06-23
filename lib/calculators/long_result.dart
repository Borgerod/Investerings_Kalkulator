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

<<<<<<< Updated upstream
    //* _____ FinalValue [AFTER] _____________________________________
    // for (var i = 1; i < raisedtopower2 + 1; i++) {
    //   double fva = (principle * (pow((1 + (dividend / periods)), (i)))) +(additionalContributions *(pow((1 + dividend / periods), (i)) - 1) /(dividend / periods));

    for (var i = 1; i < raisedtopower2 + 2; i++) {
      double fva = (additionalContributions *
              (pow((1 + dividend / periods), (i)) - 1) /
              (dividend / periods)) +
          (principle * (pow((1 + (dividend / periods)), (pi))));

      // //? ___ End Balance ________
      // endBalanceAfter.add(fva);

      // //? ___ Start Principle ________
      // startPrincipleAfter
      //     .add(principle + (additionalContributions * i)); //! MULIG OPMVENDT
      // startPrincipleAfter.add(principle + (additionalContributions * i));

      // //? ___ End Principle ________
      // endPrincipleAfter.add(
      //     principle + (additionalContributions * (i + 1))); //! MULIG OPMVENDT
      // endPrincipleAfter.add(principle + (additionalContributions * (i + 1)));

      // //? ___ Interest ________
      // interestAfter.add(fva * (dividend / periods));

      // for (var i = 0; i < endBalanceAfter.length - 1; i++) {
      //   startBalanceAfter.add(endBalanceAfter[i]);
      // }
=======
    for (var i = 1; i < raisedtopower2 + 1; i++) {
      double fva = (additionalContributions *
              (pow((1 + dividend / periods), (i)) - 1) /
              (dividend / periods)) +
          (principle * (pow((1 + (dividend / periods)), (i))));
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
    // List startBalanceBefore = [];
    List interestBefore = [];
    // List interestAccruedBefore = [];
    List endPrincipleBefore = [];
    List endBalanceBefore = [];

    // List startPrincipleBefore = [principle];
    List startBalanceBefore = [principle];
    // List interestBefore = [(principle * (dividend / periods))];
    List interestAccruedBefore = [(principle * (dividend / periods))];
    // List endPrincipleBefore = [];
    // List endBalanceBefore = [];

    double extra = (1 + (dividend / periods));
=======
    List startBalanceBefore = [principle + (additionalContributions)];
    List interestBefore = [];
    List interestAccruedBefore = [(principle * (dividend / periods))];
    List endPrincipleBefore = [principle + (additionalContributions)];
    List endBalanceBefore = [];
    // double extra = (1 + (dividend / periods));

>>>>>>> Stashed changes
    for (var i = 1; i < raisedtopower2 + 2; i++) {
      double fvb = (principle * (pow((1 + (dividend / periods)), (i)))) +
          ((additionalContributions *
                  (pow((1 + dividend / periods), (i)) - 1) /
<<<<<<< Updated upstream
                  (dividend / periods)) +
              extra);
      //   endBalanceBefore.add(fvb);
      //   interestBefore.add(fvb - additionalContributions - principle);
      //   interestAccruedBefore
      //       .add(additionalContributions * i); //! WRONG CHECK _interestList
      //   startPrincipleBefore
      //       .add(principle + (additionalContributions * i)); //! MULIG OPMVENDT
      //   endPrincipleBefore.add(
      //       principle + (additionalContributions * (i + 1))); //! MULIG OPMVENDT
      // }
      // for (var i = 0; i < endBalanceBefore.length - 1; i++) {
      //   startBalanceBefore.add(endBalanceBefore[i]);
      // }
=======
                  (dividend / periods)) *
              (1 + dividend / periods));
>>>>>>> Stashed changes

      //? ___ End Balance ________
      endBalanceBefore.add(fvb);

      //? ___ Start Principle ________
<<<<<<< Updated upstream
      startPrincipleBefore
          .add(principle + (additionalContributions * i)); //! MULIG OPMVENDT

      //? ___ End Principle ________
      endPrincipleBefore.add(
          principle + (additionalContributions * (i + 1))); //! MULIG OPMVENDT

      //? ___ Interest ________
      interestBefore.add(fvb * (dividend / periods));
=======
      startPrincipleBefore.add(principle + (additionalContributions * i));

      //? ___ End Principle ________
      endPrincipleBefore.add(principle + (additionalContributions * (i + 1)));
>>>>>>> Stashed changes

      //? ___ interest Accrued ________
      interestAccruedBefore
          .add((interestAccruedBefore[i - 1] + (fvb * (dividend / periods))));
<<<<<<< Updated upstream
    }

    //? ___ End Balance ________
=======
    }

    //? ___ End Balance ________
    for (var i = 0; i < endBalanceBefore.length - 1; i++) {
      startBalanceBefore.add(endBalanceBefore[i] + additionalContributions);
    }

    //? ___ Interest ________
>>>>>>> Stashed changes
    for (var i = 0; i < endBalanceBefore.length - 1; i++) {
      interestBefore.add(endBalanceBefore[i] - startBalanceBefore[i]);
    }
<<<<<<< Updated upstream

    //* _____ Return [AFTER OR BEFORE] _________________________________
=======
>>>>>>> Stashed changes

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
