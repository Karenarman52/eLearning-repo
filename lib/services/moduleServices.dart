import 'dart:convert';

import 'package:elearn/models/module.dart';
import 'package:http/http.dart' as http;

class ModuleServices {

  static Future<List<Module>> fetchModules() async {
    List<Module> modules = [];
    final response = await http.get(Uri.parse('http://172.20.10.4:3454/eLearning/modules/all'));
    print("\n\n\nResponse ${response.body}\n\n\n");
    print("\n\n\nResponse ${response.bodyBytes}\n\n\n");
    print("\n\n\nResponse ${response.contentLength}\n\n\n");
    print("\n\n\nResponse ${response.headers}\n\n\n");
    print("\n\n\nResponse ${response.isRedirect}\n\n\n");
    print("\n\n\nResponse ${response.persistentConnection}\n\n\n");
    print("\n\n\nResponse ${response.reasonPhrase}\n\n\n");
    print("\n\n\nResponse ${response.request}\n\n\n");
    print("\n\n\nResponse ${response.statusCode}\n\n\n");
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      final List<Module> fetchedModules = responseData.map((data) => Module.fromJson(data)).toList();
      modules = fetchedModules;
    print("\n\n\nfetchedModules : ${fetchedModules}\n\n\n");
      print('\n\nSuccessfully ✅✅✅ loaded Modules\n\n\n');
      return modules;
    } else {
      // Handle error
      print('\n\n\nFailed 😥️😥️😥️ to load Modules\n\n\n');
      return modules;
    }
  }
  
}