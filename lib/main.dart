import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        'im_here': (context) => ImHerePage(),
        'goodbye': (context) => GoodbyePage(),
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
            return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Test Flutter App'),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Homepage'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
                ListTile(
                  title: Text('I\'m here'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/im_here');
                  },
                ),
                ListTile(
                  title: Text('Goodbye'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/goodbye');
                  },
                ),
              ],
            ),
          ),
          body: child,
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final String myName = 'Marco';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Hello, $myName', style: TextStyle(fontSize: 24),),
    );
  }
}

class ImHerePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('I\'m here', style: TextStyle(fontSize: 24),),
    );
  }
}

class GoodbyePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Goodbye', style: TextStyle(fontSize: 24),),
    );
  }
}