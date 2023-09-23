# Ctypes ile Python ve C hız karşılaştırma.. (Büyük olasılıkla tamamen saçmalık)
Basit bir sistem. libsum.so'yu derle, sample.py'yi çalıştır. Bu kadar.

Hız karşılaştırma sonuçlarına bakarsak C'nin tabii ki daha hızlı olduğunu
görebiliriz. Ancak şöyle bir sorun var. Fonksiyonlar anlamsız ve işlevsiz
tasarlanmış. Aşırı basitler. Hatta öyle ki eğer C'de optimizasyonları açarak
derlersek hesaplama bile yapmaz. Hesaplamayı derleme esnasında yapıp sadece
belirli bir değeri return edecek tek satırlık bir fonksiyon oluşturur.

```sh
$ make -B CFLAGS="-O2"
cc -fPIC -O2 -shared -o libsum.so sum-of-squares.c
cc -O2 -o sample libsum.so sample.c
$ python sample.py
C Sonuç: 100000000
Python Sonuç: 100000000
C Süre: 6.031990051269531e-05
Python Süre: 6.58516025543212
```

Optimizasyonsuz derlersek de yine tabii ki C daha hızlı olur.

```sh
$ make -B CFLAGS="-O0"
cc -fPIC -O0 -shared -o libsum.so sum-of-squares.c
cc -O0 -o sample libsum.so sample.c
$ python sample.py
C Sonuç: 100000000
Python Sonuç: 100000000
C Süre: 0.11849617958068848
Python Süre: 6.799983978271484
```

Böyle bir karşılaştırmanın saçma olmasının sebeplerinden birisi C
derleyicisinin compile time'da çok fazla kontrol yapması ve gerektiğinde kodu
kendi kafasına göre (ancak kesinlikle aynı işi yapacak biçimde)
düzenleyebilmesi. Python ise normalde sadece bytecode üretir onu da genelde pip
ile paket kurarken falan yapar.
