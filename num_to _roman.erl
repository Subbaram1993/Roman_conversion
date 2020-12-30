-module(rom).
-export([roman/1,roman/2,rom/1]).

rom(N) when N >= 1000 -> {N-1000, "M"};
rom(N) when N >= 900 -> {N-900, "CM"};
rom(N) when N >= 500 -> {N-500, "D"};
rom(N) when N >= 400 -> {N-400, "CD"};
rom(N) when N >= 100 -> {N-100, "C"};
rom(N) when N >= 90 -> {N-90, "XC"};
rom(N) when N >= 50 -> {N-50, "L"};
rom(N) when N >= 40 -> {N-40, "XL"};
rom(N) when N >= 10 -> {N-10, "X"};
rom(N) when N >= 9 -> {N-9, "IX"};
rom(N) when N >= 5 -> {N-5, "V"};
rom(N) when N >= 4 -> {N-4, "IV"};
rom(N) when N > 0 -> {N-1, "I"}.

roman(N, Acc) ->
  case rom(N) of
    {0, R} ->
      [R | Acc];
    {N2, R} ->
      roman(N2, [R | Acc])
  end.

roman(N) ->
  M = lists:reverse(roman(N, "")),
  io:format("~s~n",[M]).
