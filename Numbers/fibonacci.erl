%% Fibonacci Sequence
%% Enter a number and have the program generate the Fibonacci sequence to that number or to the Nth number.

-module(fibonacci).

-export([fib/1, fib_seq/1]).

fib(N) when is_integer(N) ->
	lists:nth(N+1, fib_seq(N)).

fib_seq(N) ->
	fib_seq(N, [0, 1]).
fib_seq(N, Acc) when length(Acc)-1 >= N ->
	Acc;
fib_seq(N, Acc) when length(Acc)-1 <  N ->
	LastTwo = lists:sublist(Acc, length(Acc)-1, 2),
	NextFib = lists:sum(LastTwo),
	Acc0 = lists:append(Acc, [NextFib]),
	fib_seq(N, Acc0).
