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
          } else if (item.name == "Lihat Item") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductListPage(iron: Ironlist)));
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