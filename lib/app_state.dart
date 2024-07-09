import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Importa StreamSubscription
import 'guest_book_message.dart';

enum Attending { yes, no }

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  List<GuestBookMessage> _guestBookMessages = [];
  List<GuestBookMessage> get guestBookMessages => _guestBookMessages;

  Attending _attending = Attending.no;
  Attending get attending => _attending;
  set attending(Attending attending) {
    _attending = attending;
    notifyListeners();
  }

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        notifyListeners();
        _guestBookSubscription = FirebaseFirestore.instance
            .collection('guestbook')
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
          _guestBookMessages = [];
          for (final document in snapshot.docs) {
            _guestBookMessages.add(
              GuestBookMessage(
                name: document.data()['name'] as String,
                message: document.data()['text'] as String,
              ),
            );
          }
          notifyListeners();
        });
      } else {
        _loggedIn = false;
        _guestBookMessages = [];
        _guestBookSubscription?.cancel();
        notifyListeners();
      }
    });
  }

  StreamSubscription<QuerySnapshot>? _guestBookSubscription;

  Future<DocumentReference> addMessageToGuestBook(String message) {
    if (!_loggedIn) {
      throw Exception('Must be logged in');
    }

    return FirebaseFirestore.instance.collection('guestbook').add({
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name': FirebaseAuth.instance.currentUser?.displayName,
      'userId': FirebaseAuth.instance.currentUser?.uid,
    });
  }
}
