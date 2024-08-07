// import 'package:f2c/Provider/Productprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: Consumer<ProductProvider>(
//         builder: (context, productProvider, child) {
//           return ListView.builder(
//             itemCount: productProvider.cart.length,
//             itemBuilder: (context, index) {
//               final product = productProvider.cart[index];
//               return ListTile(
//                 leading: Image.asset(product.imagePath),
//                 title: Text(product.name),
//                 subtitle: Text('${product.price} - ${product.grams}'),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class WishlistScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Wishlist'),
//       ),
//       body: Consumer<ProductProvider>(
//         builder: (context, productProvider, child) {
//           return ListView.builder(
//             itemCount: productProvider.wishlist.length,
//             itemBuilder: (context, index) {
//               final product = productProvider.wishlist[index];
//               return ListTile(
//                 leading: Image.asset(product.imagePath),
//                 title: Text(product.name),
//                 subtitle: Text('${product.price} - ${product.grams}'),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:f2c/Provider/Productprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          return ListView.builder(
            itemCount: productProvider.cart.length,
            itemBuilder: (context, index) {
              final product = productProvider.cart[index];
              return Card(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset(
                        product.imagePath,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              product.price,
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              product.grams,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
