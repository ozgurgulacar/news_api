import 'package:flutter/material.dart';
import 'package:news_api/View/AllNewsPage.dart';
import 'package:news_api/View/SearchNewsPage.dart';
import 'package:news_api/View/TopNewsPage.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _HomepageState();
}

class _HomepageState extends State<TabBarPage> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        /*appBar: AppBar(
          title: const Text("NEWS"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),*/
        floatingActionButton: FloatingActionButton.extended(onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SearchNewsPage(),
            ),
          );        } , label: Icon(Icons.search)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        bottomNavigationBar: const BottomAppBar(
          notchMargin: 8,
          shape: CircularNotchedRectangle(),
          child: TabBar(
            labelColor: Colors.red,
            tabs: [
            Tab(icon: Icon(Icons.newspaper_outlined), text: "ALL NEWS"),
            Tab(icon: Icon(Icons.newspaper_outlined), text: "TOP-NEWS"),
          ],
        ),),
        body:  const TabBarView(children: [
          AllNewsPage(), TopNewsPage()
        ],
        ),
      ),
    );
  }
}
