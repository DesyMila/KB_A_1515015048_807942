domains
number, random, limit = integer
words, type = string
list = char*
facts
nondeterm word(integer, string)
predicates
nondeterm begin				nondeterm credit		nondeterm person(string,string)
nondeterm rand_int(number,limit)	nondeterm string_list(string, list)
nondeterm printlist(list)		nondeterm bubblesort(list,list)
nondeterm swap(list,list)		nondeterm game(integer)
nondeterm game1_stat(integer,integer,integer,integer,integer,integer)
nondeterm game2_stat(integer,integer,string,string)

clauses
% --- Credit --- %
person("M. HILMY ADY S.","[1415015058]").	person("SATRIA YUDHI S.","[1415015062]").
person("ALI HUSNI","[1415015156]").		person("ABU RIJAL","[1415015159]").
person("AN WAHID","[1415015169]").		person("FANDI ALIEF A","[1415015178]").

credit 	:-	write("==========================="), nl, person(Y,Z),
		write(Y,"\t",Z,"\n------------------------------------------------------"), nl, fail.

% --- BEGIN --- %
begin	:-	write("\n\n--> Guess Your Number <--\n1. Easy (15 tries)\n2. Medium (10 tries)\n3. Hard (5 tries)"),
		write("\n\n--> Guess Your Word <--\n4. Easy (Life: 9)\n5. Medium (Life: 6)\n6. Hard (Life: 3)"),
		write("\n\n--> Information <--\n7. How to Play\n8. Credits\n\nInput the given menu! (Any other input means Exit)\n"),
		readint(Chosen),game(Chosen).

% --- GAME 1 PACKAGE --- %
game1_stat(_,1,_,_,Ans,RightNum)	:- Ans<>Rightnum,write("Crap, You lose, the right number is ",RightNum),nl,nl,nl.
game1_stat(Chance,Rem,X,Y,Ans,RightNum)	:-
Ans=RightNum, Try=Chance-Rem, Score=320-20*Try,
nl,write("Perfect, ",RightNum," is the Right Number. Success in ",Try," tries. Congratulation for achieving the goal!\nYour Score is ",Score),nl,nl,nl;

Ans<=X,
	nl,write("It's out of boundary, Baby"), nl,write("The Number is between ",X," and ",Y),nl,write("You still have ",Rem," more chance, Guess the right number: "), nl,
	readint(Answer),	game1_stat(Chance,Rem,X,Y,Answer,RightNum);

Ans>=Y,
	nl,write("It's out of boundary, Baby"), nl,write("The Number is between ",X," and ",Y),nl,write("You still have ",Rem," more chance, Guess the right number: "), nl,
	readint(Answer),	game1_stat(Chance,Rem,X,Y,Answer,RightNum);

Ans>X, Ans<RightNum, NX=Ans, Remain=Rem-1,
	nl,write("The Number is between ",NX," and ",Y),nl,write("You still have ",Remain," more chance, Guess the right number: "), nl,
	readint(Answer),	game1_stat(Chance,Remain,NX,Y,Answer,RightNum);

Ans<Y, Ans>RightNum, NY=Ans, Remain=Rem-1,
	nl,write("The Number is between ",X," and ",NY),nl,write("You still have ",Remain," more chance, Guess the right number: "), nl,
	readint(Answer),	game1_stat(Chance,Remain,X,NY,Answer,RightNum).


% --- GAME 2 PACKAGE --- %

% --- Random Number Generator, Using Real multiplied by Max-Option plus One --- %
rand_int(Result,Max)	:-	random(Real), Result=Real*Max+1.
% --- String to List Converter --- %
string_list("",[])		:-	!.
string_list(String, [Head|Tail]):-	frontchar(String,Head,String1),	string_list(String1,Tail).
% --- Bubble sort used in scrambling letters --- %
bubblesort(InputList,SortList) :-	swap(InputList,List), ! ,bubblesort(List,SortList).

bubblesort(SortList,SortList).

% --- Swapping elements --- %
swap([X,Y|List],[Y,X|List])	:-	X > Y.
swap([Z|List],[Z|List1]) 	:-	swap(List,List1).

% --- Printing list elements after sorting--- %
printlist([])		:-	nl.
printlist([Head|List])	:-	write(Head, " "),	printlist(List).

game2_stat(1,Count,Ans,Word)	:-	Ans<>Word, !, write("It's Incorrect, The Correct Word is ",Word), Score=Count*10, nl,nl,nl,write("Game Over, Your Score is ",Score),nl,nl,nl.
game2_stat(Life,Count,Ans,Word)	:-
Ans<>Word, Lifes=Life-1,
	write("It's Incorrect, The Correct Word is ",Word),nl,
	rand_int(RandInt,269), word(RandInt,Words), Score=Count*10,
	nl,write("Score: ",Score,"\n",Lifes," Life(s) Remaining\nCome on, try again!\n"),
	string_list(Words,WordsList), bubblesort(Wordslist,Scrambled), printlist(Scrambled),
	nl,write("Guess the word: "),
	readln(Answer), game2_stat(Lifes,Count,Answer,Words);

Ans=Word, Counts=Count+1, rand_int(RandInt,269), word(RandInt,Words), Score=Counts*10,
	nl,write("Score: ",Score,"\n",Life," Life(s) Remaining\nGood, try this one!\n"),
	string_list(Words,WordsList), bubblesort(Wordslist,Scrambled), printlist(Scrambled),
	nl,write("Guess the word: "),
	readln(Answer), game2_stat(Life,Counts,Answer,Words).

% --- Simple Single Switch Case --- %
game(X):-
X>=1, X<=3, rand_int(RandInt,1000), Chances=20-X*5,
	nl,nl, write("The Number is between 1 and 1000\n"), write("You  have ",Chances," chances, Guess the right number: "),
	readint(Ans), game1_stat(Chances,Chances,1,1000,Ans,RandInt),
	write("Try another game?\n[Y/N]"),nl,
	readchar(Another), Another='y',begin;

X>=4, X<=6, Lifes=12-3*(X-3), rand_int(RandInt,269), word(RandInt,Words), string_list(Words,WordsList), bubblesort(Wordslist,Scrambled),
	nl,write(Lifes," Life(s) Remaining\nCome try this one first!\n"),
	printlist(Scrambled), nl,write("Guess the word: "),
	readln(Answer), game2_stat(Lifes,0,Answer,Words),
	write("Try another game?\n[Y/N]"),nl,
	readchar(Another), Another='y', begin;

X=7,
	write("Guess Your Number:\nWith the given information about its range in a limited chance, guess the number generated by our system correctly!"),
	nl,nl,write("Guess Your Word:\nRearrange the scrambled letters into a certain word correctly! (NB: Case-Sensitive)"),
	nl,nl,nl,write("Good Luck My Little Boy!\n"),
	begin;

X=8,
	credit,begin;

X<1,!;

X>7,!.

goal
consult("wordlist.mtr"),
begin.