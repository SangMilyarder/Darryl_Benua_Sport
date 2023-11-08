## Perbedaan Stateless dan Stateful Widget dalam Flutter

# Stateless Widget

**Definisi :**
StatelessWidget adalah widget yang tidak memerlukan state yang berarti mereka tidak berubah sepanjang waktu atau statis

**Karakteristik :**
- Tidak Memiliki State: Tidak menyimpan state apa pun yang dapat berubah sepanjang waktu
- Rebuild: Tidak pernah di-rebuild secara sendiri. Hanya akan di-rebuild ketika widget induknya di-rebuild
- Contoh Penggunaan: Cocok untuk widget yang hanya menampilkan konten statis, seperti teks atau ikon

# Stateful Widget

**Definisi :**
StatefulWidget adalah widget yang memungkinkan adanya state yang dapat berubah sepanjang waktu atau dinamis

**Karakteristik :**
- Memiliki State: Memiliki state yang dapat berubah, dan perubahan ini dapat memicu widget untuk di-rebuild
- Lifecycle: Memiliki lifecycle yang lebih kompleks, dengan metode seperti initState(), setState(), dispose()
- Contoh Penggunaan: Cocok untuk widget yang memerlukan interaksi atau perubahan data, seperti formulir, animasi, atau penghitung waktu

## Widget yang digunakan untuk tugas ini

- **MaterialApp:** 
Widget utama yang menentukan konfigurasi visual aplikasi, seperti tema, nama rute, dan lainnya
- **Scaffold:**
Widget yang menyediakan struktur dasar visual untuk layar. Menyediakan app bar, body, floating action button, dan lain-lain
- **AppBar:** Widget yang biasanya digunakan di bagian atas Scaffold untuk menampilkan judul aplikasi, tindakan, dan navigasi
- **SingleChildScrollView:** Widget yang menyediakan kemampuan scroll pada kontennya. Sangat berguna ketika konten yang ditampilkan lebih besar daripada layar
- **Padding:** Widget yang menambahkan ruang kosong di sekitar anaknya. Digunakan untuk memberi ruang antara elemen UI
- **Column:** Widget yang mengatur anak-anaknya secara vertikal
- **Text:** Widget yang menampilkan string teks dengan berbagai styling
- **GridView:** Widget yang menyusun anak-anaknya dalam bentuk grid. Memiliki berbagai parameter untuk mengontrol jumlah kolom, spacing, dan lain-lain
- **Material:** Widget yang mengikuti prinsip desain material. Digunakan di sini sebagai basis untuk InkWell agar mendapatkan efek visual yang sesuai
- **InkWell:** Widget yang menanggapi sentuhan dengan menampilkan efek gelombang air. Digunakan untuk membuat area yang dapat diklik atau ditekan
- **Container:** Widget yang menyediakan kotak untuk menempatkan lebih dari satu widget dengan berbagai properti, seperti padding, margin, dan dekorasi
- **Icon:** Widget yang menampilkan ikon dengan berbagai pilihan ukuran dan warna
- **SnackBar:** Widget yang menampilkan pesan sementara di bagian bawah layar, biasanya digunakan untuk memberi feedback singkat kepada pengguna
- **ScaffoldMessenger:** Widget yang digunakan untuk menampilkan SnackBar. Dapat digunakan untuk mengontrol tampilan SnackBar, seperti menampilkannya atau menyembunyikannya

## Langkah mengimplementasikan checklist secara step-by-step

## Instalasi Flutter

1. **Install Flutter**
- Install Flutter melalui link berikut ini https://docs.flutter.dev/get-started/install/macos

2. **Ikuti langkah yang disediakan di docs tersebut**

## Membuat Proyek Flutter

1. **Buka Terminal atau Command Prompt**

2. **Masuk ke direktori di mana kamu ingin menyimpan proyek Flutter-mu**
- Masuk ke direktori dimana proyek Flutter akan dibuat

3. **Generate proyek Flutter baru**
- Menjalankan kode berikut dalam terminal atau direktori yang sudah dipilih
```
flutter create Darryl_Benua_Sport
cd Darryl_Benua_Sport
```

4. **Jalankan proyek melalui Terminal atau Command Prompt**
- Menjalankan kode berikut untuk menjalankan proyek dan hanya perlu dijalankan sekali
```
flutter config --enable-web
```
- Kemudian jalankan proyek tersebut di aplikasi Google Chrome
```
flutter run -d chrome
```

5. **Kemudian hasil akan dapat terlihat di Chrome**

## Merapikan Struktur Proyek

1. **Buatlah file baru pada proyek**
- Buat file baru bernama menu.dart pada direktori Darryl_Benua_Sport/lib

2. **Memasukkan import yang diperlukan**
- Tambahkan kedua import berikut
```
import 'package:flutter/material.dart';
import 'package:darryl_benua_sport/menu.dart';
```

3. **Pindahkan bagian kode di main.dart ke menu.dart**
- Pindahkan kode dari baris 39 sampai akhir ke file menu.dart dan apus kode tersebut dari file main.dart

## Membuat Widget Pada Proyek

1. **Mengubah warna aplikasi**
- Ubah warna aplikasi pada baris berikut ini colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),

2. **Ubah sifat widget halaman menu menjadi stateless**
- Pada file main.dart, hapus MyHomePage(title: 'Flutter Demo Home Page') menjadi MyHomePage()

3. **Ubah sifat widget halaman menu menjadi stateless**
- Isi file menu.dart menjadi seperti ini
```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);
    final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Benua Sport',
            ),
          ),
          body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                      'PBP Shop', // Text yang menandakan toko
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                      // Iterasi untuk setiap item
                      return ShopCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
    }
}

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Membuat Snackbar Sesuai yang Diinginkan

1. **Menambahkan variabel baru di class ShopItem**
- Menambahkan variabel snackbarText
```dart
class ShopItem {
  final String name;
  final IconData icon;
  final String snackBarText;

  ShopItem(this.name, this.icon, this.snackBarText);
}
```

2. **Mengubah bagian Snackbar**
- Mengubah pada bagian ScaffoldMessenger
```dart
ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(item.snackBarText),));
```

3. **Isi tulisan Snackbar**
- Isi pada list items di atas:
```dart
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, "Kamu telah menekan tombol Lihat Item"),
    ShopItem("Tambah Item", Icons.add_shopping_cart, "Kamu telah menekan tombol Tambah Item"),
    ShopItem("Logout", Icons.logout, "Kamu telah menekan tombol Logout"),
  ];
```

## Mengerjakan Bonus 

1. **Menambahkan variabel baru di class ShopItem**
- Menambahkan variabel color
```dart
class ShopItem {
  final String name;
  final IconData icon;
  final String snackBarText;
  final Color color;

  ShopItem(this.name, this.icon, this.snackBarText, this.color);
}
```

2. **Mengubah warna pada setiap tombol**
- Isi pada list items di atas warna yang diinginkan:
```dart
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, "Kamu telah menekan tombol Lihat Item", Colors.cyan),
    ShopItem("Tambah Item", Icons.add_shopping_cart, "Kamu telah menekan tombol Tambah Item", Colors.deepPurple),
    ShopItem("Logout", Icons.logout, "Kamu telah menekan tombol Logout", Colors.lime),
  ];
```

3. **Mengubah warna tombol sesuai dengan warna yang ditentukan**
- Ubahlah baris berikut di dalam Widget Build
```dart
color: item.color,
```