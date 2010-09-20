unit SqlConstsUnit;

interface

const
  // the infamous WHERE (1=1) and WHERE (1=0) trick:
  // http://stackoverflow.com/questions/242822/why-would-someone-use-where-11-and-conditions-in-a-sql-clause
  // http://www.novicksoftware.com/TipsAndTricks/tip-sql-server-where-1-equals-2.htm
  DefaultWhereClause = 'WHERE (1=1)';
  DefaultOrderByClause = 'ORDER BY';

implementation

end.
