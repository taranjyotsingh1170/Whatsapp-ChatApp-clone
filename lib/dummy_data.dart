//import 'package:flutter/cupertino.dart';

//import 'package:flutter/painting.dart';

import 'models/contacts.dart';
//import 'package:intl/intl.dart';
import './models/trending_products_model.dart';
import './models/chat_model.dart';

final dummyData = [
  User(
    id: '1',
    name: 'Commander',
    profilePic: 'https://i.ibb.co/D8YRBGF/pp-1.jpg',
    time: DateTime.now(),
    number: '8586801253'
  ),
  User(
    id: '2',
    name: 'Detective',
    profilePic: 'https://i.ibb.co/Dkv2pqQ/IMG-20210303-WA0064.jpg',
    time: DateTime.now(),
    number: '9718046054',
  ),
  User(
    id: '3',
    name: 'Pratty',
    profilePic: 'https://i.ibb.co/F0TmLfP/pp-2.jpg',
    time: DateTime.now(),
    number: '9717314756',
  ),
  User(
    id: '4',
    name: 'Sahiba',
    profilePic: 'https://i.ibb.co/6H64Zz1/IMG-20201220-WA0028.jpg',
    time: DateTime.now(),
    number: '9990021451',
  ),
  User(
    id: '5',
    name: 'Simran',
    profilePic: 'https://i.ibb.co/hZBfK49/pp-3.jpg',
    time: DateTime.now(),
    number: '9818279056',
  ),
  User(
    id: '6',
    name: 'Penguin',
    profilePic: 'https://i.ibb.co/6ZfXjdH/IMG-20200616-WA0013.jpg',
    time: DateTime.now(),
    number: '7827352065',
  ),
  User(
    id: '7',
    name: 'Apoorv',
    profilePic: 'https://i.ibb.co/MMgXCcf/pp-4.jpg',
    time: DateTime.now(),
    number: '7982307202',
  ),
  User(
    id: '8',
    name: 'Lokesh',
    profilePic: 'https://i.ibb.co/ZH26Rc1/IMG-20200911-WA0036.jpg',
    time: DateTime.now(),
    number: '9873746916',
  ),
];

const List<TrendingProductsModel> items = [
  TrendingProductsModel(
    id: 1,
    image: 'https://bit.ly/3nwvjon',
    name: 'Sofa Baleria',
    amount: 149,
    ratings: 1034,
    reviews: 98,
  ),
  TrendingProductsModel(
    id: 2,
    image: 'https://bit.ly/3nzlean',
    name: 'Dining Table',
    amount: 200,
    ratings: 569,
    reviews: 78,
  ),
  TrendingProductsModel(
    id: 3,
    image: 'https://bit.ly/3lgFIC2',
    name: 'Fabric Sofa',
    amount: 319,
    ratings: 937,
    reviews: 69,
  ),
  TrendingProductsModel(
    id: 4,
    image: 'https://bit.ly/3z4pNvn',
    name: 'Lamp',
    amount: 50,
    ratings: 1057,
    reviews: 231,
  ),
  TrendingProductsModel(
    id: 5,
    image: 'https://bit.ly/2Xp5L23',
    name: 'Almirah',
    amount: 249,
    ratings: 2563,
    reviews: 104,
  ),
  TrendingProductsModel(
    id: 6,
    image: 'https://bit.ly/3C3RYwq',
    name: 'Fan',
    amount: 300,
    ratings: 565,
    reviews: 53,
  ),
];

List<Chat> msgList = const [
  Chat('RIP'),
  Chat('Go to hell'),
  Chat('Yess'),
  Chat('No'),
  Chat('Are you mad'),
  Chat('Broo'),
  Chat('Hi'),
  Chat('Hi'),
  
  
  
  
  
  
  
  
  //Chat(msg: '9213041313', alignment: Alignment.centerLeft),
];
