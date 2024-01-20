import 'package:flutter/material.dart';

class BasvurularPage extends StatefulWidget {
  @override
  _BasvurularPageState createState() => _BasvurularPageState();
}

class _BasvurularPageState extends State<BasvurularPage> {
  final List<User> users = [
    User(id: 1, name: 'KULLANICI 1'),
    User(id: 2, name: 'KULLANICI 2'),
    // Diğer kullanıcılar...
  ];

  final List<Book> books = [
    Book(id: 1, title: 'KİTAP 1', author: 'YAZAR 1'),
    Book(id: 2, title: 'KİTAP 2', author: 'YAZAR 2'),
    // Diğer kitaplar...
  ];

  final TextEditingController applyNameController = TextEditingController();
  final TextEditingController applyDescriptionController = TextEditingController();

  final TextEditingController supplyNameController = TextEditingController();
  final TextEditingController supplyDescriptionController = TextEditingController();

  void _showApplyDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Başvuru Yap'),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: applyNameController,
                  decoration: const InputDecoration(labelText: 'Başvuru Adı'),
                ),
                TextFormField(
                  controller: applyDescriptionController,
                  decoration:
                  const InputDecoration(labelText: 'Başvuru Açıklaması'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                String applyName = applyNameController.text;
                String applyDescription = applyDescriptionController.text;

                // Başvuru yapma işlemleri buraya eklenecek.
                // applyForSupply(user.id, applyName, applyDescription);

                Navigator.of(context).pop();
              },
              child: const Text('Başvuru Yap'),
            ),
          ],
        );
      },
    );
  }

  void _showSupplyDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tedarik Paylaş'),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: supplyNameController,
                  decoration: const InputDecoration(labelText: 'Tedarik Adı'),
                ),
                TextFormField(
                  controller: supplyDescriptionController,
                  decoration:
                  const InputDecoration(labelText: 'Tedarik Açıklaması'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('İptal'),
            ),
            ElevatedButton(
              onPressed: () {
                String supplyName = supplyNameController.text;
                String supplyDescription = supplyDescriptionController.text;

                // Tedarik paylaşma işlemleri buraya eklenecek.
                // shareSupply(user.id, supplyName, supplyDescription);

                Navigator.of(context).pop();
              },
              child: const Text('Tedarik Paylaş'),
            ),
          ],
        );
      },
    );
  }

  List<Book> getBooksForUser(int userId) {
    return books;
  }

  Widget buildBookList(List<Book> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: books.map((book) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text('- ${book.title} by ${book.author}'),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Başvurular'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final userBooks = getBooksForUser(user.id);
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(user.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text('PAYLAŞILAN KİTAPLAR:'),
                  buildBookList(userBooks),
                  const SizedBox(height: 8),
                  Text('TALEP EDİLEN KİTAPLAR:'),
                  buildBookList(userBooks),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _showApplyDialog(context, user);
                        },
                        child: const Text('Başvuru Yap'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          _showSupplyDialog(context, user);
                        },
                        child: const Text('Tedarik Paylaş'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class User {
  final int id;
  final String name;

  User({required this.id, required this.name});
}

class Book {
  final int id;
  final String title;
  final String author;

  Book({required this.id, required this.title, required this.author});
}
