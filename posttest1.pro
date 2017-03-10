predicates
	hewan(symbol,symbol,long) - nondeterm(i,o,o), nondeterm(o,i,o)
	pemilik (symbol)- nondeterm(i)
	nama (symbol) - nondeterm(o),nondeterm(i)
	penitipan(symbol,symbol)-nondeterm(i,i)

clauses
	penitipan(A,B):-
	pemilik(A),nama(B).
	hewan(kucing,anggora,1000000).
	hewan(kucing,persia,3000000).
	hewan(rusa,kutub,5000000).
	hewan(anjing,bulldog,4000000).
	
	pemilik(anggika).
	pemilik(putri).
	pemilik(sari).
	pemilik(ayu).
	
	nama(golf).
	nama(joy).
	nama(manis).
	nama(putih).
goal
hewan(Jenis,anggora,Harga);penitipan(anggika,golf).