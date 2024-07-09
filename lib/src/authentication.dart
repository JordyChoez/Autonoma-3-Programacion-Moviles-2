import 'package:flutter/material.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({super.key, required this.loggedIn, required this.signOut});

  final bool loggedIn;
  final VoidCallback signOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (loggedIn)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: signOut,
              child: const Text('Sign Out'),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/sign-in');
              },
              child: const Text('RSVP'),
            ),
          ),
      ],
    );
  }
}
