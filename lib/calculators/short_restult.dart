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
    double pmtB = pmtA * extra;

    // VALUE OF INVESTMENT WITHOUT CONTRIBUTION
    double pv = principle *
        (pow((1 + (dividend / periods)), (periods * timeDeltaInYears)));

    double fva = pv + pmtA;
    double fvb = pv + pmtB;

    double startPrinciple = principle;
    double totalContributions =
        additionalContributions * (periods * timeDeltaInYears);
    double interestAccruedBefore = fvb - startPrinciple - totalContributions;
    double interestAccruedAfter = fva - startPrinciple - totalContributions;

    double roiB = (fvb - (startPrinciple + totalContributions)) /
        (startPrinciple + totalContributions) *
        100;
    double roiA = (fva - (startPrinciple + totalContributions)) /
        (startPrinciple + totalContributions) *
        100;
    double annualizedRoiB = (pow((fvb / (startPrinciple + totalContributions)),
                (1 / timeDeltaInYears)) -
            1) *
        100;
    double annualizedRoiA = (pow((fva / (startPrinciple + totalContributions)),
                (1 / timeDeltaInYears)) -
            1) *
        100;
    double totalGrowthBefore = (fvb - (totalContributions + startPrinciple)) /
        (totalContributions + startPrinciple) *
        100;
    if (beforeAfterVal == 0) {
      return [
        fvb,
        principle,
        totalContributions,
        interestAccruedBefore,
        roiB,
        annualizedRoiA,
        totalGrowthBefore,
        raisedtopower2,
        dividend,
      ];
    } else {
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
    }
  }
}
