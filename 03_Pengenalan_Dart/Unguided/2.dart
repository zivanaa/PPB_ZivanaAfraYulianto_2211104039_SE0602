import 'dart:io';

void main() {
  stdout.write("Masukkan panjang piramida: ");
  int panjang = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= panjang; i++) {
    // Menampilkan spasi
    for (int j = 1; j <= panjang - i; j++) {
      stdout.write(" ");
    }
    // Menampilkan bintang
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }
    print(""); // Pindah ke baris berikutnya
  }
}
