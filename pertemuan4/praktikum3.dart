void main() {

  // =========================
  // LANGKAH 1
  // =========================

  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print(gifts);
  print(nobleGases);


  // =========================
  // LANGKAH 3
  // =========================

  var mhs1 = Map<String, String>();
  var mhs2 = Map<int, String>();

  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  // menambahkan nama dan NIM
  gifts['nama'] = 'Rifat Djibran';
  nobleGases[99] = '244107060138';

  mhs1['nama'] = 'Rifat Djibran';
  mhs1['nim'] = '244107060138';

  mhs2[1] = 'Rifat Djibran';
  mhs2[2] = '244107060138';

  print("\nData gifts:");
  print(gifts);

  print("\nData nobleGases:");
  print(nobleGases);

  print("\nData mhs1:");
  print(mhs1);

  print("\nData mhs2:");
  print(mhs2);
}