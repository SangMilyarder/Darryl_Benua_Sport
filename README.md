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

# Tugas 8

## Perbedaan antara Navigator.push() dan Navigator.pushReplacement() di Flutter

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

## Membuat Form Input

1. **Buat berkas baru di dalam direktori baru screens dengan nama shoplist_form.dart** 
- Tambahkan impor yang diperlukan ke dalam berkas eurogolf_form.dart:
  ```dart
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/widgets/left_drawer.dart';
  ```

2. **Isi file eurogolf_form.dart dengan program berikut**
- Berikut program untuk mengisi form beserta impor yang sudah dimasukkan sebelumnya:
  ```dart
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/widgets/left_drawer.dart';

  class ShopFormPage extends StatefulWidget {
      const ShopFormPage({super.key});

      @override
      State<ShopFormPage> createState() => _ShopFormPageState();
  }

  class _ShopFormPageState extends State<ShopFormPage> {
      @override
      Widget build(BuildContext context) {
          return Placeholder();
      }
  }
  ```

3. **Ubah widget Placeholder**
- Ubah widget sebagai berikut:
  ```dart
    Scaffold(
    appBar: AppBar(
      title: const Center(
        child: Text(
          'Form Tambah Item',
        ),
      ),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
    ),
    drawer: const LeftDrawer(),
    body: Form(
      child: SingleChildScrollView(),
    ),
  );
  ```

4. **Buat variabel baru bernama _formKey**
- Tambahkan _formKey tersebut ke dalam atribut key milik widget Form dimana atribut key akan berfungsi sebagai handler dari form state, validasi form, dan penyimpanan form
  ```dart
  class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
  ```
  ```dart
  body: Form(
    key: _formKey,
    child: SingleChildScrollView(),
  ),
  ```

5. **Isi widget Form dengan field**
- Isi sebagai berikut:
  ```dart
  class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    int _amount = 0;
    String _category = "";
    String _description = "";
  ```

6. **Buat widget Column sebagai child dari SingleChildScrollView**
- ```dart
  body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column()
      ),
  ```

7. **Buat widget TextFormField**
- Sebagai berikut:
  ```dart
  child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Name",
              labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Name tidak boleh kosong!";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Price",
              labelText: "Price",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _price = int.parse(value!);
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Price tidak boleh kosong!";
              }
              if (int.tryParse(value) == null) {
                return "Price harus berupa angka!";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Amount",
              labelText: "Amount",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _amount = int.parse(value!);
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Amount tidak boleh kosong!";
              }
              if (int.tryParse(value) == null) {
                return "Amount harus berupa angka!";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Category",
              labelText: "Category",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _category = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Category tidak boleh kosong!";
              }
              return null;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Description",
              labelText: "Description",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _description = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Deskripsi tidak boleh kosong!";
              }
              return null;
            },
          ),
        ),
  ```

8. **Buat tombol sebagai child selanjutnya dari Column**
- Sebagai berikut:
  ```dart
  Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.indigo),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
        child: const Text(
          "Save",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
  ),
  ```

9. **Munculkan data yang diinput user**
- Tambahkan fungsi showDialog() pada bagian onPressed() dan munculkan widget AlertDialog pada fungsi tersebut. Kemudian, tambahkan juga fungsi untuk reset form
  ```dart
  child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.indigo),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Produk berhasil tersimpan'),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text('Nama: $_name'),
                            // TODO: Munculkan value-value lainnya
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              _formKey.currentState!.reset();
              }
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
  ```

10. **Berikut tampilan akhir eurogolf_form.dart**
- ```dart
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/widgets/left_drawer.dart';

  class ShopFormPage extends StatefulWidget {
      const ShopFormPage({super.key});

      @override
      State<ShopFormPage> createState() => _ShopFormPageState();
  }

  class _ShopFormPageState extends State<ShopFormPage> {
      final _formKey = GlobalKey<FormState>();
      String _name = "";
      int _price = 0;
      int _amount = 0;
      String _category = "";
      String _description = "";

      @override
      Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Form Tambah Item',
                ),
              ),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Name",
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _name = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Price",
                          labelText: "Price",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _price = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Price tidak boleh kosong!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Price harus berupa angka!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Description",
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _description = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Description tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.indigo),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Item berhasil tersimpan'),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Name: $_name'),
                                          Text('Price: $_price'),
                                          Text('Amount: $_amount'),
                                          Text('Category: $_category'),
                                          Text('Description: $_description')
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            };
                            _formKey.currentState!.reset();
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          );
      }
  }

## Mengarahkan pengguna ke halaman form tambah item

1. **Buat file baru pada direktori widgets bernama shop_card.dart**

2. **Pindahkan isi widget ShopItem pada menu.dart ke berkas widgets/shop_card.dart**
- Pindahkan isi berikut ke shop_card.dart
  ```dart
  import 'package:darryl_benua_sport/screens/golf_list.dart';
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/screens/eurogolf_form.dart';
  import 'package:darryl_benua_sport/models/eurogolf.dart';

  class ShopItem {
    final String name;
    final IconData icon;
    final String snackBarText;
    final Color color;

    ShopItem(this.name, this.icon, this.snackBarText, this.color);
  }

  class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
      return Material(
        color: item.color,
        child: InkWell(
          // Area responsive terhadap sentuhan
          onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(item.snackBarText),));
            if (item.name == "Tambah Item") {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
            }
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

3. **Menambahkan bagian untuk handle jika user tap tombol**
- Tambahkan kode berikut pada file shop_card.dart
  ```dart
  onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(item.snackBarText),));
          if (item.name == "Tambah Item") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()));
          } else if (item.name == "Lihat Item") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductListPage(iron: Ironlist)));
          }
        },
  ```

## Membuat Drawer

1. **Buat berkas baru di dalam direktori baru widgets dalam direktori lib bernama left_drawer.dart**

2. **Impor untuk hal-hal yang diperlukan**
- Berikut impor yang diperlukan:
  ```dart
  import 'package:darryl_benua_sport/screens/golf_list.dart';
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/screens/menu.dart';
  import 'package:darryl_benua_sport/screens/eurogolf_form.dart';
  import 'package:darryl_benua_sport/models/eurogolf.dart';
  ```

3. **Isi file left_drawer.dart dengan program berikut**
- Berikut program untuk mengisi drawer beserta impor yang sudah dimasukkan sebelumnya:
  ```dart
  import 'package:darryl_benua_sport/screens/golf_list.dart';
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/screens/menu.dart';
  import 'package:darryl_benua_sport/screens/eurogolf_form.dart';
  import 'package:darryl_benua_sport/models/eurogolf.dart';

  class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                children: [
                  Text(
                    'Euro Golf',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Catat seluruh keperluan golfmu di sini!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                ],
              ),
            ),
            ListTile( 
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart),
              title: const Text('Tambah Item'),
              // Bagian redirection ke ShopFormPage
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ShopFormPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.checklist),
              title: Text('Lihat Produk'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage(iron: Ironlist)));
              }
            )
          ],
        ),
      );
    }
  }
  ```

## Bonus

1. **Buat berkas baru di dalam direktori baru models dalam direktori lib bernama eurogolf.dart**

2. **Isi file eurogolf.dart berdasarkan model yang diinginkan**
- Sebagai berikut:
  ```dart
  List<Iron> Ironlist = [];

  class Iron {
    final String name;
    final int price;
    final int amount;
    final String category;
    final String description;

    Iron({required this.name, required this.price, required this.amount, required this.category, required this.description});
  }
  ```

3. **Buat berkas baru di dalam direktori screens dalam direktori lib bernama golf_list.dart**

4. **Isi file golf_list.dart**
- Isi file untuk menampilkan list item sebagai berikut:
  ```dart
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/models/eurogolf.dart';

  class ProductListPage extends StatelessWidget {
    final List<Iron> iron;

    const ProductListPage({Key? key, required this.iron}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Daftar Item',
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: iron.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      iron[index].name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Price: ${iron[index].price}",
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Amount: ${iron[index].amount}",
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Category: ${iron[index].category}",
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Description: ${iron[index].description}",
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
  ```

5. **Ubah isi eurogolf_form.dart**
- Untuk menggunakan model yang sudah dibuat ubah isi file sebagai berikut:
  ```dart
  import 'package:darryl_benua_sport/models/eurogolf.dart';
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/widgets/left_drawer.dart';

  class ShopFormPage extends StatefulWidget {
      const ShopFormPage({super.key});

      @override
      State<ShopFormPage> createState() => _ShopFormPageState();
  }

  class _ShopFormPageState extends State<ShopFormPage> {
      final _formKey = GlobalKey<FormState>();
      Iron _ironlist = Iron(name: '', price: 0, amount: 0, category: '', description: '');

      @override
      Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Form Tambah Item',
                ),
              ),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Name",
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _ironlist = Iron(
                              name: value!,
                              price: _ironlist.price,
                              amount: _ironlist.amount,
                              category: _ironlist.category,
                              description: _ironlist.description,
                            );
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Price",
                          labelText: "Price",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _ironlist = Iron(
                              name: _ironlist.name,
                              price: int.tryParse(value!) ?? 0,
                              amount: _ironlist.amount,
                              category: _ironlist.category,
                              description: _ironlist.description,
                            );
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Price tidak boleh kosong!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Price harus berupa angka!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Amount",
                          labelText: "Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _ironlist = Iron(
                              name: _ironlist.name,
                              price: _ironlist.price,
                              amount: int.tryParse(value!) ?? 0,
                              category: _ironlist.category,
                              description: _ironlist.description,
                            );
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Amount tidak boleh kosong!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Amount harus berupa angka!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Category",
                          labelText: "Category",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _ironlist = Iron(
                              name: _ironlist.name,
                              price: _ironlist.price,
                              amount: _ironlist.amount,
                              category: value!,
                              description: _ironlist.description,
                            );
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Category tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Description",
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _ironlist = Iron(
                              name: _ironlist.name,
                              price: _ironlist.price,
                              amount: _ironlist.amount,
                              category: _ironlist.category,
                              description: value!,
                            );
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Deskripsi tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                  MaterialStateProperty.all(Colors.indigo),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  String tempName = _ironlist.name;
                                  int tempPrice = _ironlist.price;
                                  int tempAmount = _ironlist.amount;
                                  String tempCategory = _ironlist.category;
                                  String tempDescription = _ironlist.description;
                                  Ironlist.add(_ironlist);
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Item berhasil tersimpan'),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Name: $tempName'),
                                              Text('Price: $tempPrice'),
                                              Text('Amount: $tempAmount'),
                                              Text('Category: $tempCategory'),
                                              Text('Description: $tempDescription'),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                        TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            _formKey.currentState!.reset();
                            setState(() {
                              _ironlist = Iron(name: '', price: 0, amount: 0, category: '', description: '');
                            });
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
              ]
            )
          ),
        ),
      );
    }
  }
  ```

6. **Routing dalam shop_card.dart dan left_drawer.dart**
- Menambahkan impor berkas golf_list.dart dan menambahkan kode berikut pada shop_card.dart
  ```dart
  import 'package:darryl_benua_sport/screens/golf_list.dart';
  ...
  onTap: () {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(item.snackBarText),));
    if (item.name == "Tambah Item") {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ShopFormPage()));
    } else if (item.name == "Lihat Item") {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductListPage(iron: Ironlist)));
    }
  },
  ...
  ```

- Menambahkan impor berkas golf_list.dart dan menambahkan kode berikut pada left_drawer.dart
  ```dart
  import 'package:darryl_benua_sport/screens/golf_list.dart';
  ...
  ListTile(
    leading: const Icon(Icons.checklist),
    title: Text('Lihat Produk'),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage(iron: Ironlist)));
    }
  )
  ...
  ```

# Tugas 9

# Pengambilan Data JSON Tanpa Model

Ya, dalam Flutter, kita dapat mengambil data JSON tanpa membuat model kelas terlebih dahulu. Ini dapat dilakukan dengan menggunakan struktur data dinamis seperti Map atau List

## Kelebihan dan Kekurangan

**Kelebihan:**
- Fleksibilitas: Lebih fleksibel dalam menangani struktur data yang berubah-ubah
- Pengembangan yang Cepat: Mengurangi waktu yang dibutuhkan untuk mendefinisikan model

**Kekurangan:**
- Risiko Kesalahan: Lebih berisiko terhadap kesalahan runtime akibat tipe data yang tidak konsisten
- Kurangnya Struktur: Kode menjadi kurang terstruktur dan sulit dipahami
- Kurangnya Validasi: Tidak ada validasi pada struktur data yang diterima

# Fungsi dari CookieRequest

## Definisi

CookieRequest adalah sebuah mekanisme dalam Flutter untuk mengelola cookies dalam permintaan HTTP, khususnya dalam konteks autentikasi

## Kegunaan
- **Pengelolaan Sesi:** Mengelola cookies yang digunakan untuk menjaga sesi pengguna
- **Keamanan:** Membantu dalam aspek keamanan dengan mengelola cookies autentikasi

## Pentingnya Bagi Aplikasi Flutter
- **Konsistensi Sesi:** Memastikan bahwa sesi pengguna tetap konsisten di seluruh komponen aplikasi
- **Pengelolaan State:** Membantu dalam pengelolaan state yang berhubungan dengan status login pengguna

# Mekanisme Pengambilan Data JSON

- **Permintaan HTTP:** Mengirimkan permintaan HTTP ke server (misalnya, Django) menggunakan paket seperti http
- **Mendapatkan Respons:** Menerima respons dalam format JSON dari server
- **Parsing JSON:** Mengubah data JSON menjadi struktur data Dart (Map/List atau model)
- **Penggunaan Data:** Menggunakan data yang telah diparsing untuk ditampilkan di UI

# Mekanisme Autentikasi dari Flutter ke Django

- **Input Data:** Pengguna memasukkan data akun (username/password) di Flutter
- **Kirim Data:** Data akun dikirim ke Django melalui permintaan HTTP
- **Proses Autentikasi:** Django memproses data dan melakukan autentikasi
- **Respons Autentikasi:** Django mengirimkan respons (sukses/gagal)
- **Tampilan Menu:** Jika autentikasi berhasil, menu ditampilkan di Flutter

# Implementasi Checklist

## Membuat Halaman Login

1. **Membuat file baru pada folder screens**
- Membuat file baru bernama login.dart, kemudian isi dengan program berikut:
  ```dart
  import 'package:shopping_list/screens/menu.dart';
  import 'package:flutter/material.dart';
  import 'package:pbp_django_auth/pbp_django_auth.dart';
  import 'package:provider/provider.dart';

  void main() {
      runApp(const LoginApp());
  }

  class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          title: 'Login',
          theme: ThemeData(
              primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      );
      }
  }

  class LoginPage extends StatefulWidget {
      const LoginPage({super.key});

      @override
      _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();

      @override
      Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
          return Scaffold(
              appBar: AppBar(
                  title: const Text('Login'),
              ),
              body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                  labelText: 'Username',
                              ),
                          ),
                          const SizedBox(height: 12.0),
                          TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                              ),
                              obscureText: true,
                          ),
                          const SizedBox(height: 24.0),
                          ElevatedButton(
                              onPressed: () async {
                                  String username = _usernameController.text;
                                  String password = _passwordController.text;

                                  final response = await request.login("https://darryl-nawawi-tugas.pbp.cs.ui.ac.id/login/?next=//auth/login/", {
                                  'username': username,
                                  'password': password,
                                  });
                      
                                  if (request.loggedIn) {
                                      String message = response['message'];
                                      String uname = response['username'];
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyHomePage()),
                                      );
                                      ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                              SnackBar(content: Text("$message Selamat datang, $uname.")));
                                      } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              title: const Text('Login Gagal'),
                                              content:
                                                  Text(response['message']),
                                              actions: [
                                                  TextButton(
                                                      child: const Text('OK'),
                                                      onPressed: () {
                                                          Navigator.pop(context);
                                                      },
                                                  ),
                                              ],
                                          ),
                                      );
                                  }
                              },
                              child: const Text('Login'),
                          ),
                      ],
                  ),
              ),
          );
      }
  }
  ```

2. **Pada file main.dart, pada Widget MaterialApp(...), ubah home: MyHomePage() menjadi home: LoginPage()**

## Mengintegrasikan sistem autentikasi Django dengan Flutter
### Django File

1. **Membuat django-app bernama authentication pada project Django**
- Masukkan pada terminal django
  ```
  django-admin startapp authentication
  ```

2. **Tambahkan authentication ke INSTALLED_APPS**
- Tambahkan pada main project settings.py

3. **Jalankan perintah pip install django-cors-headers**

4. **Tambahkan corsheaders ke INSTALLED_APPS**
- Tambahkan pada main project settings.py

5. **Tambahkan hal berikut ke dalam settings.py**
- ```python
  corsheaders.middleware.CorsMiddleware
  CORS_ALLOW_ALL_ORIGINS = True
  CORS_ALLOW_CREDENTIALS = True
  CSRF_COOKIE_SECURE = True
  SESSION_COOKIE_SECURE = True
  CSRF_COOKIE_SAMESITE = 'None'
  SESSION_COOKIE_SAMESITE = 'None'
  ```

6. **Buat metode view untuk login**
- Masukkan program ini pada authentication/views.py
  ```python
  from django.shortcuts import render
  from django.contrib.auth import authenticate, login as auth_login
  from django.http import JsonResponse
  from django.views.decorators.csrf import csrf_exempt

  @csrf_exempt
  def login(request):
      username = request.POST['username']
      password = request.POST['password']
      user = authenticate(username=username, password=password)
      if user is not None:
          if user.is_active:
              auth_login(request, user)
              # Status login sukses.
              return JsonResponse({
                  "username": user.username,
                  "status": True,
                  "message": "Login sukses!"
                  # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
              }, status=200)
          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login gagal, akun dinonaktifkan."
              }, status=401)

      else:
          return JsonResponse({
              "status": False,
              "message": "Login gagal, periksa kembali email atau kata sandi."
          }, status=401)

7. **Menambahkan URL routing terhadap fungsi yang sudah dibuat**
- Buat file urls.py pada folder authentication dan isi sebagai berikut
  ```python
  from django.urls import path
  from authentication.views import login

  app_name = 'authentication'

  urlpatterns = [
      path('login/', login, name='login'),
  ]
  ```

8. **tambahkan path('auth/', include('authentication.urls')), pada file shopping_list/urls.py**

### Flutter File

1. **Install package berikut**
- Ketik di dalam terminal flutter sebagai berikut:
  ```
  flutter pub add provider
  flutter pub add pbp_django_auth
  ```

2. **Memodifikasi root widget**
- Mofikasi untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider
```dart
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Flutter App',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                    useMaterial3: true,
                ),
                home: MyHomePage()),
            ),
        );
    }
}
```

## Membuat model kustom sesuai dengan proyek aplikasi Django

1. **Bukalah endpoint JSON yang sudah dibuat sebelumnya**
- Buka site ini https://darryl-nawawi-tugas.pbp.cs.ui.ac.id/json/

2. **Salinlah data JSON dan buka situs web Quicktype**
- Buka website berikut ini https://app.quicktype.io

3. **Pada website Quicktype**
- Ubahlah setup name menjadi Product, source type menjadi JSON, dan language menjadi Dart. Tempel data JSON yang telah disalin sebelumnya ke dalam textbox yang tersedia pada Quicktype. Klik pilihan Copy Code pada Quicktype.

4. **Buatlah file baru pada folder lib/models**
- Buat file baru dengan nama product.dart kemudian isi dengan kode yang sudah disalin dari Quicktype

## Fetch Data dari Django Untuk Ditampilkan ke Flutter

### Menambahkan Dependensi HTTP

1. **Install package berikut**
- Ketik di dalam terminal flutter sebagai berikut:
  ```
  flutter pub add http
  ```

2. **Menambahkan kode pada file android/app/src/main/AndroidManifest.xml**
- Tambahkan kode berikut ini:
  ```xml
  ...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
  ...
  ```

### Melakukan Fetch Data dari Django

1. **Membuat file baru dengan nama golf_list.dart di lib/screens**
- Masukkan kode berikut dan sesuaikan dengan ketentuan soal untuk menampilkan name, amount, dan description dari masing-masing item
  ```dart
  import 'package:darryl_benua_sport/screens/eurogolf_detail.dart';
  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;
  import 'dart:convert';
  import 'package:darryl_benua_sport/models/product.dart';
  import 'package:darryl_benua_sport/widgets/left_drawer.dart';

  class ProductPage extends StatefulWidget {
      const ProductPage({Key? key}) : super(key: key);

      @override
      _ProductPageState createState() => _ProductPageState();
  }

  class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct() async {
      var url = Uri.parse(
          'https://darryl-nawawi-tugas.pbp.cs.ui.ac.id/json/');
      var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
      );

      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object Product
      List<Product> list_product = [];
      for (var d in data) {
          if (d != null) {
              list_product.add(Product.fromJson(d));
          }
      }
      return list_product;
  }

  // di dalam class _ProductPageState

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
          title: const Text('Product'),
          ),
          drawer: const LeftDrawer(),
          body: FutureBuilder(
              future: fetchProduct(),
              builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                  } else {
                      if (!snapshot.hasData) {
                      return const Column(
                          children: [
                          Text(
                              "Tidak ada data produk.",
                              style:
                                  TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                          ],
                      );
                  } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                              var product = snapshot.data![index];
                              return InkWell(
                                  onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EuroGolfDetailPage(product: product),
                                          ),
                                      );
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                              Text(
                                                  product.fields.name,
                                                  style: const TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight.bold,
                                                  ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(product.fields.amount.toString()),
                                              const SizedBox(height: 10),
                                              Text(product.fields.description)
                                          ],
                                      ),
                                  ),
                              );
                          }
                      );
                  }
              }
          },
      ));
  }
  }

2. **Tambahkan halaman list_product.dart ke widgets/left_drawer.dart**
- Tambahkan kode berikut:
  ```dart
  // Kode ListTile Menu
  ...
  ListTile(
      leading: const Icon(Icons.shopping_basket),
      title: const Text('Daftar Produk'),
      onTap: () {
          // Route menu ke halaman produk
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductPage()),
          );
      },
  ),
  ...
  ```

3. **Ubah fungsi tombol Lihat Produk pada halaman utama**
- Lakukan juga redirection dengan menambahkan else if setelah kode if(...){...} di bagian akhir onTap: () { } yang ada pada file widgets/shop_card.dart
```dart
...
else if (item.name == "Lihat Produk") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductPage()));
      }
...
```

4. **Impor file yang dibutuhkan**

## Integrasi Form Flutter Dengan Layanan Django
### Django File

1. **Buat sebuah fungsi view baru pada main/views.py**
- Isi dengan program berikut
  ```python
  @csrf_exempt
  def create_product_flutter(request):
      if request.method == 'POST':
          
          data = json.loads(request.body)

          new_product = Product.objects.create(
              user = request.user,
              name = data["name"],
              price = int(data["price"]),
              description = data["description"]
          )

          new_product.save()

          return JsonResponse({"status": "success"}, status=200)
      else:
          return JsonResponse({"status": "error"}, status=401)
  ```

2. **Menambah path baru pada main/urls.py**
- Isi path baru sebagai berikut:
  ```python
  path('create-flutter/', create_product_flutter, name='create_product_flutter'),
  ```

### Flutter file

1. **Menghubungkan halaman shoplist_form.dart dengan CookieRequest**
- Tambahkan kode berikut
  ```dart
  ...
  @override
  Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();

      return Scaffold(
  ...
  ```

2. **Mengubah perintah pada onPressed: () button**
- Berikut perubahannya
  ```dart
  ...
  onPressed: () async {
      if (_formKey.currentState!.validate()) {
          // Kirim ke Django dan tunggu respons
          final response = await request.postJson(
          "https://darryl-nawawi-tugas.pbp.cs.ui.ac.id/create-flutter/",
          jsonEncode(<String, String>{
              'name': _name,
              'price': _price.toString(),
              'description': _description,
              // TODO: Sesuaikan field data sesuai dengan aplikasimu
          }));
          if (response['status'] == 'success') {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(
              content: Text("Produk baru berhasil disimpan!"),
              ));
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
              );
          } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(
                  content:
                      Text("Terdapat kesalahan, silakan coba lagi."),
              ));
          }
      }
  },
  ...

## Implementasi fitur Logout
### Django file

1. **Membuat sebuah metode view untuk logout pada authentication/views.py**
- berikut metodenya
  ```python
  from django.contrib.auth import logout as auth_logout
  ...
  @csrf_exempt
  def logout(request):
      username = request.user.username

      try:
          auth_logout(request)
          return JsonResponse({
              "username": username,
              "status": True,
              "message": "Logout berhasil!"
          }, status=200)
      except:
          return JsonResponse({
          "status": False,
          "message": "Logout gagal."
          }, status=401)
  ```

2. **Tambahkan path baru pada authentication/urls.py**
- Tambahkan path berikut ini:
  ```python
  path('logout/', logout, name='logout'),
  ```

### Flutter file

1. **Buka file lib/widgets/shop_card.dart**
- Tambahkan kode berikut:
  ```dart
  ...
  @override
  Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();
      return Material(
  ...
  ```

2. **Ubah perintah onTap: () {...} pada widget Inkwell menjadi onTap: () async {...}**

3. **Menambah kode ke dalam async {...} di bagian akhir**
- Berikut kodenya:
  ```dart
  ...
  // statement if sebelumnya
  // tambahkan else if baru seperti di bawah ini
  else if (item.name == "Logout") {
          final response = await request.logout(
              "https://darryl-nawawi-tugas.pbp.cs.ui.ac.id/auth/logout/");
          String message = response["message"];
          if (response['status']) {
            String uname = response["username"];
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("$message Sampai jumpa, $uname."),
            ));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("$message"),
            ));
          }
        }
  ...
  ```

## Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item

1. **Membuat file baru pada lib/screens**
- Buat file baru dengan nama eurogolf_detail.dart
  ```dart
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/models/product.dart';

  class EuroGolfDetailPage extends StatelessWidget {
    
    final Product product;

    const EuroGolfDetailPage({Key? key, required this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(product.fields.name),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${product.fields.name}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text('Price: Rp${product.fields.price.toString()}'),
                      const SizedBox(height: 10),
                      Text('Amount: ${product.fields.amount.toString()}'),
                      const SizedBox(height: 10),
                      Text('Category: ${product.fields.category}'),
                      const SizedBox(height: 10),
                      Text('Date Added: ${product.fields.dateAdded}'),
                      const SizedBox(height: 10),
                      Text('Description: ${product.fields.description}'),
                    ],
                  ),
                ),
              ),
          ),
        )
      );
    }
  }
  ```

2. **Buka file golf_list.dart**
- Tambahkan kode berikut untuk menangani saat user memencet item
  ```dart
  onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EuroGolfDetailPage(product: product),
          ),
      );
  },
  ```

# Bonus

## Fitur registrasi
### Flutter file

1. **Membuat file baru di lib/screens**
- Buat file baru dengan nama register.dart

2. **Mengisi file berikut**
- Isi dengan kode berikut
  ```dart
  import 'package:flutter/material.dart';
  import 'package:darryl_benua_sport/screens/login.dart';
  import 'package:pbp_django_auth/pbp_django_auth.dart';
  import 'package:provider/provider.dart';
  import 'package:http/http.dart' as http;

  class RegistrationPage extends StatefulWidget {
    const RegistrationPage({Key? key}) : super(key: key);

    @override
    _RegistrationPageState createState() => _RegistrationPageState();
  }

  class _RegistrationPageState extends State<RegistrationPage> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();

    @override
    Widget build(BuildContext context) {
      // ignore: unused_local_variable
      final request = context.watch<CookieRequest>();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 36.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      String confirmPassword = _confirmPasswordController.text;

                      if (password != confirmPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Passwords do not match"),
                          ),
                        );
                        return;
                      }

                      try {
                        if (password.length < 8) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Password must be at least 8 characters long"),
                            ),
                          );
                          return;
                        }
                        if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
                            .hasMatch(password)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Password must contain at least 1 uppercase letter, 1 lowercase letter, and 1 number"),
                            ),
                          );
                          return;
                        }

                        final response = await http.post(
                          Uri.parse('http://localhost:8000/auth/register/'),
                          body: {
                            'username': username,
                            'password': password,
                          },
                        );

                        if (response.statusCode == 400) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Registration failed. Please try again."),
                            ),
                          );
                          // Navigate to login page or other screen
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Registration successful!"),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        }
                      } catch (e) {
                        print("Error during registration: $e");
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "An error occurred. Please try again later."),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    @override
    void dispose() {
      _usernameController.dispose();
      _passwordController.dispose();
      super.dispose();
    }
  }
  ```

3. **Menambahkan kode untuk register di login.dart**
- berikut kode yang ditambahkan:
  ```dart
  SizedBox(height: 20),
  Text(
    'Don`t have an account yet?',
    style: TextStyle(fontSize: 16),
  ),
  SizedBox(height: 20),
  ElevatedButton(
    onPressed: () {
      // Navigate to registration page
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const RegistrationPage()),
      );
    },
    child: const Text('Register'),
  ),
  ```

### Django file

1. **Buat metode view baru di views.py pada authentication**
- Menambahkan metode baru sebagai berikut:
  ```python
  @csrf_exempt
  def register(request):
      if request.method == "POST":
          username = request.POST.get('username')
          password = request.POST.get('password')

          new_user = User.objects.create_user(username=username, password=password)
              
          return JsonResponse({
              "status": True,
              "message": "Account created successfully!",
              "user_id": new_user.id,
          }, status=200)
      
      return JsonResponse({
          "status": False,
          "message": "Invalid request method."
      }, status=405)
  ```

2. **Menambahkan path di urls.py**
- Menambahkan path sebagai berikut:
  ```
  path('register/', register, name='register'),
  ```