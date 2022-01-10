import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-detail-screen';

  Widget sizeContainer(double margin, String size) {
    return Container(
      height: 45,
      width: 45,
      margin: EdgeInsets.only(left: margin, top: 10),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.blue),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          size,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  Widget headings(String heading) {
    return Text(
      heading,
      style: GoogleFonts.gupter(
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.amber,
          borderRadius: BorderRadius.circular(30),
          onTap: Navigator.of(context).pop,
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
              ),
              Text(
                'back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            child: Image.network(
              'https://www.lookinggoodfurniture.com/wp-content/uploads/2018/03/Rose-Sofa-2-Seater.jpg',
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headings('Sofa Baleria'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orangeAccent,
                      ),
                      //width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: const [
                          Text('4.5'),
                          Icon(Icons.star),
                        ],
                      ),
                    ),
                    const Text('  1034 Ratings | 104 Reviews'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: 180,
                      child: headings('Rent'),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: 180,
                      child: headings('Rs 799 /month'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: 180,
                      child: const Text(
                        'Refundable Deposit',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: 180,
                      child: const Text(
                        'Rs 1899',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                /* ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: headings('Rent'),
                  trailing: headings('Rs 799 /month'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Text(
                    'Refundable Deposit',
                    style: GoogleFonts.gupter(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      color: Colors.grey,
                    ),
                  ), 
                  trailing: Text(
                    'Rs 1899',
                    style: GoogleFonts.gupter(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                      color: Colors.grey,
                    ),
                  ),
                ), */
                Row(
                  children: [
                    headings('Select Size'),
                    sizeContainer(50, '6x3'),
                    sizeContainer(8, '6x4'),
                    sizeContainer(8, '6x5'),
                    sizeContainer(8, '6x6'),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Select Tenure',
                      style: GoogleFonts.gupter(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 40,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            label: Text(
                              'Please Enter your Tenure',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.all(18),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white],
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Rent',
                    style: GoogleFonts.gupter(
                      textStyle:
                          const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  'Rs 5039 for 36Month',
                  style: GoogleFonts.gupter(
                    textStyle:
                        const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 15),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
