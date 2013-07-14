%% Binary to Decimal and Back Converter
%% Develop a converter to convert a decimal number to binary or a binary number to its decimal equivalent.

-module(bin_dec).

-export([to_bin/1, to_dec/1]).
-compile(export_all).

to_bin(Num) when is_list(Num) -> to_bin(list_to_integer(Num));
to_bin(Num) when is_integer(Num) ->
	next_bin_digit(Num, []).

next_bin_digit(0, Acc) ->
	Acc0 = lists:map(fun(Int) -> integer_to_list(Int) end, Acc),
	string:join(Acc0, "");
next_bin_digit(Num, Acc) ->
	Div = Num/2,
	NextNum = trunc(Div),
	Digit = if
		Div-NextNum == 0 -> 0;
		true -> 1
	end,
	next_bin_digit(NextNum, [Digit|Acc]).

to_dec(Num) when is_list(Num) ->
	NumList = lists:map(fun(Int) -> list_to_integer([Int]) end, Num),
	Fold = fun (Digit, {Exp, Acc}) ->
			{Exp+1, Digit*math:pow(2,Exp)+Acc}
	end,
	{_MaxExp, Acc} = lists:foldr(Fold, {0, 0}, NumList),
	trunc(Acc).
