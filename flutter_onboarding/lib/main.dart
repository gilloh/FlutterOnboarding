import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Onboarding'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _PageDetails{
  Color backgroundColor;
  IconData mainImage;
  String mainTitle;
  String detailText;

  _PageDetails(backgroundColor, mainImage, mainTitle, detailText) {
    this.backgroundColor = backgroundColor;
    this.mainImage = mainImage;
    this.mainTitle = mainTitle;
    this.detailText = detailText;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  static Widget _buildPage(_PageDetails pageDetails) {
    return Card(
//        color: Colors.red[200],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(pageDetails.mainImage),
              title: Text('pageTitle'),
              subtitle: Text('Testing broooo'),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Buy ticketsssss'),
                    onPressed: () {
                      print('here');
                    },
                  ),
                  FlatButton(
                    child: const Text('Buy ticketsssss'),
                    onPressed: () {
                      print('here');
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }

  List<Widget> _pagesList = [
    _buildPage(_PageDetails(Colors.red, Icons.star_border, 'FirstPage', 'Detail Text')),
    _buildPage(_PageDetails(Colors.green, Icons.ac_unit, 'SecondPage', 'Detail Text')),
    _buildPage(_PageDetails(Colors.blue, Icons.satellite, 'ThirdPage', 'Detail Text')),
  ];

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding'),
        elevation: 0.2,
//        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 30.0),
        child: PageView(
          controller: _controller,
          physics: AlwaysScrollableScrollPhysics(),
          children: _pagesList,
        ),
      ),
    );
  }
}
