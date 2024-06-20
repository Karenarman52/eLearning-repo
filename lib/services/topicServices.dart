import 'dart:convert';

import 'package:elearn/models/topic.dart';
import 'package:http/http.dart' as http;

class TopicServices {
  static Future<List<Topic>> fetchTopicsInModule(int moduleId) async {
    List<Topic> topics = [];
    final response = await http.get(Uri.parse('http://172.20.10.4:3454/eLearing/topics/module/$moduleId'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Topic> fetchedTopics = responseData.map((data) => Topic.fromJson(data)).toList();
      topics = fetchedTopics;
      print('\n\nSuccessfully ✅✅✅ loaded Topics\n\n\n');
      return topics;
    } else {
      // Handle error
      print('\n\n\nFailed 😥️😥️😥️ to load Topics\n\n\n');
      return topics;
    }
  }
}