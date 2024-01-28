import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 18),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/im_here': (context) => ImHerePage(),
        '/goodbye': (context) => GoodbyePage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomePage());
          case '/im_here':
            return MaterialPageRoute(builder: (context) => ImHerePage());
          case '/goodbye':
            return MaterialPageRoute(builder: (context) => GoodbyePage());
          default:
            return null;
        }
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              color: Colors.blue[100],
              child: Center(
                child: Text(
                  'Hello, Marco',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            );
          } else if (index == 1) {
            return Container(
              color: Colors.green[100],
              child: Center(
                child: Text(
                  'I\'m here',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.red[100],
              child: Center(
                child: Text(
                  'Goodbye',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100, // Set the height of the DrawerHeader here
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: _currentPage == 0,
              onTap: () {
                Navigator.pop(context);
                _pageController.jumpToPage(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.sentiment_satisfied),
              title: const Text('I\'m here'),
              selected: _currentPage == 1,
              onTap: () {
                Navigator.pop(context);
                _pageController.jumpToPage(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Goodbye'),
              selected: _currentPage == 2,
              onTap: () {
                Navigator.pop(context);
                _pageController.jumpToPage(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImHerePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I\'m here'),
      ),
      body: Container(
        color: Colors.green[100],
        child: Center(
          child: Text(
            'I\'m here',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}

class GoodbyePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goodbye'),
      ),
      body: Container(
        color: Colors.red[100],
        child: Center(
          child: Text(
            'Goodbye',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}