import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  // Kullanıcı verileri ve kitap verileri burada alınmalıdır.
  // Bu örnekte varsayılan değerler kullanılmıştır.
  final List<User> users = [
    User(id: 1, name: 'KULLANICI 1'),
    User(id: 2, name: 'KULLANICI  2'),
    // Diğer kullanıcılar...
  ];

  final List<Book> books = [
    Book(id: 1, title: 'KİTAP 1', author: 'YAZAR 1'),
    Book(id: 2, title: 'KİTAP 2', author: 'YAZAR  2'),
    // Diğer kitaplar...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KULLANICI'),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Book> getBooksForUser(int userId) {
    // Bu metot, belirli bir kullanıcının kitaplarını döndürmelidir.
    // Gerçek veri kaynağınıza bağlı olarak bu metodu uyarlamalısınız.
    // Örneğin, kullanıcının paylaştığı kitapları veya başvurduğu kitapları alabilirsiniz.
    return books; // Örnek olarak tüm kitapları döndürdük.
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
