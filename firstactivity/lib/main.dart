import 'dart:convert';

import 'package:flutter/material.dart';
import 'model/album_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: const UserScreen(title: 'User'),
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({super.key, required this.title});

  final String title;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  
  late Future<List<Album>> futureAlbumsList;

  Future<List<Album>> fetchAlbums() async{
    Uri uriobject = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    
    final response = await http.get(uriobject);

    if(response.statusCode == 200){
      List <dynamic> parsedListJson = jsonDecode(response.body);
      List<Album> itemsList = List<Album>.from(
        parsedListJson.map<Album>(
          (dynamic user) => Album.fromJson(user),
        )
      );
      return itemsList;
      }

      else{
          throw Exception('Failed to find json');
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbumsList = fetchAlbums();
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: fetchAlbums(), 
          builder: ((context, snapshot) {
            print(snapshot);
          if (snapshot.hasData) {
           return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                var album = snapshot.data![index];
return Card(
  child: ListTile(
    leading: CircleAvatar(
      child: Image.network('https://cdn2.vectorstock.com/i/1000x1000/26/01/young-executive-woman-profile-icon-vector-9692601.jpg'),
    ),
    title: Text(index.toString()),
    subtitle: Text(album.title),
    trailing: Icon(Icons.visibility),
    onTap: () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: Center(child: Text(album.title)),
          );
        },
      );
    },
  ),
);

              },
            );
        
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return const Text('text loading');
        }),)
          
        ),
      );
  }
}
