import 'package:flutter/material.dart';
//import 'package:training/models/trending_products_model.dart';
import '../screens/product_detail_screen.dart';
import '../dummy_data.dart';

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName),
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        //padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, i) => Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    items[i].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(items[i].name),
                Text('\$${items[i].amount} /month'),
              ],
            ),
          ),
          itemCount: items.length,
        ),
      ),
    );
  }
}
