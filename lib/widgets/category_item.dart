import 'package:flutter/material.dart';
import 'package:training/models/categories.dart';
import 'package:training/screens/product_detail_screen.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key}) : super(key: key);

  final List items = [
    Categories(
      icon: const Icon(Icons.bed_rounded),
      name: 'BedRoom',
    ),
    Categories(
      icon: const Icon(Icons.bed_rounded),
      name: 'Living Room',
    ),
    Categories(
      icon: const Icon(Icons.camera_alt_outlined),
      name: 'DSLR Camera',
    ),
    Categories(
      icon: const Icon(Icons.amp_stories_rounded),
      name: 'Appliances',
    ),
    Categories(
      icon: const Icon(Icons.storage_rounded),
      name: 'Storage',
    ),
    Categories(
      icon: const Icon(Icons.playlist_add_check),
      name: 'Packages',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(ProductDetailScreen.routeName),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        //margin: const EdgeInsets.all(20),
        height: 200,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (ctx, i) => SizedBox(
              child: Column(
            children: [
              items[i].icon,
              Text(items[i].name),
            ],
          )),
          itemCount: items.length,
        ),
      ),
    );
  }
}
