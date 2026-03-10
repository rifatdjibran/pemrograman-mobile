# Tugas Praktikum

### 1. Jelaskan yang dimaksud Functions dalam bahasa Dart!
Functions adalah blok kode mandiri yang dirancang untuk menjalankan tugas spesifik. Dalam bahasa Dart, fungsi dikategorikan sebagai objek (instansi dari class `Function`), yang berarti fungsi dapat disimpan dalam variabel, dilewatkan sebagai argumen, atau dikembalikan oleh fungsi lain. Hal ini mendukung prinsip modularitas dan penggunaan kembali kode secara efisien.

---

### 2. Jelaskan jenis-jenis parameter di Functions beserta contoh sintaksnya!
Dart menyediakan fleksibilitas dalam pendefinisian parameter:

* **Required Parameters:** Parameter wajib yang harus diisi sesuai urutan posisinya.
    ```dart
    void cetakNama(String nama) => print(nama);
    ```
* **Named Parameters:** Parameter yang dipanggil menggunakan nama labelnya, dibungkus dengan kurung kurawal `{}`. Secara default bersifat opsional kecuali ditambahkan keyword `required`.
    ```dart
    void identitas({required String nama, int? umur}) { ... }
    ```
* **Optional Positional Parameters:** Parameter opsional yang bergantung pada posisi urutannya, dibungkus dengan kurung siku `[]`.
    ```dart
    void log(String pesan, [String? kategori]) { ... }
    ```

---

### 3. Jelaskan maksud Functions sebagai first-class objects beserta contoh sintaknya!
Konsep ini berarti fungsi diperlakukan sama seperti tipe data dasar lainnya. Fungsi dapat diperlakukan sebagai entitas yang bisa dimanipulasi secara dinamis.

```dart
// Fungsi disimpan dalam variabel
var operasi = (int a, int b) => a + b;

// Fungsi dilewatkan sebagai argumen (Higher-order function)
void eksekusi(int x, int y, Function kalkulasi) => print(kalkulasi(x, y));
```
---

### 4. Apa itu Anonymous Functions? Jelaskan dan berikan contohnya!
Anonymous functions adalah fungsi yang tidak memiliki nama. Biasanya digunakan untuk operasi singkat atau sebagai callback pada koleksi data.

Contoh :

```dart
var list = ['Rifat', 'Djibran'];
list.forEach((item) {
  print(item); // Ini adalah anonymous function
});
```

---

### 5. Jelaskan perbedaan Lexical scope dan Lexical closures! Berikan contohnya!

* `Lexical Scope:` Penentuan cakupan variabel berdasarkan tata letak kode secara fisik. Variabel hanya bisa diakses di dalam blok kodenya sendiri atau blok di dalamnya (nested).

* `Lexical Closures:` Sebuah objek fungsi yang mampu "mengingat" atau mengakses variabel di lingkup asalnya (lexical scope) meskipun fungsi tersebut dieksekusi di luar lingkup tersebut.

Contoh :

```dart
Function buatCounter() {
  int count = 0; // Lexical Scope
  return () => print(++count); // Closure: mengingat variabel 'count'
}
```

---

### 6. Jelaskan dengan contoh cara membuat return multiple value di Functions!
Cara paling modern dan efisien di Dart 3 untuk mengembalikan lebih dari satu nilai adalah menggunakan Records. Fitur ini memungkinkan pengembalian nilai tanpa perlu membuat class model tambahan.

```dart
// Mendeklarasikan fungsi dengan return type Record
(String, String) getBiodata() {
  return ('Rifat Djibran', '244107060138');
}

void main() {
  // Melakukan destructuring untuk mengambil nilai secara terpisah
  var (nama, nim) = getBiodata();
  print("Nama: $nama, NIM: $nim");
}
```


