import 'package:flutter/material.dart';
import 'package:elearn/models/topic.dart';

class TopicPage extends StatelessWidget {
  final Topic topic;

  const TopicPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic.topicName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
        children: [
          Text(topic.topicDescription),
        ],
      )
        
      ),
    );
  }
}
