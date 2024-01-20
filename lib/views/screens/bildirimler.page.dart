// BildirimlerPage.dart

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../controller/helper_classes/firebase_firestore_helper.dart';
import '../../models/resources.dart';

class BildirimlerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bildirimler'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestoreHelper.getNotificationsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          } else {
            List<MyNotification> notifications = FirebaseFirestoreHelper.parseNotifications(snapshot.data!);

            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notifications[index].title),
                  subtitle: Text(notifications[index].message),
                );
              },
            );
          }
        },
      ),
    );
  }
}
