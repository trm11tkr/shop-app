import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({Key? key}) : super(key: key);
  static const routeName = 'edit-product';

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
