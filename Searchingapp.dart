import 'package:demo/searchdelegate.dart';
import 'package:flutter/material.dart';

final suggestedlist = [
  'Python',
  'Dart',
  'Java',
  'CSS5',
  'HTML',
  'C++',
  'C',
  'Php',
  'JavaScript',
  'Flutter',
  'React Native',
  'React',
  'C#',
  'Visual Basic .NET',
  'SQL',
  'Assembly language',
  'PHP',
  'R',
  'Go',
  'Classic Visual Basic',
  'MATLAB',
  'Swift',
  'Ruby',
  'Perl',
  'Objective-C',
  'Rust',
];

class SearchingApp extends StatefulWidget {
  const SearchingApp({super.key});

  @override
  State<SearchingApp> createState() => SearchingAppState();
}

class SearchingAppState extends State<SearchingApp> {
  TextEditingController textcontroller = TextEditingController();
  List<String> filteredlist = suggestedlist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Searching App ',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSearch(context: context, delegate: mysearchdelegate());
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.search),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textcontroller,
                onChanged: (value) {
                  filteredlist = suggestedlist.where((element) {
                    // final filtering = element.contains(value);
                    // For filtering data with upper and lower case
                    final filtering = element.toLowerCase().contains(value);
                    // For filtering data with all values
                    // final filtering = element.toLowerCase().startsWith(value);
                    //For filtering data with starting alphabet
                    //  final filtering = element.toLowerCase().endsWith(value);
                    //For filtering data with ending alphabet
                    return filtering;
                  }).toList();
                  setState(() {});
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 205, 208, 210),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: 'Search',
                ),
                textInputAction: TextInputAction.search,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: filteredlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredlist[index]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyDataPage(
                                  data: filteredlist[index],
                                )));
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

class MyDataPage extends StatelessWidget {
  String data;
  MyDataPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(data),
      ),
      body: Center(
        child: Text(
          data,
          style: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
    );
  }
}
