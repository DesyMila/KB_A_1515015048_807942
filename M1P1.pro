PREDICATES
putra(STRING,STRING)/*predikat dengan nama putra dan tipe data dari argumen yaitu string*/
saudara_perempuan(STRING,STRING)/*predikat dengan nama saudara perempuan dan tipe data dari argumen yaitu string*/
saudara_laki(STRING,STRING)/*predikat dengan nama saudar laki dan tipe data dari argumen yaitu string*/
menikah(STRING,STRING)/*predikat dengan nama menikah dan tipe data dari argumen yaitu string*/
ayah(STRING ayah,STRING putra)/*pendeklarasian sebuah predikat dengan dua parameter dengan nama parameter ayah dan putra dan keduanya bertioe data string*/
kakek(STRING kakek,STRING cucu)/*pendeklarasian predikat dengan dua parameter dan memiliki tipe data string dimana argumen tersebut telah ditentukan objek-objeknya yaitu kakek dan cucu */
nondeterm ipar_perempuan(STRING,STRING) /*pemberian kemungkinan fakta yang akan dijalakan diakhir program*/
CLAUSES
putra("Ikhsan","Bentang").
saudara_perempuan("Dini","Dina").
saudara_laki("Adi","Lintang").
menikah("Ikhsan","Dini").
menikah("Lintang","Surga").
ayah(A,B):-putra(B,A). /*A adalah ayah B hanya jika B adalah putra A */
kakek(A,B):-ayah(A,C), ayah(C,B)./*A adalah kakek dari B hanya jika A adalah ayah C dan C adalah ayah B*/
ipar_perempuan(A,B):-menikah(A,C), saudara_perempuan(C,B). /*A adalah ipar perempuan dari B hanya jika A menikah dengan C dan C merupakan saudara dari B*/
ipar_perempuan(A,B):-saudara_laki(A,C), menikah(C,B). /*A adalah ipar perempuan dari B hanya jika A merupakan saudara laki-laki dari C dan C menika dengan B*/
GOAL
ipar_perempuan("Ikhsan",X). /*siapakah ipar perempuan dari ikhsan jawabannya adalah dina, karena ikhsan menikah dengan Dini dan Dini merupakan saudara dari Dina*/