import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate_consultant/pages/chat_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Define user credentials
  static const List<Map<String, String>> users = [
    {'userId': 'admin', 'password': '123'},
    {'userId': 'rishi', 'password': '1234'},
    {'userId': 'BCIIT', 'password': '0606'},
    // Add more users as needed
  ];

  String enteredUserId = '';
  String enteredPassword = '';
  String errorMessage = '';

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  enteredUserId = value;
                });
              },
              decoration: InputDecoration(labelText: 'User ID'),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  enteredPassword = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Check if the entered credentials match any user
                  final user = users.firstWhereOrNull(
                    (user) =>
                        user['userId'] == enteredUserId &&
                        user['password'] == enteredPassword,
                  );

                  if (user != null && user['userId']!.isNotEmpty) {
                    // Login successful, set the current user in ChatService
                    var chatService =
                        Provider.of<ChatService>(context, listen: false);
                    chatService.setCurrentUser(User(
                      userId: user['userId']!,
                      displayName: user['userId']!, // Use the userId as the displayName for simplicity
                      isOwner: user['userId'] == 'admin', // Assuming 'admin' is the owner
                    ));

                    // Navigate to the ChatScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(),
                      ),
                    );
                  } else {
                    // Incorrect credentials, show an error message
                    setState(() {
                      errorMessage = 'Incorrect User ID or Password';
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Add this extension function for firstWhereOrNull
extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}
