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