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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Hello, Marco'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('I\'m here'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/im_here');
              },
            ),
            ListTile(
              title: Text('Goodbye'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/goodbye');
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
        title: Text('I\'m here'),
      ),
      body: Center(
        child: Text('I\'m here'),
      ),
    );
  }
}

class GoodbyePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goodbye'),
      ),
      body: Center(
        child: Text('Goodbye'),
      ),
    );
  }
}