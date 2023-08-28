import 'package:flutter/material.dart';
import 'package:flutter_advanced_dart/exercises/exe01/repositories/home_repository.dart';
import 'package:flutter_advanced_dart/exercises/exe01/widgets/person_tile.dart';

class HomePageExe01 extends StatefulWidget {
  HomePageExe01({super.key});

  @override
  State<HomePageExe01> createState() => _HomePageExe01State();
}

class _HomePageExe01State extends State<HomePageExe01> {
  int? page;

  // HomeRepository repository;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Star Wars - Personagens - Página ${(page ?? 1)}"),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: ((page ?? 1) <= 1
                ? null
                : () {
                    setState(() {
                      page = (page ?? 1) - 1;
                    });
                  }),
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.arrow_circle_up),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                page = (page ?? 1) + 1;
              });
            },
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.arrow_circle_down),
          )
        ],
      ),
      body: FutureBuilder(
        future: HomeRepository.getPerson(page),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if ((!snapshot.hasData) ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return PersonTile(person: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}
