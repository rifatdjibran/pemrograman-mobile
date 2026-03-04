void main() {

  String nama = "Rifat Djibran";
  String nim = "244107060138";

  for (int angka = 0; angka <= 201; angka++) {

    if (isPrima(angka)) {
      print("$angka adalah bilangan prima - $nama ($nim)");
    }

  }
}

bool isPrima(int n) {

  if (n < 2) {
    return false;
  }

  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      return false;
    }
  }

  return true;
}