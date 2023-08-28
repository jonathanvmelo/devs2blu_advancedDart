import 'package:flutter/material.dart';
import 'package:flutter_advanced_dart/exercises/exe02_exe03/repositories/home_repository02.dart';
import 'package:flutter_advanced_dart/exercises/exe02_exe03/widgets/list_tile_gif.dart';

class HomePageExe03 extends StatefulWidget {
  const HomePageExe03({super.key});

  @override
  State<HomePageExe03> createState() => _HomePageExe03State();
}

class _HomePageExe03State extends State<HomePageExe03> {
  bool inSearch = false;
  String currentSearch = "";

  AppBar getAppBar() {
    if (inSearch) {
      return AppBar(
        title: TextField(
          onSubmitted: (value) {
            if (value.isEmpty) {
              return;
            }
            setState(() {
              currentSearch = value;
            });
          },
          decoration: const InputDecoration(labelText: "Pesquise aqui"),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  inSearch = false;
                });
              },
              icon: const Icon(Icons.cancel_outlined))
        ],
      );
    }
    return AppBar(
      title: const Text(" Tenor: Página inicial"),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                inSearch = true;
              });
            },
            icon: const Icon(Icons.search))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: FutureBuilder(
        future: (this.currentSearch.isEmpty)
            ? HomeRepository02.getTenor()
            : HomeRepository02.search(currentSearch, 30),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if ((!snapshot.hasData) ||
              (snapshot.connectionState == ConnectionState.waiting)) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 120,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7),
              itemBuilder: (context, index) {
                return ListTileGif(tenorGif: snapshot.data![index]);
              },
            ),
          );
        },
      ),
    );
  }
}
