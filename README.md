# Investerings_Kalkulator
Investment Calculator - iOS &amp; Android app - Built w/ Flutter (ui, norwegian) &amp; Python (back-end, english).

## Extensive Description

  "Investerings Kalkulator" or "The Investment Calculator" is an mobile app (iOS & Android).
  The front-end (UI) is built with the Flutter framework (Dart), 
  and the back-end is written in Python. 

  Built for a Norwegian userbase, meaning the UI language is set to norwegian, 
  but where the back-end is written in English. 
  Note: More UI-languages might be added in the future
  ___________________________________________________________________________________________

  
  
  ## App tour - Description of the App itself 
  
   The app is a simple calculator based on compound interest, 
   and will be used to calculate specific parameters for an investment plan.
  
The user has to fill in the input form, which contains the six variables:
1. Starting Amount - _How much money will be invested in the beginning of the investment._ 
2. Investment Length - _How many periods (years) the investment should last._
3. Compound - _How often the Contribution & Interest payments will take place each Period._
4. Interest Rate - _How much the value of the investment is expected to grow each period. The calculator will take compounds into account._   
5. Additional Contribution - _Apart from Interest Rate, How much additional money will be added to the investment each compound._
6. Contribution time - _When the Contributions should be payed each compound._

After clicking "Regn Ut" (Calculate) the user will recive an output which consists of:
1. Results summary - _A simple display of the totals; End Balance, Starting Amount, Total Contributions, Total Interest, Growth %._
2. Pie Chart - _Showing a Breakdown of the end-balance; how much is starting-amount, contributions & Interest._
3. Balance Growth Graph - _Showing the growth of timeline three elements; Principal, Interest, Balance._
4. Balance Sheet (Dataframe) - _A table showing the effects of all different factors though-out the investment lifespan._


Note: 
* _Starting Amount + additional contributions makes the principal amount._
* _Principal amount + Interest Rate makes the Balance._

_________________________________________________________________________________________________________________________________________________________________


## Map of datastream: 
*Note: {something} is a class 'something' is a stateProvider*

- {InputForm}                               -data->   'InputProvider'
- {StartButton}        => 'InputProvider'   -data->   'InputCalcProvider'
- {ResultatCalculator}                     <-data-    'InputCalcProvider' 
- {ResultatCalculator}                      -data->    {OutputDisplay} & {PieChartDisplay} 
- ___
- {LineChartDisplay}                       <-data-    'InputCalcProvider' 
- {LineChartDisplay}                        -data->    {GetRows}
- {LineChartDisplay}                       <-data-     {GetRows}
- ___
- {DataFrameDisplay}                       <-data-    'InputCalcProvider' 
- {DataFrameDisplay}      <=> {GetRows}     -data->    {BuildMap} 
- {DataTableMapper}                        <-data-     {BuildMap}
- {DataTableMapper}                         -data->    {DataFrameDisplay}



## Goals for the app:
- [X]  Serverless; the back-end is fully integrated into the app, meaning everything is stored on the users device.
- [X]  Master State management
- [ ]  _placeholder_



## The apps functions:
- No storage; the has no need for storage except for a temporary cache, in regards to backend-frontend-communication.
- API-based; the current build uses API's for backend-frontend-communication.


## Preview
![app1](https://user-images.githubusercontent.com/97392841/174447307-3d41d4a6-eb8b-49ee-a455-3c9cf98ea3fa.JPG)
![app2](https://user-images.githubusercontent.com/97392841/174447309-a7a68c09-f458-49db-ac33-da56cdc43a97.JPG)
![app3](https://user-images.githubusercontent.com/97392841/174447311-b0f45009-66e8-47ca-9666-dbf379f5ed58.JPG)



## TODO:
- [X] FØRSTE STADIET:
  - [X]   Endre      -> {InputDisplay} til å displaye statene fra 'InputCalcProvider' istedet for 'InputProvider'
  - [X]   Endre      -> {StartButton}  til å  sende   statene fra 'InputProvider' til 'InputCalcProvider'
  - [X]   IKKE Endre -> InputForm skal IKKE ENDRES

  - [X]   Endre      -> {InputDisplay} til å {OutputDisplay}
  - [X]   Endre      -> {OutputDisplay} til å displaye statene fra 'OutputProvider' istedet for 'InputCalcProvider'
  - [X]   LEGG TIL   -> {ResultatCalculator} til å regne ut "Results" statene fra 'InputCalcProvider' og sende til 'OutputProvider'
  - [X]   LEGG TIL   -> {PieChartDisplay} til å displaye statene fra 'OutputProvider'

- [X] ANDRE STADIET:
  - ~~-- [ ]   LEGG TIL   -> {DataFrameCalculator} til å regne ut "DataFrameResults" statene fra 'InputCalcProvider' og sende til 'DataFrameProvider'~~
  - ~~-- [ ]   LEGG TIL   -> {DataFrameDisplay} til å Lage et DataTable ut av "DataFrameResults" til 'DataFrameProvider' og displaye det~~
  - ~~-- [ ]   LEGG TIL   -> {LineChart} til å hente ut dataframet fra 'DataFrameProvider', velg ut de radene den trenger, lag LineChart og Display~~
  - ~~-- [ ]   MAYBE      -> {LineChartCalculator} (Om dette blir lettere) til å hente ut dataframet fra 'DataFrameProvider', velg ut de radene den trenger og send videre til   'LineChartProvider'~~
  - ~~-  [ ]   MAYBE      -> {LineChartDisplay} (Om dette blir lettere) til å hente ut data fra 'LineChartProvider', bygg LineChart og Display~~
  - [X]   LEGG TIL   -> {SeriesCalculator} til å regne ut de "Kumulative seriene for parameterne" og sende noen av dem til 'LineChartProvider' og send alle til     'DataFrameProvider'
  - ~~[ ]   LEGG TIL   -> {DataFrameDisplay} til å Lage et DataTable ut i fra statene til 'DataFrameProvider' og display det~~
  - ~~[ ]   MAYBE      -> {LineChartDisplay} til å Lage en LineChart ut i fra statene til 'LineChartProvider' og display det~~
  - [X]   LEGG TIL   -> {DataFrameDisplay} til å Lage et DataTable ut i fra data direkte hentet fra class Getresults(){} 
  - [X]   MAYBE      -> {LineChartDisplay} til å Lage en LineChart ut i fra data direkte hentet fra class Getresults(){} 
  - [X]   Endre      -> {SeriesCalculator}     - [CLASS] Del opp 'SeriesCalculator' til {SeriesCalculatorBefore} og {SeriesCalculatorAfter}
  - ~~- [ ]   ENDRE      -> {ResultatCalculator}   - [CLASS] Del opp 'ResultatCalculator' til {ResultatCalculatorBefore} og {ResultatCalculatorAfter}~~
  - [X]   LEGG TIL   -> {BeforeAfterSwitch}    - [CLASS] en if funksjon som bestemmer hvilken ut av 'SeriesCalculatorBefore' eller 'SeriesCalculatorAfter' skal brukes, etc..


- [X] TREDJE STADIET:
  - [X]   LEGG TIL   -> {BeforeAfterProvider} - [STATE] om skal være State for "Before" og "After"
  - [X]   LEGG TIL   -> {BeforeAfterSwitch}   - [BUTTON_WIDGET] Knapp som setter state til 'BeforeAfterProvider' til "BeforeAfter"
  - [X]   Endre      -> {SeriesCalculator}    legg til en if funksjon i 'SeriesCalculator' som bestemmmer om "BeforeFormelen" eller "AfterFormelen" skal brukes
  - [X]   Endre      -> {ResultatCalculator}  legg til en if funksjon i 'ResultatCalculator' som bestemmmer om "BeforeFormelen" eller "AfterFormelen" skal brukes
 

- [ ] FJERDE STADIET:
  - [ ]   LEGG TIL   -> {Theme} som skal velge mellom to themes "LightMode" og "DarkMode"
  - [ ]   LEGG TIL   -> {ThemeProvider} - [STATE] som skal være State for alle fargene som blir brukt. 
  - [ ]   LEGG TIL   -> {DarkLightSwitch} - [BUTTON_WIDGET] som skal endre på 'ThemeProvider' til å returnere Statene "LightModeTheme" eller "DarkModeTheme"

- [ ] TILLEGG: 
  - [ ]  ENDRE       -> {InputForm}            Til å ikke raise en error når noe annet enn tall blir ført inn. 
  - [ ]  LEGG TIL    -> {IndexSwitch} - [BUTTON] Knapp som bytter mellom Dataframe med enten "terms" som index eller "perioder"
  - [ ]  LEGG TIL    -> {BackToTop} - [BUTTON]   knapp som tar deg tilbake til topp, kanskje en til som tar deg tilbake til toppen av dataframet. 
  - [ ]  ENDRE       -> {BackToTop} - [BUTTON]   Gjerne sørg for at knappen er sticky til skjermen etter du passerer dataframet. 
  - [X]  ENDRE       -> {LineChartDisplay}     Interest line viser feil. 
  - [ ]  ENDRE       -> {LineChartDisplay}     Endre på Y-aksen til å ikke vise det øverste tallet, eller få den til å skalere seg jevnt.  
  - [ ]  ENDRE       -> {LineChartDisplay}     få "on-hover-skiltet" til å displaye utenfor grafens containter.  
  - [ ]  ENDRE       -> {DataFrameDisplay}     Få Kolonnefeltet til å være sticky. 
  - [ ]  ENDRE       -> {DataFrameDisplay}     Endre på paddingen til dataframet slik at indexen vises etter 2 siffere. 
  - [X]  ENDRE       -> {DataFrameDisplay}     Fiks på formelene til - [BEFORE]
  - [X]  Legg TIL    -> {DataFrameDisplay}     Legg til "termin" i index colonnen i dataframet. 
  - [ ]  Legg TIL    -> {DataFrameDisplay}     For "monthly" section iht "IndexSwitch" sett opp et skilt per 12 måned, som sier hvilket år det er.
  - [ ]  ENDRE       -> {TODO.txt}             Oppdatere StateKartet.  
  - [ ]  ENDRE       -> {ResultDisplay}        Legg til nummer formattering 
  - [ ]  ENDRE       -> {InputForm}            Legg til nummer formattering 
  - [ ]  LEGG TIL    -> {googleAd}             Legg til en google ad som er ankret til bunnen av skjermen. 
