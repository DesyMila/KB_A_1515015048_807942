predicates
nondeterm anak(symbol,symbol)
nondeterm istri(symbol,symbol)
nondeterm pria(symbol)
nondeterm wanita(symbol)
nondeterm usia(symbol,integer)
nondeterm ibu(symbol,symbol)
nondeterm kakek(symbol,symbol)
nondeterm cucu(symbol,symbol)
nondeterm ayah(symbol,symbol)
nondeterm adik(symbol,symbol)
clauses
anak (jhon, james).
anak (james, peter).
anak (sue, ann).
istri (mary, peter).
istri (ann, james).
pria(jhon).
pria (james).
pria (peter).
wanita (mary).
wanita(sue).
wanita(ann).
usia(jhon, 10).
usia(sue, 13).
ayah(Ayah,Anak):-anak(Anak,Ayah).
cucu(A,B):-anak(A,C),anak(C,B).
cucu(A,B):-anak(A,C),istri(C,D),anak(D,B).
kakek(A,B):-anak(B,C),anak(C,A).
ibu(C,B):-istri(C,A), wanita(C),anak(B,A).
adik(A,B):-usia(A,C),usia(B,D),C<D.


goal
adik(A,B).