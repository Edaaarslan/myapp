//resources

//for introScreen
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/product_model.dart';

int currentPage = 0;
CarouselController carouselController = CarouselController();
dynamic person;

List viewPage = [
  {
    'Title': 'Order Your Food',
    'image': 'assets/images/stocks/1.png',
    'desc': 'Now you can order food any time right from your mobile.',
  },
  {
    'Title': 'Cooking Safe Food',
    'image': 'assets/images/stocks/2.png',
    'desc': 'We are maintain safety and We keep clean while making food.',
  },
  {
    'Title': 'Quick delivery',
    'image': 'assets/images/stocks/3.png',
    'desc': 'Orders your favourite meals will be immediately deliver',
  },
];

//for signInScreen
final GlobalKey<FormState> SignInKey = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
String? email;
String? password;
bool viewPassword = true;

//for loginScreen
final GlobalKey<FormState> logInKey = GlobalKey<FormState>();
TextEditingController emailControllerLog = TextEditingController();
TextEditingController passwordControllerLog = TextEditingController();
String? logEmail;
String? logPassword;
bool logViewPassword = true;

//for HomePage and Detail Page
List viewCategory = [
  {
    'id': 1,
    'name': 'All',
  },
  {
    'id': 2,
    'name': 'Fiction',
  },
  {
    'id': 3,
    'name': 'Psychology',
  },
  {
    'id': 4,
    'name': 'Finance',
  },
  {
    'id': 5,
    'name': 'Self-Help',
  },
];
List category = [
  {
    'id': 1,
    'name': 'Fiction',
    'img': '🍕',
  },
  {
    'id': 2,
    'name': 'Psychology',
    'img': '🍔',
  },
  {
    'id': 3,
    'name': 'Finance',
    'img': '☕️',
  },
  {
    'id': 4,
    'name': 'Selp-Help Books',
    'img': '🍦',
  },
];

List AllProducts = [
  products(
    id: 2,
    name: 'Brain Connections',
    category: 'Psychology',
    description: 'Sert kapak,360 sayfa,1. kalite',
    image: 'assets/images/stocks/p1.png',
    quantity: 1,
    price: 329,
  ),
  products(
    id: 3,
    name: 'Public Finance',
    category: '️Finance',
    description: 'Sert kapak,360 sayfa,1. kalite',
    image: 'assets/images/stocks/ff1.png',
    quantity: 1,
    price: 59,
  ),
  products(
    id: 4,
    name: 'Subtle Art',
    category: 'Self-Help',
    description: 'Sert kapak,360 sayfa,1. kalite',
    image: 'assets/images/stocks/s1.png',
    quantity: 1,
    price: 129,
  ),
  products(
    id: 1,
    name: 'Out Last Summer',
    category: 'Fiction',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/fiction/f1.png',
    quantity: 1,
    price: 459,
  ),
  products(
    id: 2,
    name: 'Creative Brain',
    category: 'Psychology',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/stocks/p2.png',
    quantity: 1,
    price: 659,
  ),
  products(
    id: 4,
    name: 'Inner Healing',
    category: 'Self-Help',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/stocks/s2.png',
    quantity: 1,
    price: 259,
  ),
  products(
    id: 3,
    name: 'Power of Invest',
    category: 'Finance',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/stocks/ff2.png',
    quantity: 1,
    price: 69,
  ),
  products(
    id: 1,
    name: 'The Secrets',
    category: 'fiction',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/fiction/f2.png',
    quantity: 1,
    price: 699,
  ),
  products(
    id: 2,
    name: 'The Human Brain',
    category: 'Psychology',
    description: '450 sayfa',
    image: 'assets/images/stocks/p3.png',
    quantity: 1,
    price: 269,
  ),
  products(
    id: 3,
    name: 'Corporate',
    category: 'Finance',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/stocks/ff3.png',
    quantity: 1,
    price: 69,
  ),
  products(
    id: 4,
    name: 'Zen',
    category: 'Self-Help',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/stocks/s3.png',
    quantity: 1,
    price: 29,
  ),
  products(
    id: 1,
    name: 'Mastermind',
    category: 'Fiction',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/fiction/f3.png',
    quantity: 1,
    price: 369,
  ),
  products(
    id: 1,
    name: 'Ink & Stars',
    category: 'Fiction',
    description: '560 sayfa',
    image: 'assets/images/fiction/f4.png',
    quantity: 1,
    price: 569,
  ),
  products(
    id: 4,
    name: 'Anxity',
    category: 'Self-Help',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/stocks/s4.png',
    quantity: 1,
    price: 69,
  ),
  products(
    id: 3,
    name: 'More Money',
    category: 'Finance',
    description: '390 sayfa',
    image: 'assets/images/stocks/ff5.png',
    quantity: 1,
    price: 99,
  ),
  products(
    id: 1,
    name: 'The Garden',
    category: 'Fiction',
    description: '900 sayfa 1. kalite',
    image: 'assets/images/fiction/f5.png',
    quantity: 1,
    price: 999,
  ),
  products(
    id: 2,
    name: 'Human Brain',
    category: 'Psychology',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/stocks/p4.png',
    quantity: 1,
    price: 369,
  ),
  products(
    id: 4,
    name: 'Power',
    category: 'Self-Help',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/stocks/s5.png',
    quantity: 1,
    price: 69,
  ),
  products(
    id: 1,
    name: '''Dragon's mother''',
    category: 'Fiction',
    description: 'Açıklama belirtilmemiş',
    image: 'assets/images/fiction/f6.png',
    quantity: 1,
    price: 859,
  ),
  products(
    id: 3,
    name: 'Shallow',
    category: 'Finance',
    description: 'Sert kapak,760 sayfa,1. kalite',
    image: 'assets/images/stocks/ff6.png',
    quantity: 1,
    price: 19,
  ),
  products(
    id: 4,
    name: 'Alchemist',
    category: 'Self-Help',
    description: 'Sert kapak,392 sayfa,1. kalite',
    image: 'assets/images/stocks/s6.png',
    quantity: 1,
    price: 99,
  ),
  products(
    id: 2,
    name: 'Typography',
    category: 'Psychology',
    description: 'Sert kapak,850 sayfa,1. kalite',
    image: 'assets/images/stocks/p5.png',
    quantity: 1,
    price: 159,
  ),
  products(
    id: 2,
    name: 'Element Spritives',
    category: 'Psychology',
    description: 'Sert kapak,400 sayfa,1. kalite',
    image: 'assets/images/stocks/p6.png',
    quantity: 1,
    price: 789,
  ),
  products(
    id: 3,
    name: 'Black freedom',
    category: 'Finance',
    description: 'Sert kapak,360 sayfa,1. kalite',
    image: 'assets/images/stocks/ff4.png',
    quantity: 1,
    price: 79,
  ),
];
class MyNotification {
  final String title;
  final String message;

  MyNotification({required this.title, required this.message});
}