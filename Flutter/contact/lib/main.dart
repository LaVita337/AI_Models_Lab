import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 0;
  var name = ['person1', 'person2', 'person3'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('hello'),
                    Text('hello'),
                    Text('hello'),
                  ],
                ));
              });
        },
      ),
      appBar: AppBar(
        title: Text("Everyone's pet"),
        leading: Icon(Icons.menu),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Image.asset('dreamlikeimg.jpg'),
            title: Text(name[i]),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}

class BottomAppBar extends StatelessWidget {
  const BottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
