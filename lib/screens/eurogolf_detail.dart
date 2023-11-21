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