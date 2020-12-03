import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Blog App",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  
                  child: ListView(
                    children: <Widget>[
                      getSearchBarUI(context),
                      Container(
                        height: 250,
                        child: Center(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                         
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                            
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.015, 0.015],
                            colors: [
                              Color.fromRGBO(209, 2, 99, 1),
                              Theme.of(context).backgroundColor
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Categories",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 60,
                        child: Center(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                           
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                       

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        
                                      );
                                    },
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                       
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Trending!",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.015, 0.015],
                            colors: [
                              Color.fromRGBO(209, 2, 99, 1),
                              Theme.of(context).backgroundColor
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GridView.builder(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        shrinkWrap: true,
                        physics: new NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                        
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                           
                          );
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.015, 0.015],
                            colors: [
                              Color.fromRGBO(209, 2, 99, 1),
                              Theme.of(context).backgroundColor
                            ],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Breaking News",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                       

                         
                        
                      ),
                    ],
                  ),
                ),
        );
      }
    
  }

  Widget getSearchBarUI(BuildContext context) {
    // Create a text controller and use it to retrieve the current value
    // of the TextField.
    final _txtSearch  = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 3, bottom: 3),
                  child: TextField(
                    controller: _txtSearch,
                    onChanged: (String txt) {},
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search News...',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
               
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.search,
                      size: 25,
                      color: Theme.of(context).backgroundColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

