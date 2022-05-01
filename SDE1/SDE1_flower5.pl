/*
SDE1 Spring 2022 Prolog

Flower bed rules:
1) Beds are in a straight line, so each bed has two adjacent beds.  Beds are
numbered 1 .. N, N is at least 4 and should be even. Bed i is adjacent to
beds i-1 and i+1 (except beds 1 and N, of course).
2) Only one bed can have a given type of flower - available flowers are listed
in the flower predicate.
3) Flowers have Name, Size, Wet/Dry, Color.
4) No two adjacent beds can have the same color flower.
5) No two adjacent beds can have flowers whose size is more than one size
difference.  Sizes are small, med and tall so small next to small is fine,
small next to medium is fine, but small next to tall is not.
6) the two outermost beds (1 and N) are dry, the two innermost are wet, the
ones in between (if there are any) can take either.  For example, if there
were 8 beds the layout would be D E E W W E E D where D is dry, E is either,
and W is wet.
*/

flower(daisies, med, wet, yellow).
flower(roses, med, dry, red).
flower(petunias, med, wet, pink).
flower(daffodils, med, wet, yellow).
flower(begonias, tall, wet, white).
flower(snapdragons, tall, dry, red).
flower(marigolds, short, wet, yellow).
flower(gardenias, med, wet, red).
flower(gladiolas, tall, wet, red).
flower(bird_of_paradise, tall, wet, white).
flower(lilies, short, dry, white).
flower(azalea, med, dry, pink).
flower(buttercup, short, dry, yellow).
flower(poppy, med, dry, red).
flower(crocus, med, dry, orange).
flower(carnation, med, wet, white).
flower(tulip, short, wet, red).
flower(orchid, short, wet, white).
flower(chrysanthemum, tall, dry, pink).
flower(dahlia, med, wet, purple).
flower(geranium, short, dry, red).
flower(lavender, short, dry, purple).
flower(iris, tall, dry, purple).
flower(peonies, short, dry, pink).
flower(periwinkle, med, wet, purple).
flower(sunflower, tall, dry, yellow).
flower(violet, short, dry, purple).
flower(zinnia, short, wet, yellow).

/*
You must write the bedplan() predicate - it binds each argument (which represent
beds) to one of the flowers listed above.  You will almost certainly want to
write a few helper predicates to make the code less redundant and easier to read.
You must have some write goals at the end to show each assigned flower AND its attributes - this will make debugging (and grading) easier.
You are to do this in stages:

1) implement the predicate to simply assign different flowers to the beds.
2) add the color criteria so no adjacent beds have the same color.
3) add the wet criteria - beds 1 and 4 are dry, 2 and 3 are wet.
4) finally add the size criteria.
5) increase to 6 beds.

You should show each of these steps including the code, and the results.  If
there are multiple answers, show this (you don't have to show all if there are
a lot).  In the last step modify the code for a 6 bed layout and demonstrate
that works as well.
*/


sDifference(short, med).
sDifference(tall, med).


size(S1,S2) :-
(sDifference(S1,S2)-> true); (sDifference(S2,S1)-> true); (S1=S2->true);
false.

bedplan(F1,F2,F3,F4) :-
flower(F1,S1,M1,C1), flower(F2,S2,M2,C2), flower(F3,S3,M3,C3), flower(F4,S4,M4,C4),
% validates different flowers
F1\=F2, F1\=F3, F1\=F4, F2\=F3, F2\=F4, F3\=F4,
% validates different colors for adjacent beds
C1\=C2, C2\=C3, C3\=C4,
% validates wet criteria
M1= dry, M2=wet, M3=wet, M4=dry,
% validates the size
size(S1,S2), size(S2,S3), size(S3,S4),

% prints all combinations of flowers
write('flower1 is '), write(F1), write(', '), write(S1), write(', '), write(M1), write(', '), write(C1), nl,
write('flower2 is '), write(F2), write(', '), write(S2), write(', '), write(M2), write(', '), write(C2), nl,
write('flower3 is '), write(F3), write(', '), write(S3), write(', '), write(M3), write(', '), write(C3), nl,
write('flower4 is '), write(F4), write(', '), write(S4), write(', '), write(M4), write(', '), write(C4), nl.


bedplan(F1,F2,F3,F4,F5,F6) :-
flower(F1,S1,M1,C1), flower(F2,S2,M2,C2), flower(F3,S3,M3,C3), flower(F4,S4,M4,C4),flower(F5,S5,M5,C5),flower(F6,S6,M6,C6),
% validates different flowers
F1\=F2, F1\=F3, F1\=F4, F2\=F3, F2\=F4, F3\=F4, F1\=F5, F1\=F6, F2\=F5, F2\=F6, F3\=F5, F3\=F6, F4\=F5, F4\=F6, F5\=F6,
% validates different colors for adjacent beds
C1\=C2, C2\=C3, C3\=C4, C4\=C5, C5\=C6,
% validates wet criteria
M1= dry, M3=wet, M4=wet, M6=dry,
% validates the size
size(S1,S2), size(S2,S3), size(S3,S4), size(S4,S5), size(S5,S6),
% prints all combinations of flowers
write('flower1 is '), write(F1), write(', '), write(S1), write(', '), write(M1), write(', '), write(C1), nl,
write('flower2 is '), write(F2), write(', '), write(S2), write(', '), write(M2), write(', '), write(C2), nl,
write('flower3 is '), write(F3), write(', '), write(S3), write(', '), write(M3), write(', '), write(C3), nl,
write('flower4 is '), write(F4), write(', '), write(S4), write(', '), write(M4), write(', '), write(C4), nl,
write('flower5 is '), write(F5), write(', '), write(S5), write(', '), write(M5), write(', '), write(C5), nl,
write('flower6 is '), write(F6), write(', '), write(S6), write(', '), write(M6), write(', '), write(C6), nl.
/*
You are to work individually on this project.  It will be graded on proper
working, code organization and readability.  This includes comments to explain
what things are and how they work.  Do not wait until the day before it is due
to get started.
*/
