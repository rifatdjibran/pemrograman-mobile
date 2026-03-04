void main() {

  // ======================
  // LANGKAH 1 & 2 
  // ======================

  for (int index = 10; index < 27; index++) {
    print(index);
  }

  print("===== LANGKAH 3 =====");

  // ======================
  // LANGKAH 3 
  // ======================

  for (int index = 10; index < 27; index++) {

    if (index == 21) {
      break;
    } else if (index > 1 && index < 7) {
      continue;
    }

    print(index);
  }

}