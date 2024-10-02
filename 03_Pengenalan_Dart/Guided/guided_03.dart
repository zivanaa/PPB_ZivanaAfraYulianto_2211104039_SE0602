void main() {
  // Menggunakan var
  print('=====ariable=====');
  var name = "Alice"; // Tipe data String
  var age = 25; // Tipe data Integer

  print("Nama: $name, Usia: $age");

  String firstName = 'praktikum';
  var lastName = 'PPB';

  print("hari Ini: $firstName $lastName");

  //if-else
  print('=====if elsa=====');
  var open = 8;
  var close = 17;
  var now = 20;

  if (now >= open && now < close) {
    print("toko buka");
  } else if (now == 12) {
    print("toko istirahat");
  } else {
    print("toko tutup");
  }

  //condition ? true : false
  print('=====if else 1 line=====');
  var toko = now > open ? "toko tutup" : "toko tutup";
  print(toko);

  //switch case
  print('=====switch=====');

  var nilai = 'a';

  switch (nilai) {
    case 'a':
      print('nilai sangat bagus');
      break;
    case 'b':
      print('nilai baik');
      break;
    case 'c':
      print('nilai cukup');
      break;
    default:
      print('nilai tidak tesedia');
  }

  //looping
  print('=====looping=====');
  for (int i = 0; i <= 10; i++) {
    print(i);
  }

  int i = 1;

  while (i <= 5) {
    print('angka: $i');
    i++;
  }

  //list fixed
  print('=====list fixed=====');
  List<int> fixedList = List.filled(3, 0);

  fixedList[0] = 10;
  fixedList[1] = 20;
  fixedList[2] = 30;

  print('fixed list : $fixedList');

  //list growable
  print('=====list growable=====');
  List<int> growableList = [];

  growableList.add(10);
  growableList.add(20);
  growableList.add(30);

  print(growableList);

  growableList.add(40);
  growableList.add(50);
  growableList.add(60);

  print(growableList);

  growableList.remove(20);
  print(growableList);

  //fungsi
  void cetakPesan(String pesan) {
    print(pesan);
  }

  int perkalian(int a, int b) {
    return a * b;
  }

  int hasil = perkalian(5, 4);
  print('hasil perkalian fungsi : $hasil');

  cetakPesan('halo guys');
}
