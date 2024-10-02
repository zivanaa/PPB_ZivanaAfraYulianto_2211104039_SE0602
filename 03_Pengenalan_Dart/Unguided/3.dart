import 'dart:io';

bool cekBilanganPrima(int n) {
  if (n <= 1) {
    return false; // Bilangan <= 1 bukan bilangan prima
  }
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) {
      return false; // Jika ada faktor selain 1 dan n, maka bukan bilangan prima
    }
  }
  return true;
}

void main() {
  stdout.write("Masukkan bilangan bulat: ");
  int bilangan = int.parse(stdin.readLineSync()!);

  if (cekBilanganPrima(bilangan)) {
    print("$bilangan merupakan bilangan prima.");
  } else {
    print("$bilangan bukan bilangan prima.");
  }
}
