## Tugas 7

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

## Tugas 8

# Perbedaan antara Navigator.push() dan Navigator.pushReplacement() di Flutter

## Navigator.push()

Navigator.push berfungsi untuk menambahkan rute baru di atas stack navigasi, sambil mempertahankan rute sebelumnya dan ideal untuk digunakan ketika ingin menavigasi ke layar baru sambil mempertahankan layar sebelumnya, sehingga pengguna dapat kembali ke layar itu. Contoh penggunaanya, dalam aplikasi belanja, menavigasi dari daftar produk ke halaman detail produk
- **Contoh**:
  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProductDetailPage()),
  );
  ```

## Navigator.pushReplacement()

Navigator.pushReplacement() berfungsi untuk menggantikan rute saat ini dengan rute baru dan menghapus rute sebelumnya dari stack dan digunakan ketika ingin menavigasi ke layar baru dan mencegah pengguna kembali ke layar sebelumnya. Contoh penggunaannya seperti menavigasi dari layar login ke layar beranda setelah login berhasil
- **Contoh**:
  ```dart
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
  ```

# Widget Layout di Flutter dan Konteks Penggunaannya

**1. Column dan Row**

Widget ini berfungsi untuk mengatur childnya secara linier sepanjang sumbu vertikal (`Column`) dan horizontal (`Row`). Widget ini cocok digunakan untuk membuat layout linier, seperti formulir, toolbar, atau serangkaian tombol
- contoh:
  ```dart
  Column(
    children: <Widget>[
      Text('Item 1'),
      Text('Item 2'),
    ],
  )
  ```

**2. Container**

Widget ini digunakan untuk styling, padding, margin, dan batasan. Widget ini cocok untuk membuat kotak dengan dekorasi, ukuran, atau styling tertentu ketika sebuah widget tunggal perlu distyling
- contoh:
  ```dart
  Container(
    padding: EdgeInsets.all(8.0),
    color: Colors.blue,
    child: Text('Halo Dunia'),
  )
  ```

**3. Stack**

Berfungsi untuk memungkinkan widget untuk bertumpuk satu sama lain dan digunakan untuk menumpuk widget, seperti meletakkan teks di atas gambar
- contoh:
  ```dart
  Stack(
    children: <Widget>[
      Image.network('url'),
      Text('Halo Dunia'),
    ],
  )
  ```

**4. ListView**

Berfungsi untuk menampilkan daftar widget yang dapat di-scroll dan cocok digunakan untuk daftar panjang atau tak terbatas seperti feed berita yang dapat di-scroll atau daftar pesan
- contoh:
  ```dart
  ListView(
    children: <Widget>[
      ListTile(title: Text('Item 1')),
      ListTile(title: Text('Item 2')),
    ],
  )
  ```

**5. GridView**

Berfungsi untuk menampilkan widget dalam grid dua dimensi dan biasanya digunakan untuk layout seperti galeri gambar
- contoh:
  ```dart
  GridView.count(
    crossAxisCount: 2,
    children: <Widget>[
      Text('Item 1'),
      Text('Item 2'),
    ],
  ) 
  ```

**6. Expanded dan Flexible**

Berfungsi untuk mengontrol bagaimana child dari Row, Column, atau Flex memperluas untuk mengisi ruang yang tersedia dan biasanya digunakan untuk mendistribusikan ruang dalam layout linier (Row/Column)
- contoh:
  ```dart
  Row(
    children: <Widget>[
      Expanded(child: Text('Item 1')),
      Expanded(child: Text('Item 2')),
    ],
  )
  ```

**7. Padding**

Berfungsi untuk menambahkan padding di sekitar widget dan biasanya digunakan ketika perlu menambahkan ruang di sekitar widget untuk menghindari tampilan yang terlalu padat
- contoh:
  ```dart
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('Halo Dunia'),
  )
  ```

**8. Align dan Center**

Berfungsi untuk menyelaraskan child di dalam dirinya dan secara opsional mengukur dirinya berdasarkan ukuran child dan biasanya digunakan ketika perlu menyelaraskan sebuah widget, seperti memusatkan sebuah widget atau menyelaraskannya ke salah satu sisi layar
- contoh:
  ```dart
  Center(
    child: Text('Halo Dunia'),
  )
  ```

# Elemen Input Pada Form Yang Dipakai dan Alasannya

**TextFormField**
  - **Deskripsi**: Memungkinkan pengguna memasukkan nama produk golf, harga produk, jumlah stok produk, kategori produk, dan deskripsi produk

  - **Alasan Penggunaan**: Untuk memudahkan pengumpulan dan validasi input teks, validasi angka untuk memastikan bahwa input adalah numerik dan sesuai format, dan memudahkan dalam input teks panjang

# Penerapan Clean Architecture Pada Aplikasi Flutter

## Prinsip Dasar Clean Architecture
- **Independensi Terhadap Framework:** Memastikan aplikasi tidak bergantung secara langsung pada framework tertentu
- **Uji Independen per Lapisan:** Setiap lapisan harus dapat diuji secara terpisah
- **Independensi UI dari Logika Aplikasi:** UI harus terpisah dan tidak terpengaruh oleh logika bisnis aplikasi
- **Independensi Database:** Perubahan pada database tidak boleh mempengaruhi logika bisnis

## Pemisahan Aplikasi Menjadi Beberapa Layer
- **Presentation Layer:** Menangani semua yang berkaitan dengan UI dan presentasi
- **Domain Layer:** Inti dari logika bisnis aplikasi
- **Data Layer:** Mengelola data, termasuk penyimpanan dan pengambilan data

## Menetapkan Kontrak Antar Layer
- **Interface:** Mendefinisikan bagaimana lapisan-lapisan berkomunikasi dan berinteraksi

## Mengimplementasikan Use Cases atau Interactors
- **Encapsulation of Application Logic:** Mengenkapsulasi logika aplikasi ke dalam use cases atau interactors
- **Action or Business Process Representation:** Setiap use case mewakili satu aksi atau proses bisnis

## Mengelola State
- **Centralized and Consistent State Management:** Mengatur state aplikasi secara terpusat dan konsisten

## Testing
- **Independent Layer Testing:** Menulis dan menjalankan tes untuk setiap lapisan secara independen

# Implementasi Checklist
  












