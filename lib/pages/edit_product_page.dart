import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({Key? key}) : super(key: key);
  static const routeName = 'edit-product';

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  // オートフォーカスのために各TextFormに設定
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>(); // FormにアクセスするためのKey
  var _editedProduct = Product(
    // 商品の初期化
    id: 'nothing',
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };
  var _isInit = true;

  // 初回build時のみ呼ばれる
  @override
  void initState() {
    // imageUrlFocusNodeのフォーカスを監視
    // 変化があれば`_updateImageUrl`を呼び出し
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  // Stateオブジェクトの依存関係が変更された時に呼び出し
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments;
      if (productId != null) {
        _editedProduct = Provider.of<Products>(context, listen: false)
            .findById(productId as String);
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          'imageUrl': '',
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  // メモリリークを防止
  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  // imageUrlのテキストフィールドからフォーカスノードが変更された時に
  // previewを表示
  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if (_imageUrlController.text.isEmpty ||
          (!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  // フォームの保存
  void _saveForm() {
    // バリデーションチェック
    final isValid = _form.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    _form.currentState?.save();
    // 新規 or 既存 商品の判定
    if (_editedProduct.id != 'nothing') {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['title'],
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.bodyMedium,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please set the title!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = _editedProduct.copyWith(title: value);
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: const InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please set the price!';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number!';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Please enter a number greater than zero!';
                  }

                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    _editedProduct =
                        _editedProduct.copyWith(price: int.parse(value));
                  }
                },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                style: Theme.of(context).textTheme.bodyMedium,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please set the description!';
                  }
                  if (value.length <= 10) {
                    return 'Should be at least 10 characters long!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = _editedProduct.copyWith(description: value);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? const Center(
                            child: Text(
                              'Enter a URL',
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        : FittedBox(
                            fit: BoxFit.fill,
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Image URL'),
                      style: Theme.of(context).textTheme.bodyMedium,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please set the image URL!';
                        }

                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a valid URL';
                        }

                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'Please enter a valid image URL';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct =
                            _editedProduct.copyWith(imageUrl: value);
                      },
                      onEditingComplete: () {
                        _saveForm();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
