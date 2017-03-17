PREDICATES
nondeterm dapat_membeli(symbol, symbol) /*predikat memiliki 2 parameter atau argumen dengan tipe data symbol,simbol*/
nondeterm orang(symbol)
nondeterm mobil(symbol) /*memberikan fakta predikat mobil ketika nabti dijalankan dimana prediat mobil memiliki satu parameter degan tipe data symbol */
suka(symbol, symbol) /*memberikan nilai dari sebuah predikat bahwa predikat tersebut memiliki tipe data symbol dn symbol*/
dijual(symbol)

CLAUSES
dapat_membeli(X,Y):- /*X dapat membeli Y jika X adalah orang dan Y adalah Mobil kemudian X menyukai Y dan Y sedang dijual */
orang(X), mobil(Y), suka(X,Y), dijual(Y).
/*pernyataan fakta- fakta dengan menggunakan Variabel X dan Y untuk memanggil nilai dari predikat yang telah ditentukan dan memiliki fakta*/
orang(nur).	orang(yudi).	orang(dian).	orang(heni). /*pemberian fakta dari predikat orang*/
mobil(atoz).	mobil(kijang)./*pemberian nilai atau fakta dengan aturan dari penghubung mobil*/
suka(dian, atoz).	suka(yudi, pecel).
suka(heri, buku).	suka(nur, komputer).
dijual(kijang).		dijual(atoz).	dijual(buku).

GOAL
dapat_membeli(Siapa,Apa)./*dari clauses yang telah ditentukan maka goal yang didapatkan dapat disimpulkan bahwa suiapa yang dapat membeli mobil yaitu, dian karena dian adalah orang dan atos diman dapat diketahui bahwan dian adalah seseorang yang menyukai atoz dan mobil atoz sekarang sedang dijual*/   */
%suka(_,Apa). /* tanda % merupakan simbol dari komentar sehingga fakta tidak bisa dijalankan*/
%suka(Siapa,_).
%dapat_membeli(_,Apa).
%dapat membeli(Siapa,_).