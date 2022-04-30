import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
             icon: Icon(Icons.settings)
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _nameFieldController,
              decoration: InputDecoration(
                labelText: "Enter Your Name" 
              ),
            ),
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () {
                var router = MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NextScreen();
                  });

                  Navigator.of(context).push(router);
              },
              child: Text("Send to another Screen"), 
              ),
          )
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  const NextScreen({ Key? key }) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
    );
  }
}
