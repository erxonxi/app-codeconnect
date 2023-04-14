import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String content = _contentController.text;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      floatingActionButton: content.isNotEmpty
          ? FloatingActionButton(
              onPressed: _onFloatingButtonPressed,
              child: const Icon(Icons.create_rounded),
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (String value) {
                setState(() {});
              },
              controller: _contentController,
              style: const TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.2,
              ),
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'What\'s on your mind?',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '${content.length}/512',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Icon(Icons.image_rounded),
                SizedBox(width: 16.0),
                Icon(Icons.video_call_rounded),
                SizedBox(width: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onFloatingButtonPressed() {
    final String content = _contentController.text;

    if (content.isNotEmpty) {
      Navigator.of(context).pop(content);
    }
  }
}
