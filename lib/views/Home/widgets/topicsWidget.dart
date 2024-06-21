import 'package:elearn/models/topic.dart';
import 'package:elearn/theme/themeProvider.dart';
import 'package:elearn/utils/colorUtility.dart';
import 'package:elearn/views/Topic/topicPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicsWidget extends StatelessWidget {
  final List<Topic> topics;
  const TopicsWidget({super.key, required this.topics});

  @override
  Widget build(BuildContext context) {
    return topics.length == 0 ? Center(
      child: Text(
        "No Topics for this Module",
        style:  TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: Provider.of<ThemeProvider>(context).fontSize
        ),
      ),
    ):
    ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        return TopicTile(topic: topics[index]);
      },
    );
  }
}

class TopicTile extends StatelessWidget {
  const TopicTile({
    super.key,
    required this.topic,
  });

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: const  RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(21))
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder:(context) => TopicPage(topic: topic),));     
        },
        leading: Container(
          width:Provider.of<ThemeProvider>(context).fontSize + 35,
          padding: const EdgeInsets.all(7.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorUtils.getRandomColor()
          ),
          child: Center(
            child: Text(
              topic.topicName.toUpperCase()[0],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Provider.of<ThemeProvider>(context).fontSize
              ),
            ),
          ),
        ),
        title: Text(
          topic.topicName,
          style:  TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: Provider.of<ThemeProvider>(context).fontSize
          ),
        ),
        subtitle: Text(
          topic.topicDescription,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: Provider.of<ThemeProvider>(context).fontSize,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.normal
          ),
        ),
        trailing: Icon(
          CupertinoIcons.forward,
          color: Theme.of(context).colorScheme.inversePrimary,
          size: Provider.of<ThemeProvider>(context).fontSize,
        )
      ),
    );
  }
}

