// DrawerComponent.dart

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../controller/helper_classes/firebase_firestore_helper.dart';
import '../../models/resources.dart';
import '../screens/bildirimler.page.dart';
import '../screens/user_page.dart';
import '../screens/basvurular_page.dart';


class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Builder(builder: (context) {
        return Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                color: Colors.blueGrey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        person?.displayName ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'EDA',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    buildListButton("KULLANICI", () {
                      navigateToNewPage("KULLANICI SAYFASI");
                    }),
                    buildListButton("BAŞVURULAR", () {
                      navigateToNewPage("Başvurular Sayfası");
                    }),
                    buildListButton("BİLDİRİMLER", () {
                      navigateToNewPage("BİLDİRİM  SAYFASI");
                    }),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildListButton(String buttonText, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToNewPage(String pageTitle) {
    print("Opening $pageTitle");

    if (pageTitle == "KULLANICI SAYFASI") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UsersPage(),
      ));
    } else if (pageTitle == "Başvurular Sayfası") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BasvurularPage(),
      ));
    } else if (pageTitle == "BİLDİRİM  SAYFASI") {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BildirimlerPage(),
      ));
    } else {
      // Diğer sayfaların yönlendirmelerini buraya ekleyebilirsiniz.
    }
  }
}
