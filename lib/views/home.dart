import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/helper/helper.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/aricle_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp/views/article_view.dart';
import 'dart:io';
import 'dart:ui';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> newsFeeds = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCataegories();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    newsFeeds = news.feeds;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
        onWillPop: (){
          onWillPop: showModalBottomSheet(context: context, builder: (context){
            return Container(
              decoration: BoxDecoration(
                  color: Color(0xff737373)
              ),
              height: 100,
              width: double.infinity,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)
                      ),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 20, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Do you really want to exit?",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.none
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            SizedBox(width: 5,),
                            FlatButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              color: Colors.black,
                              splashColor: Colors.yellowAccent,
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    letterSpacing: 1
                                ),
                              ),
                            ),
                            SizedBox(width: 25,),
                            FlatButton(
                              onPressed: (){
                                exit(0);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              color: Colors.white30,
                              splashColor: Colors.yellowAccent,
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 1,
                                    color: Colors.black
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } );
        },
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Fast"),
                Text(
                  'News',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            elevation: 0,
          ),
          body: _loading
              ? Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          )
              : Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTitle(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].contegoryName);
                    },
                    itemCount: categories.length,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Feeds(
                            imageUrl: newsFeeds[index].imageUrl,
                            title: newsFeeds[index].title,
                            description: newsFeeds[index].description,
                            url: newsFeeds[index].url);
                      },
                      itemCount: newsFeeds.length,
                    ),
                  ),
                ),
              ],
            ),
          ))
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTitle({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                categoryName,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Feeds extends StatelessWidget {
  Feeds({this.imageUrl, this.title, this.description, this.url});

  final imageUrl, title, description, url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(
          url
        )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            ClipRRect(
              child: CachedNetworkImage(imageUrl: imageUrl),
              borderRadius: BorderRadius.circular(6),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(color: Colors.black45),
            )
          ],
        ),
      ),
    );
  }
}
