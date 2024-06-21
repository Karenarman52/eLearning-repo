import 'package:elearn/models/topic.dart';
import 'package:elearn/widgets/eAppBarTitle.dart';
import 'package:flutter/material.dart';

class TopicPage extends StatefulWidget {
  final Topic topic;
  TopicPage({Key? key, required this.topic}) : super(key: key);

  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: EAppBarTitle(appBarTitle: widget.topic.topicName, context: context),
      ),
    );
  }
}