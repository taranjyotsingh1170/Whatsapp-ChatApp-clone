import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// //import 'package:cloud_firestore/cloud_firestore.dart';

class StreamExample extends StatefulWidget {
  const StreamExample({Key? key}) : super(key: key);

  @override
  _StreamExampleState createState() => _StreamExampleState();
}

class _StreamExampleState extends State<StreamExample> {
  Stream<int> getData() async* {
    for (int i = 0; i < 20; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Loading');
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  name = snapshot.data!.docs[index]['email'].toString();
                  //QueryDocumentSnapshot s = snapshot.data!.docs[index];
                  return ListTile(
                    leading: Text('${index + 1}'),
                    title: Text(name),
                  );
                });

            // Center(
            //   child: Text('${snapshot.data!.docs.length}'),
            //  );
          } else {
            return const Text('');
          }
        },
      ),
    );
  }
}












// class Sample extends StatefulWidget {
//   const Sample({Key? key}) : super(key: key);
//   //final String userId;

//   @override
//   State<Sample> createState() => _SampleState();
// }

// class _SampleState extends State<Sample> {
//   String? email;

//   String? phone;

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       // body: Column(
//       //   children: [
//       //     ElevatedButton(
//       //       onPressed: () async {
//       //         DocumentSnapshot snapshot = await FirebaseFirestore.instance
//       //             .collection('users')
//       //             .doc(widget.userId)
//       //             .get();

//       //         email = (snapshot.data() as Map<String, dynamic>)['email'];
//       //         phone = (snapshot.data() as Map<String, dynamic>)['phone number'];

//       //         setState(() {});

              
//       //         print('snaphot is ${snapshot.data()} and $email + $phone');

//       //         // Center(
//       //         //   child: Text(userData.data().toString()),
//       //         // );
//       //       },
//       //       child: const Text('press'),
//       //     ),
//       //     email == null
//       //             ? const Text('Email not found')
//       //             : Text('Email = $email'),

//       //         phone == null
//       //             ? const Text('Phone number not available')
//       //             : Text('Phone number = $phone'),

//       //   ],
//       // ),
//     );
//   }
// }


