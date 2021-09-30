import 'package:flutter/material.dart';
import 'package:proyecto/pages/cinepolis.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<StatefulWidget> createState() {
    return _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  final Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista de compras'), backgroundColor: Colors.teal,),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: widget.products.map((Product product) {
            return ShoppingListItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleCartChanged,
            );
          }).toList(),
        ));
  }
}

class Product {
  final String name;
  Product({required this.name});
}

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final Function onCartChanged;

  ShoppingListItem({required this.product, required this.inCart, required this.onCartChanged})
      : super(key: ObjectKey(product));

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: CircleAvatar(
        backgroundColor: Color(0xFF0F735F),
        child: Text(product.name[0]),
      ),
    );
  }
}

class ListShopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingList(
        products: <Product>[
          Product(name: 'Sandia'),
          Product(name: 'Naranja'),
          Product(name: 'Pera'),
          Product(name: 'Manzana'),
          Product(name: 'Platano'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFF0F735F),
        tooltip: 'Cambiar',
        onPressed: ()=>{
          Navigator.push(
              context, MaterialPageRoute(builder: (context)=> Cinepolis() )
          )
        },
        label: const Text('Cinepolis'),
        icon: const Icon(Icons.add_business_rounded),
      ),
    );
  }
}