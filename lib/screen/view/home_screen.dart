import 'package:flutter/material.dart';
import 'package:news/screen/provider/news%20provider.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<newsProvider>(context, listen: false).loadnews();
  }

  newsProvider? providerT;
  newsProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<newsProvider>(context, listen: true);
    providerF = Provider.of<newsProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(Icons.clear_all, color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_none, color: Colors.black),
            ),
          ],
        ),
        body:
            // providerT!.data.articles!.isEmpty?CircularProgressIndicator(color: Colors.black,):
            Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Trending",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Recent",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${providerT!.data.articles![0].urlToImage}'),
                        fit: BoxFit.cover)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: Icon(
                              Icons.bookmark_add_outlined,
                              color: Colors.white,
                              size: 30,
                            )),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      "${providerT!.data.articles![0].title}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ]),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Latest News",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25),
                  ),
                  Spacer(),
                  Text(
                    "See More",
                    style: TextStyle(fontSize: 18, color: Colors.amber),
                  )
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'dashScreen');
                    },
                    child: ListTile(
                        trailing: Icon(Icons.bookmark_add_sharp),
                        subtitle: Text(
                            '${providerT!.data.articles![index].publishedAt}',style: TextStyle(fontSize: 8)),
                        leading: Container(
                          height: 200,
                          width: 120,
                          color: Colors.red,
                          child: Image.network(
                              "${providerT!.data.articles![index].urlToImage}",
                              fit: BoxFit.cover),
                        ),
                        title: Container(
                          height: 50,
                          width: double.infinity,
                          child: Text(
                            "${providerT!.data.articles![index].title}",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                ),
                itemCount: providerT!.data.articles!.length,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
