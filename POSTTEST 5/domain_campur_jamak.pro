DOMAINS
benda = buku(judul, pengarang) ;/*pendeklarasian dengan domain jamak campuran*/
kuda(nama) ; kapal ;
bukubank(saldo)/*pendeklarasian data objek jamak*/
judul, pengarang, nama = symbol/*pendeklarasian tipe data untuk judul, pengarang, nama yang bertipe data simbol*/
saldo = real/*tipe data real untuk saldo*/
PREDICATES
nondeterm milik(nama,benda)/*predikat nama dengan argumen nama dan benda dam memiliki kemungkinan lebih dari satu fakta*/
CLAUSES
/*Pendeklarasian fakta-fakta mengenai erwin*/
milik(erwin, buku("Markesot Bertutur", "Emha Ainun Najib")).
milik(erwin, kuda(buraq))./**/
milik(erwin, kapal)./**/
milik(erwin, bukubank(1000))./**/
GOAL
milik(erwin, Benda)./*pengeksekusian dari predikat yang ada berdasarkan fakta-fakta yang telah dideklarasikan sebelumnya dimana 
yang dieksekusi adalah erwin memiliki Benda dan variabel benda tersebut akan menampilkan benda apa yang dimiliki erwin */