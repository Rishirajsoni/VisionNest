// chat_components.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}

class User {
  final String userId;
  final String displayName;
  final bool isOwner;

  User({
    required this.userId,
    required this.displayName,
    required this.isOwner,
  });
}

class ChatService extends ChangeNotifier {
  List<Message> _messages = [];
  late User currentUser;

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  // Method to set the current user
  void setCurrentUser(User user) {
    currentUser = user;
    notifyListeners(); // Notify listeners when the user is set
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatService = Provider.of<ChatService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Us'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatService.messages.length,
              itemBuilder: (context, index) {
                var message = chatService.messages[index];
                return ListTile(
                  title: Text('${message.sender}: ${message.text}'),
                );
              },
            ),
          ),
          _ChatInput(),
        ],
      ),
    );
  }
}

class _ChatInput extends StatefulWidget {
  @override
  __ChatInputState createState() => __ChatInputState();
}

class __ChatInputState extends State<_ChatInput> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var chatService = Provider.of<ChatService>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              var messageText = _textController.text;
              if (messageText.isNotEmpty) {
                var message = Message(sender: chatService.currentUser.displayName, text: messageText);
                chatService.addMessage(message);
                _textController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
