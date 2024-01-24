import 'package:flutter/material.dart';
import 'package:myapp/model/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 61, 147, 179)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Built Value'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var url = 'https://jsonplaceholder.typicode.com/users';
  // var response = await http.get(Uri.parse(url));

  void _runcode() {}

  void _display() {
    print("Button Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Container(
        child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.data == null) {
                return Center(child: Text('No Data Available'));
              } else {
                List<dynamic> userlist = snapshot.data as List<dynamic>;

                return ListView.builder(
                  itemCount: userlist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      subtitle: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 54, 206, 244),
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(children: [
                          const Text(
                            "Name: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            userlist[index].name,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const Text(
                            "Username: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            userlist[index].username,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            userlist[index].email,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Text(
                            "Street:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            userlist[index].address.street,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const Text(
                            "City:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            userlist[index].address.city,
                            style: const TextStyle(color: Colors.black),
                          ),
                          const Text(
                            "ZipCode:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            userlist[index].address.zipcode,
                            style: TextStyle(color: Colors.black),
                          ),
                        ]),
                      ),
                    );
                  },
                );
              }
            }),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // CodeRunner.runcode();
          _display();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
