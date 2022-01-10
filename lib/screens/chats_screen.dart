import 'package:flutter/material.dart';
import 'package:training/sample.dart';
import 'package:training/screens/chats_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../dummy_data.dart';
//import 'package:intl/intl.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen(
      {Key? key,
      required this.email,
      required this.phone,
      required this.userId})
      : super(key: key);

  final String userId;
  //final DocumentSnapshot snapshot;
  final String? email;

  final String? phone;

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final contacts = dummyData;

  late String name;
  late String recieverId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  String nname = name;

                  recieverId = snapshot.data!.docs[index].id.toString();

                  String rId = recieverId;
                  //QueryDocumentSnapshot s = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () {
                      // print(nname);
                      // print(index);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return ChatsDetailScreen(
                              userId: widget.userId,
                              name: nname,
                              index: index,
                              recieverId: rId,
                            );
                          },
                        ),
                      );
                    },
                    splashColor: Colors.white,
                    child: ListTile(
                      leading: Text('${index + 1}'),
                      title: Text(name),
                      subtitle: Text(snapshot.data!.docs[index].id.toString()),
                    ),
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
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     widget.email == null
      //         ? const Text('Email not found')
      //         : Text('Email = ${widget.email}'),
      //     widget.phone == null
      //         ? const Text('Phone number not available')
      //         : Text('Phone number = ${widget.phone}'),
      //   ],
      // ),
      // body: ListView.separated(
      //   itemBuilder: (ctx, index) {
      //     return ListTile(
      //       leading: CircleAvatar(
      //         radius: 30,
      //         backgroundImage: NetworkImage(contacts[index].profilePic),
      //       ),
      //       title: Text(contacts[index].name),
      //       subtitle: Text(contacts[index].id),
      //       trailing: Text(DateFormat('hh:mm a').format(contacts[index].time)),
      //       onTap: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (_) {
      //               return ChatsDetailScreen(selectedPerson: contacts[index], userId: widget.userId,);
      //             },
      //           ),
      //         );
      //       },
      //     );
      //   },
      //   separatorBuilder: (_, index) {
      //     return const Divider();
      //   },
      //   itemCount: contacts.length,
      // ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.message),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return const StreamExample();
              },
            ),
          );
        },
        backgroundColor: Colors.amber,
      ),
    );
  }
}
