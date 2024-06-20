import 'package:elearn/models/module.dart';
import 'package:elearn/models/topic.dart';
import 'package:elearn/services/moduleServices.dart';
import 'package:elearn/services/topicServices.dart';
import 'package:elearn/views/Home/widgets/topicsWidget.dart';
import 'package:elearn/widgets/eAppBarTitle.dart';
import 'package:elearn/widgets/eCircularProgressIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List<Module> modules = [];
  List<Topic> topicsInModule = [];
  List<List<Topic>> topicsInAllModules = [];
  bool isFetchingModules = true;
  bool isFetchingTopics = true;

  @override
  void initState() {
    super.initState();
    fetchModules();
  }

  Future<void> fetchModules() async {
    List<Module> fetchedModules = await ModuleServices.fetchModules();
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      modules = fetchedModules;
      isFetchingModules = false;
    });
    fetchAllTopics();
  }

  Future<void> fetchAllTopics() async{
    await  Future.delayed(const Duration(milliseconds: 1500));
    for (var module in modules) {
      List<Topic> fetchedTopic = await TopicServices.fetchTopicsInModule(module.moduleId);
      topicsInAllModules.add(fetchedTopic);
      fetchedTopic = [];
    }
    setState(() {
      isFetchingTopics = false;
    });
    print("All topics in total : ${topicsInAllModules.length}");
  }

  Future<void> fetchTopicsInModule(int moduleId) async {
    List<Topic> fetchedTopic = await TopicServices.fetchTopicsInModule(moduleId);
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      topicsInModule = fetchedTopic;
      isFetchingTopics = false;
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: modules.length,
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                    ),
                  );
                },
              ),
            ),
            title: EAppBarTitle(
              appBarTitle: "e-Learning",
              context: context,
            ),
            elevation: 7,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.profile_circled,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
            backgroundColor: Theme.of(context).colorScheme.background,
            bottom: isFetchingModules
                ? const PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: Center(
                      child: ECircularProgressIndicator(),
                    ),
                  )
                : TabBar(
                    indicatorColor: Theme.of(context).colorScheme.inversePrimary,
                    isScrollable: true,
                    labelColor: Theme.of(context).colorScheme.inversePrimary,
                    unselectedLabelColor: Colors.black,
                    tabs: modules.map((module) => Tab(text: module.moduleName)).toList(),
                  ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: isFetchingTopics
              ? const Center(child: ECircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TabBarView(
                    // controller: TabController(length: modules.length, vsync: TickerProvider()),
                    physics: const BouncingScrollPhysics(),
                    children: topicsInAllModules.map((module) {
                      if (isFetchingTopics) {
                        return const Center(child: ECircularProgressIndicator());
                      }
                      return TopicsWidget(
                        topics: module
                      );
                    }).toList(),
                  ),
              ),
        ),
      ),
    );
  }
}
