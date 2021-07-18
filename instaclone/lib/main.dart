import 'package:flutter/material.dart';
import 'package:instaclone/models/samplepeople.dart';
import 'package:instaclone/models/sampleposts.dart';
import 'dart:core';

import 'models/people.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instaclone',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.white),
      home: MyHomePage(title: 'Instaclone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.add),
          title: Center(
            child: Image.asset(
              'assets/images/ins.png',
              fit: BoxFit.cover,
              height: AppBar().preferredSize.height * 0.9,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.message),
            )
          ],
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              StoryWidget(),
              SizedBox(
                height: 5,
              ),
              ...posts.map((p) {
                return Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: p.dp,
                        ),
                        Padding(padding: EdgeInsets.only(right: 10)),
                        Text(p.username),
                        new Spacer(), // I just added one line
                        Icon(Icons.menu, color: Colors.black)
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Image(image: p.post),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.assignment_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.comment),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.share)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children:[
                        Text('Liked by ' + p.likes.toString()),
                      ],),
                    Row(
                      children:[
                        Text('Show Comments'),
                      ],),
                    Row(
                      children: [
                        Text(p.username.toString()+" "),
                        Text(p.caption.toString()+" ")
                      ],
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'ok',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rounded_corner),
                label: 'ok',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'ok',
              ),
            ],
          ),
        ));
  }
}

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 5),
            Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.06,
                      backgroundImage: AssetImage('assets/images/pp.jpg'),
                      /*Image.asset(
                        'assets/images/pp.jpg',
                        //fit: BoxFit.fitHeight,
                      ),*/
                    )),
                Text('Your Story')
              ],
            ),
            SizedBox(
              width: 10,
            ),
            ...(people).map((pe) {
              return Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 10),
                      height: MediaQuery.of(context).size.height * 0.12,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.06,
                        backgroundImage: pe.peopledp,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(pe.name)),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
