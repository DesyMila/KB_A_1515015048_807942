/*****************************************************************************

		Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH07E03.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

domains
  list = integer* /* pembuatan list dengan nama list dengan tipe data integer */

predicates
  length_of(list,integer,integer) - procedure (i,o,i)/*pembuatan predikat dengan nama length_of dengan parameter list, integer, integer dan merupakan procedure dengan input,output dan input*/

clauses
  length_of([], Result, Result)./*fakta length_of dengan isi list kosong, dan variabel Result,Result*/
  length_of([_|T],Result,Counter):-/*aturan length_of dengan list anonivariabel untuk head dan variabel T untuk tail dan Result, dan Couter hanya jika NewCounter merupakan Counter ditambah satu dan 
  length_of memiliki list dengan variabel T, Result, dan NewCouter.
  */
	NewCounter = Counter + 1,
	length_of(T, Result, NewCounter).

goal
  length_of([1,2,3],L,0). /*hasil dari clausa yang ada dengan list 1 sampai 3 dan melakukan lacak balik untuk menghitung hasil dari Counter dari 0 sampai dengan panjang length_of*/