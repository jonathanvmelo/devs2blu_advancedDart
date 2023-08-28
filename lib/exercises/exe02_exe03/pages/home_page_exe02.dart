import 'package:flutter/material.dart';
import 'package:flutter_advanced_dart/exercises/exe01/repositories/home_repository.dart';
import 'package:flutter_advanced_dart/exercises/exe02_exe03/repositories/home_repository02.dart';

import '../widgets/list_tile_gif.dart';

class HomePageExe02 extends StatelessWidget {
  const HomePageExe02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tenor: Página inicial"),
      ),
      body: FutureBuilder(
        future: HomeRepository02.getTenor(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text(snapshot.error.toString());

          if ((!snapshot.hasData) ||
              (snapshot.connectionState == ConnectionState.waiting))
            return const Center(child: CircularProgressIndicator());

          return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.70,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return ListTileGif(tenorGif: snapshot.data![index]);
              });
        },
      ),
    );
  }
}
