import 'package:darryl_benua_sport/screens/eurogolf_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:darryl_benua_sport/models/product.dart';
import 'package:darryl_benua_sport/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
    final int id;
    const ProductPage({Key? key, required this.id}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final int id = widget.id;
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
        if (d != null && d['fields']['user'] == id) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

// di dalam class _ProductPageState

@override
Widget build(BuildContext context) {
  final int id = widget.id;
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: LeftDrawer(id: id),
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