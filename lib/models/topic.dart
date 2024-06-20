import 'package:elearn/models/module.dart';

class Topic {
   final int topicId;
   final String topicName;
   final String topicDescription;
   final Module module;
   final String registedDate;

  Topic({
    required this.topicId, 
    required this.topicName, 
    required this.topicDescription, 
    required this.module, 
    required this.registedDate
  });

  factory Topic.fromJson(Map<String, dynamic> json){
    return Topic(
      topicId: json['topicId'] ?? 0, 
      topicName: json['topicName'] ?? '', 
      topicDescription: json['topicDescription'] ?? '', 
      module: Module.fromJson(json['module']), 
      registedDate: json['registedDate'] ?? ''
    );
  }
}