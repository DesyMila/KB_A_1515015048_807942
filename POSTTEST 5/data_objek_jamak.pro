DOMAINS
orang = orang(nama,alamat)/*pendeklarasian data object orang dengan functor orang*/
nama = nama(pertama,kedua)/*pendeklarasian data objek nama denga functor nama*/
alamat = alamat(jalan,kota_kab,propinsi)/*pendeklarasian data objek alamat dengan functor alamat*/
jalan = jalan(nama_jalan,nomor)/*pendeklarasian data objek jalan dengan functor jalan*/
kota_kab,propinsi,nama_jalan = string/*pendeklarasian tipe data string untuk kot_kab,propinsi,nama_jalan*/
pertama,kedua = symbol/*tipe data simbol*/
nomor = integer/*tipe data integer*/

GOAL
P1 = orang(nama(diena,fatihah),alamat(jalan("Wijaya Kusuma", 12), "Berbah", "DIY")),/*P1 adalah orang(nama(diena,fatihah),alamat(jalan("Wijaya Kusuma", 12) dan */
P1 = orang(nama(_,fatihah),Alamat),/*P2 adalah orag dengan nama kedua fatiha dan alamat yang sama dengan alamat P1 */
P2 = orang(nama(nur,fatihah),Alamat),/**/
write("P1=",P1),nl,/*menuliskan identitas dari P1*/
write("P2=",P2),nl./*menuliskan identitas dari P2*/