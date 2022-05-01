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
                    return NextScreen(name: _nameFieldController.text,);
                  });

                  Navigator.of(context).push(router);
              },
              child: Text("Send to Second Screen"), 
              ),
          )
        ],
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  final String name;
  const NextScreen({ Key? key, required this.name }) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var _backTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(widget.name),
          ),
          TextField(
            controller: _backTextFieldController,

          ),
          ElevatedButton(
            onPressed: (() {
              Navigator.pop(context, );
            }),
             child: Text('Send Back')
            )
        ],
      ),
    );
  }
}
