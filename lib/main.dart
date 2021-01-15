import 'package:flutter/material.dart';
import 'package:aione_music/PageViewS.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// 主页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Column(
        children: <Widget>[HomeTabs(),Container(
            child: PageView(
              children: [
                _HomeContent(),
                _HomeContent()
              ],
            ))],
      ),
    );
  }
}

class HomeTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        child: Row(
          children: <Widget>[
            _Tabs(title: '兆赫'),
            _Tabs(title: '发现'),
            _Tabs(title: '我的'),
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
class _Tabs extends StatelessWidget {
  const _Tabs({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ViewPage();
        }));
      },
      child: Container(
        width: 66.0,
        height: 29.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.red),
        child: Text(
          '$title',
          textAlign: TextAlign.center,
          style:
          TextStyle(fontSize: 16, color: Color.fromRGBO(236, 240, 241, 1.0)),
        ),
      ),
    );
  }
}

class HomePageViews extends StatefulWidget {
  @override
  _HomePageViews createState() => _HomePageViews();
}

class _HomePageViews extends State<HomePageViews> {
  PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Widget> pageList = [_HomeContent(), _HomeContent(), _HomeContent(), _HomeContent()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
              controller: controller,
              children: pageList,
            )
        )
    );
  }
}

class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.red),
      child: Text('额呵呵'),
    );
  }
}
