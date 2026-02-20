# Tugas Praktikum 2 Pemrograman Mobile

## Soal 2
### Mengapa penting memahami Dart sebelum menggunakan Flutter?

Bagi Saya sangat penting untuk memahami bahasa pemrograman dart sebelum menggunakan framework Flutter karena Dart merupakan bahasa utama yang digunakan dalam pengembangan flutter. Semua kode aplikasi, pengaturan logika, pembuatan tampilan, dan manajemen state menggunakan dart

Dengan memahami Dart, pengembang akan lebih mudah memahami struktur kode Flutter, konsep Object-Oriented Programming atau bisa disingkat OOP, pengelolaan variabel, fungsi, serta fitur null safety. Selain itu, pemahaman Dart juga membantu dalam proses debugging dan pengembangan aplikasi yang lebih stabil

Tanpa memahami Dart, penggunaan flutter hanya sebatas mengikuti tutorial tanpa memahami cara kerja aplikasi secara menyeluruh


## Soal 3
### Rangkuman Materi Codelab Dart

Berikut poin-poin penting dari materi codelab:

1. Dart adalah bahasa inti dari Flutter
2. Dart memiliki fitur productive tooling, garbage collection, dan type safety
3. Dart bersifat statically typed dengan dukungan type inference
4. Dart dapat dikompilasi menggunakan:
   - Dart Virtual Machine (VM)
   - Kompilasi ke JavaScript (dart2js)
5. Dart mendukung dua mode kompilasi:
   - JIT (Just-In-Time) untuk pengembangan dan hot reload
   - AOT (Ahead-Of-Time) untuk performa optimal saat rilis aplikasi
6. Hot reload memungkinkan perubahan kode langsung terlihat tanpa restart aplikasi
7. Dart mendukung konsep Object-Oriented Programming seperti encapsulation, inheritance, abstraction, dan polymorphism
8. Operator di Dart merupakan method dalam class
9. Semua tipe data di Dart adalah objek
10. Dart memiliki operator aritmatika, relasional, logika, serta increment dan decrement

---

## Soal 4
### Perbedaan Null Safety dan Late Variable


Null Safety adalah fitur yang mencegah variabel memiliki nilai null kecuali secara eksplisit diizinkan menggunakan tanda tanya (?)

Contoh:
- String nama → tidak boleh null
- String? nama → boleh null

Null safety membantu mencegah error akibat variabel kosong

Late Variable digunakan ketika variabel belum diinisialisasi saat deklarasi, tetapi dipastikan akan diberi nilai sebelum digunakan

Jika variabel late digunakan sebelum diberi nilai, maka akan terjadi error

Kesimpulannya:
- Null safety mengatur apakah variabel boleh bernilai null atau tidak
- Late digunakan untuk menunda proses inisialisasi variabel
