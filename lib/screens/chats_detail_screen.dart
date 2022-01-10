import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:training/screens/web_view.dart';
//import 'package:webview_flutter/webview_flutter.dart';

//import 'package:intl/intl.dart';
//import '../models/contacts.dart';
import 'dart:math' as math;
import 'package:training/dummy_data.dart';
import '../models/chat_model.dart';
import 'package:bubble/bubble.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:webview_flutter/webview_flutter.dart';

class ChatsDetailScreen extends StatefulWidget {
  //final User selectedPerson;
  final String userId;
  final String name;
  final int index;
  final String recieverId;

  const ChatsDetailScreen(
      {Key? key,
      required this.name,
      required this.userId,
      required this.index,
      required this.recieverId})
      : super(key: key);

  @override
  State<ChatsDetailScreen> createState() => _ChatsDetailScreenState();
}

class _ChatsDetailScreenState extends State<ChatsDetailScreen> {
  final List<Chat> chats = msgList;

  final messageController = TextEditingController();

  late String chatMsg;
  //late String recieverId;

  Widget chatsList() {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('messages')
              .doc('groupid')
              .collection(getGroupId(widget.userId, widget.recieverId))
              .doc('messages')
              .collection('msgs')
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              reverse: true,
              itemBuilder: (_, index) {
                chatMsg = snapshot.data!.docs[index]['content'].toString();
                //recieverId = snapshot.data!.docs[index].id.toString();
                //QueryDocumentSnapshot s = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {},
                  child: Bubble(
                    borderWidth: 25,
                    radius: const Radius.circular(10),
                    margin: const BubbleEdges.all(5),
                    nip: BubbleNip.leftTop,
                    alignment: Alignment.centerRight,
                    child: Text(
                      chatMsg,
                      //s.data().toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }

  Widget inputWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: const Icon(
                    Icons.insert_emoticon_outlined,
                    size: 30,
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: math.pi * 0.25,
                        child: const Icon(
                          Icons.link,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: Color(0xFF075e54),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF075e54),
            ),
            child: GestureDetector(
              onTap: () async {
                // String _groupId;

                // String _senderId = widget.userId;
                // String _recieverId = widget.recieverId;

                // _senderId.hashCode <= _recieverId.hashCode
                //     ? _groupId = _senderId + '_' + _recieverId
                //     : _groupId = _recieverId + '_' + _senderId;

                // print(_groupId);

                await FirebaseFirestore.instance
                    .collection('messages')
                    .doc('groupid')
                    .collection(getGroupId(widget.userId, widget.recieverId))
                    .doc('messages')
                    .collection('msgs')
                    .add({
                  'reciever_id': widget.recieverId,
                  'sender_id': widget.userId,
                  'content': messageController.text,
                  'timestamp': DateTime.now(),
                  'type': 'text',
                  'group_id': getGroupId(widget.userId, widget.recieverId)
                });

                // await FirebaseFirestore.instance
                //     .collection('messages')
                //     .doc('groupid')
                //     .set({
                //   'groupid': getGroupId(widget.userId, widget.recieverId)
                // });
              },
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getGroupId(String userId, String recieverId) {
    String _groupId;

    String _senderId = userId;
    String _recieverId = recieverId;

    // var _sId = _senderId.hashCode;
    // var _rId = _recieverId.hashCode;

    // _sId <= _rId ? _sId + '_' + _rId : _rId + '_' + _sId; //error was coming

    _senderId.hashCode <= _recieverId.hashCode
        ? _groupId = _senderId + '_' + _recieverId
        : _groupId = _recieverId + '_' + _senderId;

    // print(_sId);
    // print(_rId);
    return _groupId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: const Color(0xFF075e54),
        leading: Container(
          margin: EdgeInsets.zero,
          child: const Icon(Icons.arrow_back_rounded),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 20,
              //backgroundImage: NetworkImage(widget.selectedPerson.profilePic),
              child: Text(''),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(widget.name, style: const TextStyle(fontSize: 10)),
          ],
        ),
        actions: [
          const Icon(
            Icons.videocam_rounded,
            size: 30,
          ),
          const SizedBox(width: 20),
          InkWell(
            splashColor: Colors.white.withOpacity(0.7),
            radius: 12,
            child: const Icon(Icons.call),
            onTap: () async {
              var url = 'tel: 7827352065';
              try {
                await launch(url);
              } catch (e) {
                throw 'Error is $e';
              }
            },
          ),
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('View contact'),
                value: 1,
              ),
              const PopupMenuItem(
                child: Text('Media, links, and docs'),
                value: 2,
              ),
              const PopupMenuItem(
                child: Text('Search'),
                value: 3,
              ),
              const PopupMenuItem(
                child: Text('Mute notifications'),
                value: 4,
              ),
              const PopupMenuItem(
                child: Text('Wallpaper'),
                value: 5,
              ),
              const PopupMenuItem(
                child: Text('More'),
                value: 6,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          chatsList(),
          inputWidget(context),
        ],
      ),
    );
  }
}
