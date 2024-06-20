import 'package:elearn/models/module.dart';
import 'package:elearn/models/topic.dart';

class SubTopic {
  final int subtopicId;
  final String subtopicName;
  final String subtopicDescription;
  final Topic topic;
  final Module module;
  final String registeredDate;

  SubTopic({
    required this.subtopicId, 
    required this.subtopicName, 
    required this.subtopicDescription, 
    required this.topic, 
    required this.module, 
    required this.registeredDate
  });

  factory SubTopic.fromJson(Map<String, dynamic> json){
    return SubTopic(
      subtopicId: json['subtopicId'] ?? 0, 
      subtopicName: json['subtopicName'] ?? '', 
      subtopicDescription: json['subtopicDescription'] ?? '', 
      topic: Topic.fromJson(json['topic']), 
      module: Module.fromJson(json['module']), 
      registeredDate: json['registeredDate'] ?? ''
    );
  }
}