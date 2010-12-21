unit TestNumber2StringUnit;

interface

uses
  Number2StringUnit,
  AbstractTestNumber2StringUnit;

type
  TestTEnglishNumber2DecimalString = class(TAbstractTestTNumber2String)
  strict protected
    procedure AddMatches; override;
    function CreateNumber2String: INumber2String; override;
  end;

  TestTDutchNumber2DecimalString = class(TAbstractTestTNumber2String)
  strict protected
    procedure AddMatches; override;
    function CreateNumber2String: INumber2String; override;
  end;

  TestTGermanNumber2DecimalString = class(TAbstractTestTNumber2String)
  strict protected
    procedure AddMatches; override;
    function CreateNumber2String: INumber2String; override;
  end;

implementation

uses
  TestFramework;

procedure TestTEnglishNumber2DecimalString.AddMatches;
begin
  AddMatch(TAbstractNumber2DecimalString.Zero, 'zero');
  AddMatch(20000000000, 'twenty billions');
  // (2 * 10^11)
  // from Roman:
  AddMatch(0, 'zero');
  AddMatch(1, 'one');
  AddMatch(2, 'two');
  AddMatch(3, 'three');
  AddMatch(4, 'four');
  AddMatch(5, 'five');
  AddMatch(6, 'six');
  AddMatch(7, 'seven');
  AddMatch(8, 'eight');
  AddMatch(9, 'nine');
  AddMatch(10, 'ten');
  AddMatch(11, 'eleven');
  AddMatch(12, 'twelve');
  AddMatch(13, 'thirteen');
  AddMatch(14, 'fourteen');
  AddMatch(15, 'fifteen');
  AddMatch(16, 'sixteen');
  AddMatch(17, 'seventeen');
  AddMatch(18, 'eighteen');
  AddMatch(19, 'nineteen');
  AddMatch(20, 'twenty');
  AddMatch(21, 'twenty one');
  AddMatch(25, 'twenty five');
  AddMatch(30, 'thirty');
  AddMatch(35, 'thirty five');
  AddMatch(40, 'forty');
  AddMatch(45, 'forty five');
  AddMatch(49, 'forty nine');
  AddMatch(50, 'fifty');
  AddMatch(60, 'sixty');
  AddMatch(69, 'sixty nine');
  AddMatch(70, 'seventy');
  AddMatch(76, 'seventy six');
  AddMatch(80, 'eighty');
  AddMatch(90, 'ninety');
  AddMatch(99, 'ninety nine');
  AddMatch(100, 'one hundred');
  AddMatch(110, 'one hundred ten');
  AddMatch(150, 'one hundred fifty');
  AddMatch(200, 'two hundred');
  AddMatch(300, 'three hundred');
  AddMatch(400, 'four hundred');
  AddMatch(499, 'four hundred ninety nine');
  AddMatch(500, 'five hundred');
  AddMatch(600, 'six hundred');
  AddMatch(666, 'six hundred sixty six');
  AddMatch(700, 'seven hundred');
  AddMatch(800, 'eight hundred');
  AddMatch(900, 'nine hundred');
  AddMatch(999, 'nine hundred ninety nine');
  AddMatch(1000, 'one thousand');
  AddMatch(1444, 'one thousand four hundred forty four');
  AddMatch(1666, 'one thousand six hundred sixty six');
  AddMatch(1990, 'one thousand nine hundred ninety');
  AddMatch(1999, 'one thousand nine hundred ninety nine');
  AddMatch(2000, 'two thousand');
  AddMatch(2001, 'two thousand one');
  AddMatch(2010, 'two thousand ten');
  AddMatch(2012, 'two thousand twelve');
  AddMatch(2500, 'two thousand five hundred');
  AddMatch(3000, 'three thousand');
  AddMatch(3888, 'three thousand eight hundred eighty eight');
  AddMatch(3999, 'three thousand nine hundred ninety nine');
  AddMatch(4000, 'four thousand');
  AddMatch(5000, 'five thousand');
  AddMatch(6666, 'six thousand six hundred sixty six');
  AddMatch(10000, 'ten thousand');
  AddMatch(50000, 'fifty thousand');
  AddMatch(100000, 'one hundred thousand');
  AddMatch(500000, 'five hundred thousand');
  AddMatch(1000000, 'one million');
  AddMatch(1444000, 'one million four hundred forty four thousand');
  AddMatch(1666000, 'one million six hundred sixty six thousand');
  AddMatch(2000000, 'two millions');
  AddMatch(3888000, 'three millions eight hundred eighty eight thousand');
  AddMatch(-3888000, 'minus three millions eight hundred eighty eight thousand');
  // http://www.rgagnon.com/javadetails/java-0426.html
  AddMatch(0, 'zero');
  AddMatch(1, 'one');
  AddMatch(16, 'sixteen');
  AddMatch(100, 'one hundred');
  AddMatch(118, 'one hundred eighteen');
  AddMatch(200, 'two hundred');
  AddMatch(219, 'two hundred nineteen');
  AddMatch(800, 'eight hundred');
  AddMatch(801, 'eight hundred one');
  AddMatch(1316, 'one thousand three hundred sixteen');
  AddMatch(1000000, 'one million');
  AddMatch(2000000, 'two millions');
  AddMatch(3000200, 'three millions two hundred');
  AddMatch(700000, 'seven hundred thousand');
  AddMatch(9000000, 'nine millions');
  AddMatch(9001000, 'nine millions one thousand');
  AddMatch(123456789, 'one hundred twenty three millions four hundred fifty six thousand seven hundred eighty nine');
  AddMatch(2147483647, 'two billions one hundred forty seven millions four hundred eighty three thousand six hundred forty seven');
  AddMatch(3000000010, 'three billions ten');
end;

function TestTEnglishNumber2DecimalString.CreateNumber2String: INumber2String;
begin
  Result := TEnglishNumber2DecimalString.Create;
end;

procedure TestTDutchNumber2DecimalString.AddMatches;
begin
  AddMatch(TAbstractNumber2DecimalString.Zero, 'nul');
  AddMatch(1000, 'duizend');

  AddMatch(20000000000, 'twintig miljard'); // (2 * 10^11)
  // list adapted from Roman.
  // spelling for some numbers: http://nl.wikipedia.org/wiki/Lijst_van_natuurlijke_getallen
  // http://nl.wikipedia.org/wiki/Hoofdtelwoord#Schrijfwijze
  // http://www.onzetaal.nl/advies/getallen.php (leading for 'en')
  // leading: http://taaladvies.net/taal/advies/vraag/1302, http://taaladvies.net/taal/advies/tekst/44, http://woordenlijst.org/leidraad/6/9/, http://taaladvies.net/taal/advies/vraag/1292
  AddMatch(0, 'nul');
  AddMatch(1, 'een');
  AddMatch(2, 'twee');
  AddMatch(3, 'drie');
  AddMatch(4, 'vier');
  AddMatch(5, 'vijf');
  AddMatch(6, 'zes');
  AddMatch(7, 'zeven');
  AddMatch(8, 'acht');
  AddMatch(9, 'negen');
  AddMatch(10, 'tien');
  AddMatch(11, 'elf');
  AddMatch(12, 'twaalf');
  AddMatch(13, 'dertien');
  AddMatch(14, 'veertien');
  AddMatch(15, 'vijftien');
  AddMatch(16, 'zestien');
  AddMatch(17, 'zeventien');
  AddMatch(18, 'achttien');
  AddMatch(19, 'negentien');
  AddMatch(20, 'twintig');
  AddMatch(21, 'eenentwintig');
  AddMatch(25, 'vijfentwintig');
  AddMatch(30, 'dertig');
  AddMatch(35, 'vijfendertig');
  AddMatch(40, 'veertig');
  AddMatch(45, 'vijfenveertig');
  AddMatch(49, 'negenenveertig');
  AddMatch(50, 'vijftig');
  AddMatch(60, 'zestig');
  AddMatch(69, 'negenenzestig');
  AddMatch(70, 'zeventig');
  AddMatch(76, 'zesenzeventig');
  AddMatch(80, 'tachtig');
  AddMatch(90, 'negentig');
  AddMatch(99, 'negenennegentig');
  AddMatch(100, 'honderd');
  AddMatch(110, 'honderdtien');
  AddMatch(150, 'honderdvijftig');
  AddMatch(200, 'tweehonderd');
  AddMatch(300, 'driehonderd');
  AddMatch(400, 'vierhonderd');
  AddMatch(499, 'vierhonderdnegenennegentig');
  AddMatch(500, 'vijfhonderd');
  AddMatch(600, 'zeshonderd');
  AddMatch(666, 'zeshonderdzesenzestig');
  AddMatch(700, 'zevenhonderd');
  AddMatch(800, 'achthonderd');
  AddMatch(900, 'negenhonderd');
  AddMatch(999, 'negenhonderdnegenennegentig');
  AddMatch(1000, 'duizend');
  AddMatch(1444, 'duizend vierhonderdvierenveertig'); //'veertienhonderdvierenveertig'
  AddMatch(1666, 'duizend zeshonderdzesenzestig');
  AddMatch(1990, 'duizend negenhonderdnegentig');
  AddMatch(1999, 'duizend negenhonderdnegenennegentig');
  AddMatch(2000, 'tweeduizend');
  AddMatch(2001, 'tweeduizend een');
  AddMatch(2010, 'tweeduizend tien');
  AddMatch(2012, 'tweeduizend twaalf');
  AddMatch(2500, 'tweeduizend vijfhonderd');
  AddMatch(3000, 'drieduizend');
  AddMatch(3888, 'drieduizend achthonderdachtentachtig');
  AddMatch(3999, 'drieduizend negenhonderdnegenennegentig');
  AddMatch(4000, 'vierduizend');
  AddMatch(5000, 'vijfduizend');
  AddMatch(6666, 'zesduizend zeshonderdzesenzestig');
  AddMatch(10000, 'tienduizend');
  AddMatch(50000, 'vijftigduizend');
  AddMatch(100000, 'honderdduizend');
  AddMatch(500000, 'vijfhonderdduizend');
  AddMatch(1000000, 'een miljoen');
  AddMatch(1444000, 'een miljoen vierhonderdvierenveertigduizend');
  AddMatch(1666000, 'een miljoen zeshonderdzesenzestigduizend');
  AddMatch(2000000, 'twee miljoen');
  AddMatch(3888000, 'drie miljoen achthonderdachtentachtigduizend');
  AddMatch(-3888000, 'min drie miljoen achthonderdachtentachtigduizend');
  // http://www.rgagnon.com/javadetails/java-0426.html
  AddMatch(0, 'nul');
  AddMatch(1, 'een');
  AddMatch(16, 'zestien');
  AddMatch(100, 'honderd');
  AddMatch(118, 'honderdachttien');
  AddMatch(200, 'tweehonderd');
  AddMatch(219, 'tweehonderdnegentien');
  AddMatch(800, 'achthonderd');
  AddMatch(801, 'achthonderdeen');
  AddMatch(1316, 'duizend driehonderdzestien');
  AddMatch(1000000, 'een miljoen');
  AddMatch(2000000, 'twee miljoen');
  AddMatch(3000200, 'drie miljoen tweehonderd');
  AddMatch(700000, 'zevenhonderdduizend');
  AddMatch(9000000, 'negen miljoen');
  AddMatch(9001000, 'negen miljoen duizend');
  AddMatch(123456789, 'honderddrieentwintig miljoen vierhonderdzesenvijftigduizend zevenhonderdnegenentachtig');
  AddMatch(2147483647, 'twee miljard honderdzevenenveertig miljoen vierhonderddrieentachtigduizend zeshonderdzevenenveertig');
  AddMatch(3000000010, 'drie miljard tien');
end;

function TestTDutchNumber2DecimalString.CreateNumber2String: INumber2String;
begin
  Result := TDutchNumber2DecimalString.Create;
end;

procedure TestTGermanNumber2DecimalString.AddMatches;
begin
  AddMatch(TAbstractNumber2DecimalString.Zero, 'null');
  AddMatch(1000, 'tausend');

//  AddMatch(20000000000, 'twintig miljard'); // (2 * 10^11)

  AddMatch(0, 'null');
  AddMatch(1, 'eins');
  AddMatch(2, 'zwei');
  AddMatch(3, 'drei');

  AddMatch(4, 'vier');
  AddMatch(5, 'fünf');
  AddMatch(6, 'sechs');
  AddMatch(7, 'sieben');

  AddMatch(8, 'acht');
  AddMatch(9, 'neun');
  AddMatch(10, 'zehn');
  AddMatch(11, 'elf');

  AddMatch(12, 'zwölf');
  AddMatch(13, 'dreizehn');
  AddMatch(14, 'vierzehn');

  AddMatch(15, 'fünfzehn');
  AddMatch(16, 'sechszehn');
  AddMatch(17, 'siebzehn');

  AddMatch(18, 'achtzehn');
  AddMatch(19, 'neunzehn');
  AddMatch(20, 'zwanzig');

  AddMatch(21, 'einundzwanzig');
  AddMatch(25, 'fünfundzwanzig');
  AddMatch(30, 'dreißig');

  AddMatch(35, 'fünfunddreißig');
  AddMatch(40, 'vierzig');
  AddMatch(45, 'fünfundvierzig');

  AddMatch(49, 'neunundvierzig');
  AddMatch(50, 'fünfzig');
  AddMatch(60, 'sechzig');

  AddMatch(69, 'neunundsechzig');
  AddMatch(70, 'siebzig');
  AddMatch(76, 'sechsundsiebzig');

  AddMatch(80, 'achtzig');
  AddMatch(90, 'neunzig');
  AddMatch(99, 'neunundneunzig');

  AddMatch(100, 'hundert');
  AddMatch(110, 'hundertzehn');
  AddMatch(150, 'hundertfünfzig');

  AddMatch(200, 'zweihundert');
  AddMatch(300, 'dreihundert');
  AddMatch(400, 'vierhundert');

  AddMatch(499, 'vierhundertneunundneunzig');
  AddMatch(500, 'fünfhundert');

  AddMatch(600, 'sechshundert');
  AddMatch(666, 'sechshundertsechsundsechzig');

  AddMatch(700, 'siebenhundert');
  AddMatch(800, 'achthundert');

  AddMatch(900, 'neunhundert');
  AddMatch(999, 'neunhundertneunundneunzig');

  AddMatch(1000, 'tausend');
  AddMatch(1444, 'eintausendvierhundertvierundvierzig'); //'veertienhonderdvierenveertig'
  AddMatch(1666, 'eintausendsechshundertsechsundsechzig');

  AddMatch(1990, 'eintausendneunhundertneunzig');

  AddMatch(1999, 'eintausendneunhundertneunundneunzig');
  AddMatch(2000, 'zweitausend');

  AddMatch(2001, 'zweitausendeins');
  AddMatch(2010, 'zweitausendzehn');

  AddMatch(2012, 'zweitausendzwölf');
  AddMatch(2500, 'zweitausendfünfhundert');

  AddMatch(3000, 'dreitausend');
  AddMatch(3888, 'dreitausendachthundertachtundachtzig');

  AddMatch(3999, 'dreitausendneunhundertneunundneunzig');
  AddMatch(4000, 'viertausend');

  AddMatch(5000, 'fünftausend');
  AddMatch(6666, 'sechstausendsechshundertsechsundsechzig');

  AddMatch(10000, 'zehntausend');
  AddMatch(50000, 'fünfzigtausend');

  AddMatch(100000, 'einhunderttausend');
  AddMatch(500000, 'fünfhunderttausend');

  AddMatch(1000000, 'einemillion');
  AddMatch(1444000, 'einemillionvierhundertvierzigtausend');

  AddMatch(1666000, 'einemillionsechshundertsechzigtausend');
  AddMatch(2000000, 'zweimillionen');
  AddMatch(3888000, 'dreimillionenachthundertachtundachtzigtausend');
  AddMatch(-3888000, 'minus dreimillionenachthundertachtundachtzigtausend ');

// http://www.rgagnon.com/javadetails/java-0426.html

  AddMatch(0, 'null');
  AddMatch(1, 'eins');
  AddMatch(16, 'sechszehn');

  AddMatch(100, 'hundert');
  AddMatch(118, 'hundertachtzehn');
  AddMatch(200, 'zweihundert');

  AddMatch(219, 'zweihundertneunzehn');
  AddMatch(800, 'achthundert');

  AddMatch(801, 'achthunderteins');
  AddMatch(1316, 'eintausenddreihundertsechszehn');

  AddMatch(1000000, 'einemillion');
  AddMatch(2000000, 'zweimillionen');

  AddMatch(3000200, 'dreimillionenzweihundert');
  AddMatch(700000, 'siebenhunderttausend');

  AddMatch(9000000, 'neunmillionen');
  AddMatch(9001000, 'neunmillioneneintausend');


  // list adapted from Roman.
  // spelling for some numbers: http://nl.wikipedia.org/wiki/Lijst_van_natuurlijke_getallen
  // http://nl.wikipedia.org/wiki/Hoofdtelwoord#Schrijfwijze
  // http://www.onzetaal.nl/advies/getallen.php (leading for 'en')
  // leading: http://taaladvies.net/taal/advies/vraag/1302, http://taaladvies.net/taal/advies/tekst/44, http://woordenlijst.org/leidraad/6/9/, http://taaladvies.net/taal/advies/vraag/1292
  // http://www.rgagnon.com/javadetails/java-0426.html
  AddMatch(123456789, 'honderddrieentwintig miljoen vierhonderdzesenvijftigduizend zevenhonderdnegenentachtig');
  AddMatch(2147483647, 'twee miljard honderdzevenenveertig miljoen vierhonderddrieentachtigduizend zeshonderdzevenenveertig');
  AddMatch(3000000010, 'drie miljard tien');
end;

function TestTGermanNumber2DecimalString.CreateNumber2String: INumber2String;
begin
  Result := TGermanNumber2DecimalString.Create;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTGermanNumber2DecimalString.Suite);
  RegisterTest(TestTDutchNumber2DecimalString.Suite);
  RegisterTest(TestTEnglishNumber2DecimalString.Suite);

  //RegisterTest(TestTAbstractNumber2DecimalString.Suite);
end.

