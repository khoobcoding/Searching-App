import 'package:demo/Searchingapp.dart';
import 'package:flutter/material.dart';

class mysearchdelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              Navigator.pop(context);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredlist = suggestedlist.where((element) {
      final filtering = element.toLowerCase().contains(query);
      return filtering;
    }).toList();
    return ListView.builder(
      itemCount: filteredlist.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredlist[index]),
          onTap: () {
            query = filteredlist[index];
            showResults(context);
          },
        );
      },
    );
  }
}
