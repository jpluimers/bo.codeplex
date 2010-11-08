unit ConcreteCollectionsUnit;

interface

uses
  Generics.Collections;

type
  TListOfInteger = TList<Integer>;
  TListOfString = TList<string>;
  TStringDictionaryOfString = TDictionary<string, string>;
  TIntegerDictionaryOfString = TDictionary<Integer, string>;
  TIntegerStringPair = TPair<Integer, string>;
  TIntegerStringPairList = TList<TIntegerStringPair>;
  TInt64DictionaryOfString = TDictionary<Int64, string>;
  TInt64StringPair = TPair<Int64, string>;
  TInt64StringPairList = TList<TInt64StringPair>;

implementation

end.
