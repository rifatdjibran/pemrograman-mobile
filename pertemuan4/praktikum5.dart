(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {
  // =========================
  // LANGKAH 1 & 2
  // =========================
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  // =========================
  // LANGKAH 3 
  // =========================
  var recordAngka = (10, 20);
  var recordTukar = tukar(recordAngka);
  print('\nSebelum tukar: $recordAngka');
  print('Sesudah tukar: $recordTukar');

  // =========================
  // LANGKAH 4
  // =========================

  (String, String) mahasiswa = ('Rifat Djibran', '244107060138');
  print('\n$mahasiswa');

  // =========================
  // LANGKAH 5
  // =========================
  var mahasiswa2 = ('Rifat Djibran', a: 2, b: true, '244107060138');

  print('\nLangkah 5:');
  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2); 
}