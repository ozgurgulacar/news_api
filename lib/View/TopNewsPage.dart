import 'package:flutter/material.dart';

import '../ViewModel/TopNewsViewModel.dart';


class TopNewsPage extends StatefulWidget {
  const TopNewsPage({super.key});

  @override
  State<TopNewsPage> createState() => _TopNewsPageState();
}

class _TopNewsPageState extends TopNewsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HEADLİNES NEWS"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: news?.articles.length ?? 0,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              color: Colors.white10,
              child: ListTile(
                dense: true,
                shape: Border.all(color: Colors.black, width: 1),
                title: Text(
                  news!.articles[index].title
                  ,style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                subtitle: Text(
                  news!.articles[index].description ?? news!.articles[index].content?.substring(0,100) ?? " ",
                  style:const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                leading: Container(
                  margin: EdgeInsets.all(0),
                  width: 80,
                  height: 100,
                  color: Colors.blue,
                  child: Image(
                    image: NetworkImage(
                        news!.articles[index].urlToImage ??
                            "https://static.vecteezy.com/system/resources/thumbnails/041/444/081/small_2x/business-newspaper-isolated-daily-newspaper-mock-up-concept-transparency-with-shadow-png.png"
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
