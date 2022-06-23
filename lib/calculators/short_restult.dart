import 'dart:math';

class GetResults {
  resultat(principle, timeDeltaInYears, periods, interestRate,
      additionalContributions, beforeAfterVal) {
    double raisedtopower2 = (periods * timeDeltaInYears);
    double dividend = interestRate / 100;

    // VALUE OF CONTRIBUTION END OF MONTH (AFTER)
    double pmtA = additionalContributions *
        (pow((1 + dividend / periods), (periods * timeDeltaInYears)) - 1) /
        (dividend / periods);

    // VALUE OF CONTRIBUTION BEGINNING OF MONTH (BEFORE)
    double extra = (1 + (dividend / periods));

    // VALUE OF INVESTMENT WITHOUT CONTRIBUTION
    double pv = principle *
        (pow((1 + (dividend / periods)), (periods * timeDeltaInYears)));

    // _____ COMMON ____________________________________________________________
    double startPrinciple = principle;
    double totalContributions =
        additionalContributions * (periods * timeDeltaInYears);

    // _____ BEFORE ____________________________________________________________
    double pmtB = pmtA * extra;
    double fvb = pv + pmtB;
    double interestAccruedBefore = fvb - startPrinciple - totalContributions;
    double roiB = (fvb - (startPrinciple + totalContributions)) /
        (startPrinciple + totalContributions) *
        100;
    double annualizedRoiB = (pow((fvb / (startPrinciple + totalContributions)),
                (1 / timeDeltaInYears)) -
            1) *
        100;

    // _____ AFTER _____________________________________________________________
    double fva = pv + pmtA;
    double interestAccruedAfter = fva - startPrinciple - totalContributions;
    double annualizedRoiA = (pow((fva / (startPrinciple + totalContributions)),
                (1 / timeDeltaInYears)) -
            1) *
        100;
    double roiA = (fva - (startPrinciple + totalContributions)) /
        (startPrinciple + totalContributions) *
        100;

    if (beforeAfterVal == 0) {
      return [
        fva,
        principle,
        totalContributions,
        interestAccruedAfter,
        roiA,
        annualizedRoiB,
        raisedtopower2,
        dividend,
      ];
    } else {
      return [
        fvb,
        principle,
        totalContributions,
        interestAccruedBefore,
        roiB,
        annualizedRoiA,
        raisedtopower2,
        dividend,
      ];
    }
  }
}
