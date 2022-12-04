import 'package:flutter/material.dart';
import 'package:flutter_mockito_unit_test/album_dto.dart';
import 'package:flutter_mockito_unit_test/api_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiRepository apiRepository = ApiRepository();
  List<AlbumDto> list = [];
  bool? isLoading;
  @override
  void initState() {
    loadAlbumList();
    super.initState();
  }

  Future loadAlbumList() async {
    isLoading = true;
    var albums = await ApiRepository().fetchAlbum();
    if (albums == null)
      return false;
    else
      list.add(albums);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  title: Text("Title: " + list[index].title!),
                ),
              );
            }));
  }
}
