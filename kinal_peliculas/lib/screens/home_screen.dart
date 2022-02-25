import 'package:flutter/material.dart';
import 'package:kinal_peliculas/providers/movies_provider.dart';
import 'package:kinal_peliculas/search/search_delegate.dart';
import 'package:kinal_peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  String get searchFieldLabel => 'Buscar pelicula';

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),

              // Listado horizontal de pelis
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Populares',
                onNextPage: () => moviesProvider.getOnDisplayMovies(),
              )
            ],
          ),
        ));
  }
}
