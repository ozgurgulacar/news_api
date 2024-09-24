import 'package:flutter/material.dart';

import '../ViewModel/AllNewsViewModel.dart';

class AllNewsPage extends StatefulWidget {
  const AllNewsPage({super.key});

  @override
  State<AllNewsPage> createState() => _AllNewsPageState();
}

class _AllNewsPageState extends AllNewsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [
          Container(width: 50,child: IconButton(onPressed: () {
            backPage();
          },icon: Icon(Icons.arrow_back_outlined))),
           Column(
            children: [
              Icon(Icons.newspaper_outlined),
              Text("Page $page")
            ],
          ),
          Container(width: 50,child: IconButton(onPressed: () {
            nextPage();
          },icon: Icon(Icons.arrow_forward_outlined)))
        ],
        title: const Text("NEWS"),
        backgroundColor: Colors.blueGrey,
        //centerTitle: true,
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
