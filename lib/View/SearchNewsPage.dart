import 'package:flutter/material.dart';

import '../ViewModel/SearchNewsViewModel.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends SearchNewsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
            controller: txtSearch,
            keyboardType: TextInputType.text,
            style: const TextStyle(
              color: Colors.black87,
              fontStyle: FontStyle.italic,
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {
                    searcNews();
                  }, icon: Icon(Icons.search_outlined)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: "Search News",
              suffixIconColor: Colors.redAccent,
            )),
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
                  news!.articles[index].title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  news!.articles[index].description ??
                      news!.articles[index].content?.substring(0, 100) ??
                      " ",
                  style: const TextStyle(
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
                    image: NetworkImage(news!.articles[index].urlToImage ??
                        "https://static.vecteezy.com/system/resources/thumbnails/041/444/081/small_2x/business-newspaper-isolated-daily-newspaper-mock-up-concept-transparency-with-shadow-png.png"),
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
